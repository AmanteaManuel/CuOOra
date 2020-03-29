Class {
	#name : #Usuario,
	#superclass : #Object,
	#instVars : [
		'nombreUsuario',
		'contrasenia',
		'fecha',
		'hora',
		'topicosDeInteres',
		'posts',
		'follows'
	],
	#category : #CuOOra
}

{ #category : #'instance creation' }
Usuario class >> newUsuario: unNombreUsuario contrasenia: unaContrasenia [ 
]

{ #category : #methods }
Usuario >> agregarPregunta: tituloStr descripcion: descripcionStr topicos: coleccTopicos [
]

{ #category : #methods }
Usuario >> agregarRespuesta: descripcionStr pregunta: unaPregunta [

]

{ #category : #methods }
Usuario >> agregarTopico: unNombre descripcion: unaDescripcion [
]

{ #category : #methods }
Usuario >> agregarTopicoInteres: unTopico [

]

{ #category : #methods }
Usuario >> calcularPuntaje [
]

{ #category : #methods }
Usuario >> cantidadPreguntas [
]

{ #category : #methods }
Usuario >> cantidadRespuestas [
]

{ #category : #methods }
Usuario >> darDislike: unPost [

]

{ #category : #methods }
Usuario >> darLike: unPost [

]

{ #category : #methods }
Usuario >> diferenciaLikeDislikes [
]

{ #category : #methods }
Usuario >> eliminarPregunta: unaPregunta [
]

{ #category : #initialization }
Usuario >> initialize [
]

{ #category : #methods }
Usuario >> sacarDislike: unPost [

]

{ #category : #methods }
Usuario >> sacarLike: unPost [

]

{ #category : #methods }
Usuario >> seguirUsuario: unUsuario [
]

{ #category : #methods }
Usuario >> sigueAUsuario: unUsuario [
]

{ #category : #methods }
Usuario >> topicosInteres [
"getter coleccion"
]
