#!/bin/bash

VOL_CMD="vol"


cat << "EOF"
╭━━━╮╱╱╱╱╱╭╮
╰╮╭╮┃╱╱╱╱╱┃┃
╱┃┃┃┣╮╭┳╮╭┫╰━┳━━┳━┳━━┳╮╭╮
╱┃┃┃┃┃┃┃╰╯┃╭╮┃╭╮┃╭┫╭╮┃╰╯┃
╭╯╰╯┃╰╯┃┃┃┃╰╯┃╰╯┃┃┃╭╮┃┃┃┃
╰━━━┻━━┻┻┻┻━━┻━━┻╯╰╯╰┻┻┻╯

            __     __
           /  \~~~/  \
     ,----(     ..    )
    /      \__     __/
   /|         (\  |(
  ^ \   /___\  /\ |
     |__|   |__|-"  

EOF



echo "=========================================="
echo "    Analizador de RAM con Volatility 3    "
echo "=========================================="

if [ -z "$1" ]; then
    echo "Uso: $0 <ruta_al_volcado_de_memoria>"
    echo "Ejemplo: $0 /forense/test.raw"
    exit 1
fi

MEM_FILE="$1"

if [ ! -f "$MEM_FILE" ]; then
    echo "Error: No se encuentra el archivo $MEM_FILE"
    exit 1
fi

while true; do
    echo ""
    echo "------------------------------------------"
    echo "Archivo actual: $MEM_FILE"
    echo "Selecciona una opción:"
    echo "1) Información general del sistema (windows.info)"
    echo "2) Lista de procesos (windows.pslist)"
    echo "3) Árbol de procesos (windows.pstree)"
    echo "4) Buscar código inyectado / malware (windows.malfind)"
    echo "5) Listar DLLs (windows.dlllist)"
    echo "6) Argumentos de línea de comandos (windows.cmdline)"
    echo "7) Volcar la memoria de un proceso (dump)"
    echo "8) Salir"
    echo -n "Opción: "
    read opcion

    case $opcion in
        1)
            $VOL_CMD -f "$MEM_FILE" windows.info
            ;;
        2)
            $VOL_CMD -f "$MEM_FILE" windows.pslist
            ;;
        3)
            $VOL_CMD -f "$MEM_FILE" windows.pstree
            ;;
        4)
            $VOL_CMD -f "$MEM_FILE" windows.malfind
            ;;
        5)
            $VOL_CMD -f "$MEM_FILE" windows.dlllist
            ;;
        6)
            $VOL_CMD -f "$MEM_FILE" windows.cmdline
            ;;
        7)
            echo -n "Introduce el PID del proceso a volcar: "
            read pid
            echo -n "Directorio de destino (ej. ./dump): "
            read dumpdir

            mkdir -p "$dumpdir"
            echo "Volcando proceso $pid en $dumpdir..."

            $VOL_CMD -f "$MEM_FILE" -o "$dumpdir" windows.pslist --pid "$pid" --dump

            echo "Volcado completado. Revisa $dumpdir"

            ;;
        8)
            echo "Saliendo del script..."
            exit 0
            ;;
        *)
            echo "Opción no válida. Por favor, selecciona del 1 al 8."
            ;;
    esac
done
           