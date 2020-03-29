"
""Clase usuario""
"
Class {
	#name : #Usuario,
	#superclass : #Object,
	#instVars : [
		'nombreUsuario',
		'contrasenia',
		'fechaHora',
		'topicosDeInteres',
		'posts',
		'follows'
	],
	#category : #CuOOra
}

{ #category : #'instance creation' }
Usuario class >> nombreUsuario: unNombreUsuario contrasenia: unaContrasenia [ 
   ^(self new
	nombreUsuario: unNombreUsuario; contrasenia: unaContrasenia).
]

{ #category : #methods }
Usuario >> agregarPregunta: unaPregunta [
	posts
		add: unaPregunta
]

{ #category : #methods }
Usuario >> agregarRespuesta: unaRespuesta [
	posts add: unaRespuesta
]

{ #category : #methods }
Usuario >> agregarRespuesta: descripcionStr pregunta: unaPregunta [
	posts add: (Respuesta new: descripcionStr)
	
]

{ #category : #methods }
Usuario >> agregarTopico: unNombre descripcion: unaDescripcion [
]

{ #category : #methods }
Usuario >> agregarTopicoInteres: unTopico [
	topicosDeInteres add: unTopico.
]

{ #category : #methods }
Usuario >> calcularPuntaje [
	^ self obtenerPreguntas size * 20
		+ (self obtenerRespuestas size * 50)
		+ self diferenciaLikeDislikesPreguntas + self diferenciaLikeDislikesRespuestas 
]

{ #category : #methods }
Usuario >> cantidadPreguntas [
	self obtenerPreguntas size.
]

{ #category : #methods }
Usuario >> cantidadRespuestas [
	self obtenerRespuestas size.
]

{ #category : #accessing }
Usuario >> contrasenia: anObject [
	contrasenia := anObject
]

{ #category : #methods }
Usuario >> darDislike: unPost [

]

{ #category : #methods }
Usuario >> darLike: unPost [
	unPost darLike.
]

{ #category : #methods }
Usuario >> diferenciaLikeDislikesPreguntas [
	| preguntas cantLikes cantDislikes |
	preguntas := self obtenerPreguntas.
	cantLikes := preguntas collect: [ :preg | preg cantLikes ].
	cantDislikes := preguntas collect: [ :preg | preg cantDislikes ].
	^ cantLikes - cantDislikes
]

{ #category : #methods }
Usuario >> diferenciaLikeDislikesRespuestas [
	| respuestas cantLikes cantDislikes |
	respuestas := self obtenerRespuestas.
	cantLikes := respuestas collect: [ :preg | preg cantLikes ].
	cantDislikes := respuestas collect: [ :preg | preg cantDislikes ].
	^ cantLikes - cantDislikes
]

{ #category : #methods }
Usuario >> eliminarPregunta: unaPregunta [
	"hace baja logica"
	(self obtenerPreguntas detect: [ :preg | preg = unaPregunta ]) ponerInactivo 
	
]

{ #category : #initialization }
Usuario >> initialize [
	fechaHora := DateAndTime now.
	follows := OrderedCollection new.
	posts := OrderedCollection new.
	topicosDeInteres := OrderedCollection new.
]

{ #category : #accessing }
Usuario >> nombreUsuario: anObject [
	nombreUsuario := anObject
]

{ #category : #methods }
Usuario >> obtenerPreguntas [
	^(posts collect: [:pregunta | pregunta soyPregunta ]).
]

{ #category : #methods }
Usuario >> obtenerRespuestas [
	^ posts collect: [ :pregunta | pregunta soyPregunta not ]
]

{ #category : #methods }
Usuario >> sacarDislike: unPost [

]

{ #category : #methods }
Usuario >> sacarLike: unPost [

]

{ #category : #methods }
Usuario >> seguirUsuario: unUsuario [
	(self sigueAUsuario: unUsuario)
		ifFalse: [ follows add: unUsuario ]
]

{ #category : #methods }
Usuario >> sigueAUsuario: unUsuario [
	^ follows includes: unUsuario
]

{ #category : #methods }
Usuario >> topicosInteres [
	^ topicosDeInteres 
	"getter coleccion"

	
]
