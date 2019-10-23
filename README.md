# Movie App iOS
> Aplication iOS para visaualizar Películas o Series de Telivisión exploantado la API de: [https://api.themoviedb.org/3](https://developers.themoviedb.org/)

[![Swift Version][swift-image]][swift-url]
[![Swift Version][swift-image]][swift-url]
[![Carthage compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/Carthage/Carthage)
[![CocoaPods Compatible](https://img.shields.io/cocoapods/v/EZSwiftExtensions.svg)](https://img.shields.io/cocoapods/v/LFAlertController.svg)  
[![Platform](https://img.shields.io/cocoapods/p/LFAlertController.svg?style=flat)](http://cocoapods.org/pods/LFAlertController)

La aplicación está creada con la arquitectura VIPER


## Carácteristicas

- [x] Despliegue de Películas Populares (Popular) [Online/Offline]
- [x] Despliegue de Películas Más Valoradas (Top Rated) [Online/Offline]
- [x] Despliegue de Películas en Próximos lanzamientos (Upcoming) [Online/Offline]
- [x] Búsqueda de Películas Online
- [x] Despliegue de Series de Televisión Populares (Popular) [Online/Offline]
- [x] Despliegue de Series de Televisión Más Valoradas (Top Rated) [Online/Offline]
- [x] Búsqueda de Series de Televisión Online

## Requeriminetos

- iOS 11.0+
- Xcode 11.1

## Instalación

#### CocoaPods

```ruby
pod install
```

## Capas de la Aplicación
####Vista
 Es la capa que solo debe interactuar con el usuario, tal como gestos al dar tap en un botón o componentes de UI, en el flujo VIPER es quien se comunica con el Interactor.
 
	- MoviesViewController
	- MediaDetailViewController
	- SearchMediaViewController
 
####Presenter
 Es la capa que se comunica con las demás capas, en pocas palabras es la capa encargada de tomar decisiones para obtener datos, repintar UI, comunicarse con el Router para empujar otras vistas.
 
	- MoviesPresenter
	- MediaDetailPresenter
	- SearchMediaPresenter

####Interactor
Esta capa contiene la lógica del negocio, principalmente los llamados a la capa de servicio (API), y tiene como principal socio al Presenter cada que termina de hacer una petición a la API, para notificar si tuvo éxito o no en las peticiones que se realizaron.

	- MoviesInteractor
	- MediaDetailInteractor
	- SearchMediaInteractor

####Router
 Es la capa encargada de crear módulos a través de UINAvigationController, se pueden crear módulos ya sea por UIStoryboard o simplemente instanciando Controllers via xib file, y a su vez también es la capa responsable de mostrar las alertas.
 
	- MoviesRouter
	- MediaDetailRouter
	- SearchMediaRouter
 
#### Entity 
Capa Encargada de de Objetos o Estructuras manejados por el Interactor para ser llevados entre las capas del flujo VIPER, cabe resaltar que pueden ser comunes los objetos para cada una de las escenas/flujos que se llegasen a construir dentro de la aplicación.

	- MediaModel
	- VideoModel


Además se utilizó un Manager para la comunicación con la API, utilizando un patrón de diseño convertible con Enums para realizar los llamados a la capa de servicio.

La capa de Persistencia, se la delega a Alamofire con un DataResponse para mantenerlo en caché, dado que las respuestas de la API, se actualizan día a día y no es necesario usar algún ORM como Realm o SQLLite

## Conclusiones
1. En qué consiste el principio de responsabilidad única? 
	- Single Responsability Principle, menciona que una clase debe tener solo una razón para cambiar y este mismo principio se puede aplicar a métodos y/o funciones.


2. Cuál es su propósito?
	- Separar, aislar y encapsular cada clase con métodos y funciones con responsabilidad única.
	- Extraer la lógica de negocio de los ViewControllers.
	- Tener componente reutilizables en proyectos grandes o pequeños.


3. Qué características tiene, según su opinión, un “buen” código o código limpio
	- Que siga una arquitectura y patrones de diseño
	- Entiendase por arquitectura todo aquello que tenga que ver con la organización de alto nivel en toda la aplicación. Una buena arquitectura garantiza que todos los llamados a métodos y funciones se reproduzcan bien
	- Por último un patrón de diseño es todo aquello que tiene que ver con el paradigma de programación de bajo nivel para hacer un feature.


## Meta

Erik Vera Montoya – [@apcxiii](https://twitter.com/apcxiii) – apcxiii@gmail.com

Distributed under the XYZ license. See ``LICENSE`` for more information.

[https://github.com/apcxiii](https://github.com/apcxiii)

[swift-image]:https://img.shields.io/badge/swift-5.0-orange.svg
[swift-url]: https://swift.org/
[license-image]: https://img.shields.io/badge/License-MIT-blue.svg
[license-url]: LICENSE
[travis-url]: https://travis-ci.org/dbader/node-datadog-metrics
[codebeat-image]: https://codebeat.co/badges/c19b47ea-2f9d-45df-8458-b2d952fe9dad
[codebeat-url]: https://codebeat.co/projects/github-com-vsouza-awesomeios-com
[movie-db-image]: https://www.themoviedb.org/assets/2/v4/logos/primary-green-d70eebe18a5eb5b166d5c1ef0796715b8d1a2cbc698f96d311d62f894ae87085.svg
[movie-url-api]: https://developers.themoviedb.org/3/
