#!/bin/bash
echo "Lanzando servidor web..."
docker run -d -P --name server01 -p 2221:22 -p 8000:80
echo "Servidor desplegado."
