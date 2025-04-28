# Instagram KPI Analyzer 📈

Este proyecto permite descargar datos de publicaciones públicas de Instagram, calcular indicadores clave de desempeño (KPIs) como el Engagement Rate, y visualizar su evolución de forma sencilla utilizando R.

---

## 🚀 Características
- Descarga automática de publicaciones de un usuario público de Instagram usando **Instaloader**.
- Cálculo de métricas como **likes**, **comentarios** y **engagement rate**.
- Visualización de los KPIs a lo largo del tiempo mediante gráficos interactivos.
- Código modular y fácil de adaptar para otros análisis.

---

## 🛠️ Requisitos

- [Python 3.x](https://www.python.org/downloads/)
- [Instaloader](https://instaloader.github.io/) (`pip install instaloader`)
- [R](https://cran.r-project.org/) y RStudio
- Paquetes R:
  - `reticulate`
  - `tidyverse`
  - `jsonlite`

---

## 📦 Instalación

1. Clona este repositorio:
   ```bash
   git clone https://github.com/LoboGuardian/Instagram-KPI-Analyzer.git
   cd Instagram-KPI-Analyzer
   cd Instagram-KPI-Analyzer
   ```

2. Instala los paquetes de R necesarios:

```r
install.packages(c("reticulate", "tidyverse", "jsonlite"))
```

3. Asegúrate de tener Instaloader en tu sistema:

```bash
pip install instaloader
```

## 🚴‍♂️ Uso

1. Abre el script descargar_kpi_instagram.R en RStudio.

2. Modifica el nombre de usuario de Instagram que deseas analizar:

```r
usuario_instagram <- "nasa"
```

3. Ejecuta el script completo o usa:

```r
source("descargar_kpi_instagram.R")
```

El script descargará los datos, calculará KPIs y generará un gráfico de evolución del engagement.

## 📊 Ejemplo de gráfico generado

(Aquí puedes poner una captura de pantalla del gráfico una vez lo tengas.)

## 📜 Licencia

Este proyecto está licenciado bajo la licencia MIT - consulta el archivo LICENSE para más detalles.

## 🤝 Contribuciones
¡Las contribuciones son bienvenidas! Si tienes ideas para mejorar el proyecto, no dudes en hacer un fork y enviar un pull request.