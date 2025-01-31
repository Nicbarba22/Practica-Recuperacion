#INTRODUCCION

# Despliegue de CMS en Infraestructura de Alta Disponibilidad con Vagrant y VirtualBox

Este proyecto tiene como objetivo desplegar un CMS (OwnCloud o Joomla, a elección del alumno) en una infraestructura de alta disponibilidad de 3 capas utilizando una pila LEMP (Linux, Nginx, MariaDB, PHP-FPM). La infraestructura se despliega localmente utilizando Vagrant y VirtualBox, y está diseñada para garantizar un rendimiento óptimo y alta disponibilidad en el servicio.

La estructura de la infraestructura es la siguiente:

- **Capa 1 (Expuesta a red pública)**: Una máquina con balanceador de carga Nginx.
- **Capa 2 (BackEnd)**: Dos máquinas con servidor web Nginx cada una y una máquina con servidor NFS y motor PHP-FPM.
- **Capa 3 (Datos)**: Una máquina con base de datos MariaDB.

Los servidores web compartirán una carpeta por NFS desde el servidor NFS, y además, utilizarán el motor PHP-FPM que está instalado en el mismo servidor que el servicio NFS. La configuración se realiza mediante ficheros de provisionamiento, lo que facilita la replicación y automatización del despliegue.

## Estructura del Proyecto

Este proyecto incluye el archivo `Vagrantfile`, que define la infraestructura de máquinas virtuales y sus configuraciones. Las máquinas virtuales se crearán y provisionarán automáticamente a través de Vagrant.

. **Balanceador (balanceadorNico)**: Esta máquina tiene instalado Nginx, configurado como balanceador de carga. Su tarea es distribuir el tráfico de la red pública entre los dos servidores web en la capa 2, asegurando que la carga se reparta de manera equilibrada para mejorar la disponibilidad y el rendimiento del CMS.

2. **Server NFS (ServernfsNico)**: Este servidor tiene configurados tanto el servicio NFS como PHP-FPM. El servicio NFS comparte una carpeta entre los servidores web, permitiendo que ambos servidores accedan y gestionen los mismos archivos. PHP-FPM está configurado para trabajar junto con los servidores web, facilitando la ejecución de PHP en las máquinas backend.

3. **Servidores Web (Serverweb1Nico y Serverweb2Nico)**: Estos dos servidores ejecutan Nginx y están configurados para manejar las peticiones de los usuarios. Ambos servidores se conectan al servidor NFS para acceder a los archivos compartidos, y utilizan PHP-FPM del servidor NFS para procesar las solicitudes PHP, asegurando un funcionamiento eficiente y escalable del CMS.

4. **Base de Datos (ServerdatosNico)**: La base de datos MariaDB se encuentra en una máquina aislada en la capa 3. Esta base de datos es accesible desde los servidores web a través de la red privada, y almacena toda la información necesaria para el funcionamiento del CMS.

