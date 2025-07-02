# Proyecto DevOps: CI/CD Pipeline con AWS

Este repositorio contiene el proyecto **Netflix-project**, enfocado en la implementación de un pipeline de CI/CD (Integración Continua/Entrega Continua) utilizando servicios de AWS para automatizar el proceso de desarrollo, pruebas y despliegue de aplicaciones.

## Descripción del Proyecto:

Este proyecto implementa una solución completa de CI/CD en AWS que permite a los equipos de desarrollo entregar código de manera rápida y confiable. La solución utiliza varios servicios de AWS para crear un pipeline automatizado que abarca desde el control de código fuente hasta el despliegue en producción.

## Arquitectura de la Solución:

![Arquitectura CI/CD AWS](/images/arquitectura-cicd-aws.gif)

La arquitectura implementada consta de los siguientes componentes:

- **GitHub**: Repositorio del codigo fuente de la aplicación.
- **AWS CodeBuild**: Servicio de compilación totalmente administrado que compila el código fuente, ejecuta pruebas y produce artefactos listos para el despliegue.
- **AWS CodeDeploy**: Servicio que automatiza los despliegues de aplicaciones en instancias EC2, funciones Lambda y servicios ECS.
- **AWS CodePipeline**: Servicio de entrega continua que automatiza las fases de lanzamiento para una entrega rápida y confiable.
- **Amazon S3**: Almacenamiento de artefactos generados durante el proceso de compilación.
- **DockerHub**: Repositorio para las imagenes construidas.
- **Parameter Store**: Guardar las credenciales de DockerHub y la API Key creada en https://www.themoviedb.org/.

## Flujo del Pipeline CI/CD:

![Flujo del Pipeline](/images/flujo-pipeline.png)

1. **Fase de Origen**: Los desarrolladores envían código al repositorio CodeCommit.
2. **Fase de Compilación**: CodeBuild compila el código fuente, ejecuta pruebas unitarias y crea artefactos.
3. **Fase de Pruebas**: Se ejecutan pruebas automatizadas para validar la calidad del código.
4. **Fase de Despliegue**: CodeDeploy implementa la aplicación en el entorno de destino.
5. **Monitoreo**: CloudWatch supervisa el rendimiento y la salud de la aplicación.

## Estructura del Proyecto:

```
Netflix-project/
├── buildspec.yml       # Configuración para AWS CodeBuild
├── appspec.yml         # Configuración para AWS CodeDeploy
├── scripts/            # Scripts de automatización y despliegue
├── src/                # Código fuente de la aplicación
├── public/             # Informacion de imagenes de la aplicación
├── images/             # Imágenes para documentación
└── README.md           # Explicación del proyecto
└── otros archivos      # Archivos para el funcionamiento de la aplicación

## Requisitos Previos

- [Cuenta de AWS](https://aws.amazon.com/)
- [AWS CLI](https://aws.amazon.com/cli/) configurado con las credenciales adecuadas
- [Git](https://git-scm.com/)
- [Docker](https://www.docker.com/) (para desarrollo local)
- Conocimientos básicos de servicios AWS y CI/CD

## Configuración del Proyecto

1. Clona el repositorio:
    ```bash
    git clone https://github.com/daniel2688/Netflix-project.git
    cd Netflix-project
    ```

## Uso del Pipeline

![Panel de Control](/images/dashboard-pipeline.png)

- Realiza cambios en el código fuente y envíalos al repositorio CodeCommit.
- El pipeline se activará automáticamente y ejecutará todas las fases configuradas.
- Monitorea el progreso del pipeline a través de la consola de AWS CodePipeline.
- Verifica los logs de cada fase en CloudWatch Logs para solucionar problemas.

## Mejoras Adicionales para el proyecto

- **Infraestructura como Código**: hacer uso de herramientas IaC para el despliegue del proyecto.
- **Entornos Separados**: Configuración de entornos de desarrollo, pruebas y producción.
- **Pruebas Automatizadas**: Integración de pruebas unitarias, de integración y de rendimiento.
- **Seguridad**: Implementación de políticas IAM con privilegios mínimos y cifrado de datos.
- **Monitoreo**: Configuración de alarmas y dashboards en CloudWatch.

## Contribución

Las contribuciones son bienvenidas. Por favor, abre un issue o pull request para sugerencias o mejoras.

## Licencia

Este proyecto está bajo la licencia MIT.

---

> Nota: Las imágenes de este README son representativas del flujo de trabajo implementado. Asegúrate de reemplazarlas con capturas reales de tu implementación específica.
