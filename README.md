# Trabajo Práctico Final de Promoción

#### Taller de Tecnologías de Producción de Software - Opción Ruby

El sistema consiste en una red social para lectores, donde éstos pueden gestionar sus lecturas, dejar sus opiniones sobre los libros y recomendarlos a sus seguidores.

## El sistema se desarrolló con las siguientes herramientas:

- Ruby 2.5.1 como lenguaje de programación
- Rails 5.2 como framework
- Elasticsearch
- SQLite3 como motor de BD

## Pasos para levantar la aplicación:

- Clonar el repositorio
- Pararse sobre la carpeta donde se clonó
- Arrancar el servicio de Elasticsearch con `sudo -i service elasticsearch start`
- Para instalar las dependencias correr `bundle install`
- Para crear la base de datos en SQLite correr `rails db:migrate`
- Para agregar datos a la base de datos correr `rails db:seed`. Este comando creará 8 libros, 5 autores y 5 géneros. Además, agregará dos usuarios: uno administrador y otro normal público.
- Para crear el archivo de variables de entorno correr `bundle exec figaro install`. Para poder loguearse con Facebook hará falta agregar `FACEBOOK_CLIENT_ID` y `FACEBOOK_CLIENT_SECRET` en `config/application.yml`. Por cuestiones de seguridad, los valores de estas variables no están en el repositorio.
- Para levantar el servidor correr `rails s`


## Fixes

- Si ocurre algún error con Elasticsearch, habría que entrar a la consola de Rails con el comando `rails c` e importar los índices para los modelos de la siguiente manera:
  - `Book.import(force: true)`
  - `Author.import(force: true)`
  - `Genre.import(force: true)`
