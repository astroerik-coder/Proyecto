
# Yu-Gi-Oh! Card Listing App

Esta es una aplicación de Flutter diseñada para listar, filtrar y visualizar cartas de Yu-Gi-Oh! utilizando una API externa. La app cuenta con un diseño oscuro inspirado en el estilo futurista de Yu-Gi-Oh!, con colores predominantes en negro y morado.

## Características

- **Búsqueda dinámica**: Filtra las cartas por nombre, tipo, raza y arquetipo.
- **Visualización detallada**: Muestra información completa de cada carta, incluyendo imágenes, descripción, conjuntos y precios.
- **Carga paginada**: La app carga las cartas en lotes de 10, con la posibilidad de cargar más al desplazarse hacia abajo.
- **Modo oscuro**: Interfaz elegante en negro y morado, con detalles inspirados en el universo de Yu-Gi-Oh!.
- **Responsive**: Adaptación a distintos tamaños de pantalla para garantizar una experiencia óptima en dispositivos móviles.
- **Botón flotante**: Regresa rápidamente al inicio de la lista con un botón flotante.

## Instalación

### Requisitos previos
- Flutter 3.22.2 o superior
- Dart SDK
- Conexión a internet para acceder a la API de Yu-Gi-Oh!

### Clonar el repositorio

```bash
git clone https://github.com/usuario/yugioh-card-listing-app.git
cd yugioh-card-listing-app
```

### Dependencias

Instala las dependencias del proyecto ejecutando el siguiente comando:

```bash
flutter pub get
```

## Uso

1. **Ejecutar la aplicación**:

```bash
flutter run
```

2. La aplicación cargará las primeras 10 cartas automáticamente. Usa la barra de búsqueda y los filtros para refinar los resultados.

3. Haz clic en cualquier carta para ver los detalles completos.

## Estructura del Proyecto

- **components/atoms**: Contiene los componentes más simples como botones, texto estilizado, campos de búsqueda, etc.
- **components/molecules**: Componentes más complejos que combinan varios átomos, como los ítems de cartas o las barras de filtro.
- **components/organisms**: Estructuras completas que combinan moléculas y átomos para construir la funcionalidad de una página.
- **providers**: Lógica de estado para manejar la carga de datos desde la API y el manejo de los filtros.
- **models**: Modelos de datos que representan las cartas y sus propiedades.


## API

Esta aplicación utiliza la API de Yu-Gi-Oh! para obtener los datos de las cartas:

- [Yu-Gi-Oh! API](https://db.ygoprodeck.com/api/v7/cardinfo.php)


## Contribuciones

Si deseas contribuir a este proyecto, por favor abre un issue o realiza un pull request.

## Licencia

Este proyecto está licenciado bajo la MIT License.
