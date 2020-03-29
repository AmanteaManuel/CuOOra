"
Please comment me using the following template inspired by Class Responsibility Collaborator (CRC) design:

For the Class part:  State a one line summary. For example, ""I represent a paragraph of text"".

For the Responsibility part: Three sentences about my main responsibilities - what I do, what I know.

For the Collaborators Part: State my main collaborators and one line about how I interact with them. 

Public API and Key Messages

- message one   
- message two 
- (for bonus points) how to create instances.

   One simple example is simply gorgeous.
 
Internal Representation and Key Implementation Points.

    Instance Variables
	contrasenia:		<Object>
	fechaHora:		<Object>
	follows:		<Object>
	nombreUsuario:		<Object>
	posts:		<Object>
	topicosDeInteres:		<Object>


    Implementation Points
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
Usuario class >> newNombreUsuario: unNombreUsuario contrasenia: unaContrasenia [ 
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
]

{ #category : #methods }
Usuario >> cantidadPreguntas [
	self obtenerPreguntas size.
]

{ #category : #methods }
Usuario >> cantidadRespuestas [
	| resp |
	resp := posts collect: [ :post | post soyPregunta not ].
	^ resp size
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
Usuario >> diferenciaLikeDislikesPregunta [
	| preguntas cantLikes cantDislikes |
	preguntas := self obtenerPreguntas.
	cantLikes := preguntas collect: [ :preg | preg cantLikes ].
	cantDislikes := preguntas collect: [ :preg | preg cantDislikes ].
	^ cantLikes - cantDislikes
]

{ #category : #methods }
Usuario >> eliminarPregunta: unaPregunta [
	self obtenerPreguntas remove: unaPregunta
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
Usuario >> sacarDislike: unPost [

]

{ #category : #methods }
Usuario >> sacarLike: unPost [

]

{ #category : #methods }
Usuario >> seguirUsuario: unUsuario [
	follows add: unUsuario 
]

{ #category : #methods }
Usuario >> sigueAUsuario: unUsuario [
	^ (follows detect: [ :follow | follow = unUsuario ])
]

{ #category : #methods }
Usuario >> topicosInteres [
	^ topicosDeInteres 
	"getter coleccion"

	
]
