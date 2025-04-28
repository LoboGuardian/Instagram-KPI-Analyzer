# Instalar paquetes si no los tienes
if (!require(reticulate)) install.packages("reticulate")
if (!require(tidyverse)) install.packages("tidyverse")
if (!require(dotenv)) install.packages("dotenv")

# Cargar librerías
library(reticulate)
library(tidyverse)
library(dotenv)

# Cargar variables del archivo .env
load_dot_env()

# Leer las variables
usuario_instagram <- Sys.getenv("USUARIO_INSTAGRAM")
seguidores_totales <- as.numeric(Sys.getenv("SEGUIDORES_TOTALES"))

# Configurar entorno Python
py_config()

# Importar Instaloader
instaloader <- import("instaloader")

# Crear instancia de Instaloader
L <- instaloader$Instaloader()

# Función para descargar el perfil completo
descargar_perfil <- function(username) {
  message("Descargando datos del perfil: ", username)
  L$download_profile(username, profile_pic_only = FALSE)
}

# Descargar perfil
descargar_perfil(usuario_instagram)

# Cargar archivos JSON con los metadatos
ruta_posts <- list.files(path = usuario_instagram, pattern = "*.json", full.names = TRUE)

# Leer todos los JSON
posts_data <- map_dfr(ruta_posts, ~ jsonlite::fromJSON(.x) %>% as.data.frame())

# Calcular el engagement
posts_data <- posts_data %>%
  mutate(
    likes = edge_liked_by$count,
    comments = edge_media_to_comment$count,
    engagement_rate = (likes + comments) / seguidores_totales,
    fecha_post = as.POSIXct(taken_at_timestamp, origin = "1970-01-01")
  )

# Mostrar resumen de KPIs
posts_data %>%
  select(fecha_post, likes, comments, engagement_rate) %>%
  print()

# Graficar el Engagement a lo largo del tiempo
ggplot(posts_data, aes(x = fecha_post, y = engagement_rate)) +
  geom_line(color = "darkorange", size = 1.2) +
  geom_point(color = "steelblue", size = 2) +
  labs(title = paste("Evolución del Engagement Rate -", usuario_instagram),
       x = "Fecha",
       y = "Engagement Rate") +
  theme_minimal()
