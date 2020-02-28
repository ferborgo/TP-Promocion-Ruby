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
- Por defecto, el sistema se ejecutará en http://localhost:3000/
- Para ingresar como administrador, usar el email 'admin@admin.com' y contraseña 'password'
- Para ingresar como un usuario normal y público, usar el email 'example@gmail.com' y contraseña 'password'

## Fixes

- Si ocurre algún error con Elasticsearch, habría que entrar a la consola de Rails con el comando `rails c` e importar los índices para los modelos de la siguiente manera:
  - `Book.import(force: true)`
  - `Author.import(force: true)`
  - `Genre.import(force: true)`
  
  
## Especificaciones funcionales
 
Los usuarios podrán, principalmente, realizar las siguientres tres acciones:

#### 1. Gestionar sus lecturas

Los usuarios pueden buscar libros en el buscador por distintos filtros (género, autor, cantidad de páginas, etc.), agregarlos a su propio 'catálogo' en un estado específico: leído, por leer, abandonado o en curso. 

#### 2. Recomendar libros a otros usuarios.

Los usuarios pueden recomendar libros. No es directamente contra algún usuario, sino que, al recomendar el libro, se realiza una publicación en el perfil del usuario. Cuando otro usuario entra en ese perfil, puede ver la publicación de la recomendación. Puede, opcionalmente, dejar un motivo de esa recomendación.

#### 3. Dejar opiniones sobre los libros.

Los usuarios pueden calificar de manera numérica y dejar una opinión escrita sobre cualquier libro. Así, cuando un usuario entra en el detalle de un libro puede ver el promedio de calificación del mismo y un listado de opiniones. Además, los usuarios pueden 'darle me gusta' a las opiniones del resto de los usuarios.

## Aspectos más específicos

#### Los perfiles de los usuarios son públicos por defecto.

Esto quiere decir que cualquier usuario puede ver el perfil de otro: ver su catálogo personal de libros (con sus estados de leído, por leer, abandonado, en curso), sus opiniones/calificaciones y sus datos personales básicos (nombre, apellido, fecha de nacimiento, nacionalidad).

#### Los perfiles de los usuarios pueden ser privados.

Los usuarios con perfil privado sólo usarían el sistema para la búsqueda de libros y gestión personal de los mismos. No podrían dejar calificaciones ni opiniones ni recomendar libros. Además, ningún usuario podría ver su catálogo personal ni datos personales.

#### Roles y permisos.

Hay usuarios normales y administradores. Los usuarios normales pueden ser públicos o privados. Las diferencias entre ambos están mencionadas a lo largo del documento. No tienen ningún tipo de permiso de escritura contra libros o autores.
Los usuarios administradores pueden agregar, modificar y eliminar autores, libros y géneros.

#### Notificaciones

Los usuarios públicos pueden 'seguir' a otros usuarios y recibir notificaciones en caso de que recomienden algún libro, le den 'me gusta' a una opinión propia o los empiecen a seguir.

#### Los usuarios pueden loguearse con Facebook

Para registrarse al sitio, pueden optar por la manera típica, eligiendo un usuario y contraseña, o con su cuenta de Facebook.
