# README

# Ruby on Rails

Proyecto generado utilizando el Framework de [Ruby on Rails](https://rubyonrails.org/). En el se podrá encontrar un la funcionalidad que un usuario pueda cargar un archivo Excel (.xlsx).

## Instalación

Para la instalación de este proyecto se listan una serie de pasos para la utilización del mismo:

#### Requerimientos
Antes de empezar a utilizar este proyecto se tienen que cumplir con los requerimientos necesarios para su correcto funcionamientos tal como:

* **Ruby Version:** ruby 3.4.5 (2025-07-16 revision 20cda200d3)
* **Rails Version:** Rails 8.0.2.1

Si ya tu equipo ya cuenta con los requerimientos necesarios prosigue con lo siguiente:

1. Descargar o clonar el proyecto.
2. Abrir consola o terminar y ejecutar el siguiente comando:

```bash
  bin/rails db:migrate
```
Lo anterior para que se ejecuten migrates y puedan ser generadas las tablas correspondientes.

3. Instalación de dependencias del Gemfile con el comando:

```bash
  bundle install
```

4. Arrancar el proyecto para su utilización con el comando:

```bash
  bin/dev
```

5. Iniciado el proyecto, puedes acceder a el mediante el link [localhost:3000](localhost:3000)

## Pruebas

Para la realización de las pruebas necesitas generar un archivo Excel con la información que se muestra a continuación:

| Cliente | Descripción del Producto | Precio por pieza | Numero de piezas | Diección del vendedor | Nombre del Vendedor |
| :------ | :----------------------- | :--------------- | :--------------- | :-------------------- | :------------------ |
| Mario | Banco | 880 | 1 | Merida, Yuc | Montse |
| Jorge | Banco | 880 | 2 | Merida, Yuc | Montse |
| Enrique | Mesa | 1099 | 1 | Tizimin, Yuc | Joel |
| Alejandro | Mesa | 1099 | 4 | Tizimin, Yuc | Joel |
| Jorge | Mesa | 1099 | 1 | Tizimin, Yuc | Joel |
| Mario | Silla | 790 | 2 | Merida, Yuc | Montse |
| Alejandro | Silla | 790 | 3 | Merida, Yuc | Montse |
| Enrique | Banco | 880 | 1 | Merida, Yuc | Montse |
| Jorge | Mesa | 1099 | 4 | Tizimin, Yuc | Joel |
| Mario | Silla | 790 | 2 | Merida, Yuc | Montse |
| Mario | Banco | 880 | 3 | Merida, Yuc | Montse |
| Alejandro | Banco | 880 | 1 | Tizimin, Yuc | Joel |
| Alejandro | Silla | 790 | 2 | Tizimin, Yuc | Joel |
| Enrique | Mesa | 1099 | 3 | Tizimin, Yuc | Joel |
| Jorge | Silla | 790 | 4 | Merida, Yuc | Montse |

Una vez generado este archivo es el que será cargado en la vista principal y posterior le das clic al botón de 'Import'.

Despues de realizar lo anterior el proyecto se encargará de cargar y guardar la información.

## Consulta de información

Para verificar la información que se encuentra guardada accederemos a la consola de proyecto ejecutando el siguiente comando en tu consola o terminal:

```bash
  bin/rails console
```

Ya accediendo a la consola la información puede ser consultada en las siguientes tablas:
* Customers
* Products
* Sales
* Sellers

Para obtener la información se ejecuta el siguiente comando:

```bash
  Customer.all
```

Este comando nos mostrará que con el excel que fue cargado realizó el registro de 4 clientes nuevos.

```bash
  Product.all
```
Este comando nos mostrará que con el excel que fue cargado realizó el registro de 3 productos nuevos.

```bash
  Sale.all
```

Este comando nos mostrará que con el excel que fue cargado realizó el registro de 15 ventas nuevas.

```bash
  Seller.all
```

Este comando nos mostrará que con el excel que fue cargado realizó el registro de 2 vendedores nuevos.


## Autor

- [@RubenHuchin](https://github.com/rhuchin2105)

