# DumboRAM

DumboRAM es una herramienta hecha para automatizar tareas básicas de análisis y extracción de información contenida en la memoria RAM.  
Está pensada para facilitar el uso de Volatility3 mediante un menú facil de entender, de forma que se pueda consultar información del sistema, listar procesos, revisar DLLs y volcar procesos desde un volcado de memoria.

Esta herramienta está orientada a usuarios que tengan unos conocimientos básicos de análisis forense y quieran trabajar de forma más cómoda sobre imágenes de memoria.

# Funciones Principales

- Mostrar información general del sistema analizado
- Listar procesos en ejecución
- Mostrar el árbol de procesos
- Buscar regiones de memoria sospechosas o posible código inyectado
- Listar DLLs cargadas por los procesos
- Mostrar argumentos de línea de comandos
- Volcar la memoria de un proceso concreto

## Requisitos

- Linux (preferiblemente una distribución basada en Debian o Kali Linux)
- Python 3
- Entorno virtual de Python recomendado
- Volatility 3 instalado
- Un volcado de memoria RAM, por ejemplo en formato `.raw`

#Responsabilidad y Uso Ético

El autor de este software no asume ninguna responsabilidad por el uso indebido del software o cualquier daño que pueda resultar del uso de este software. El usuario es el único responsable de su uso y debe utilizarlo de manera ética y legal.

El autor de este software no será responsable de ninguna pérdida, daño o consecuencia que resulte del uso de este software.
Por favor, utilice este software con responsabilidad y de acuerdo con las leyes y regulaciones aplicables en su jurisdicción.
