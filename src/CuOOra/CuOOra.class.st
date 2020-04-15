"
Clase que modela el sistema
"
Class {
	#name : #CuOOra,
	#superclass : #Object,
	#instVars : [
		'usuarioLogueado',
		'usuarios',
		'topicos',
		'preguntas'
	],
	#classInstVars : [
		'soleInstance'
	],
	#category : #'CuOOra-Model'
}

{ #category : #'instance creation' }
CuOOra class >> clearSoleInstance [
	
	soleInstance := nil
]

{ #category : #'instance creation' }
CuOOra class >> soleInstance [
	^ soleInstance ifNil: [ soleInstance := self new ]
]

{ #category : #methods }
CuOOra >> altaDislike: post [
	^ post darDislike: usuarioLogueado
]

{ #category : #methods }
CuOOra >> altaFollow:user [

	usuarioLogueado seguirUsuario: user.
]

{ #category : #methods }
CuOOra >> altaLike: post [
	^ post darLike: usuarioLogueado
]

{ #category : #methods }
CuOOra >> altaPregunta:tituloStr descripcion:descripcionStr topicos:topicosList [
	|p|
	p := Pregunta newPregunta: tituloStr descripcion:descripcionStr topicos:topicosList.
	usuarioLogueado agregarPregunta:p.
	preguntas add: p.
	^p.
	
]

{ #category : #methods }
CuOOra >> altaRespuesta: descripcionStr pregunta: preguntaObj [
	| r |
	r := Respuesta newRespuesta: descripcionStr.
	preguntaObj agregarRespuesta: r.
	^r.
	"DEBERIAMOS DE AGREGARO LOS OBJETOS CAMBIADOS A LA LISTA OTRA VEZ????"
]

{ #category : #methods }
CuOOra >> altaTopico: nombreStr descripcion: descripcionStr [
	(self validarTopico: nombreStr)
		ifNotNil: [ ^ self ].
	^ topicos
		add: (Topico newTopico: nombreStr descripcion: descripcionStr)
]

{ #category : #methods }
CuOOra >> altaTopicoInteres: topicoObj [
	usuarioLogueado agregarTopicoInteres: topicoObj.
	^topicoObj
]

{ #category : #methods }
CuOOra >> altaUsuario: nombreStr contrasenia: contraseniaStr [
	|u|
	(self existeNombreUsuario: nombreStr)
		ifTrue: [ ^ self ].
		u:= (Usuario newNombreUsuario: nombreStr contrasenia: contraseniaStr).
		usuarios add: u.
		^u.
]

{ #category : #methods }
CuOOra >> bajaPregunta: unaPregunta [
	unaPregunta ponerInactivo.
]

{ #category : #methods }
CuOOra >> calcularPuntajeUsuario:unUsuario [
	^ (unUsuario calcularPuntaje).
]

{ #category : #methods }
CuOOra >> existeNombreUsuario: nombreStr [
	^ usuarios anySatisfy: [ :user | user nombreUsuario = nombreStr ]
]

{ #category : #methods }
CuOOra >> initialize [
	usuarios := OrderedCollection new.
	topicos := OrderedCollection new.
	preguntas := OrderedCollection new.
	self setearVariables
]

{ #category : #methods }
CuOOra >> nombreUsuario: unNombre contrasenia: contrasenia [
	^ usuarios detect: [ :u | u nombreUsuario= unNombre & (u contrasenia = contrasenia) ]
	ifNone: [ nil ]
]

{ #category : #methods }
CuOOra >> obtenerPreguntasRelevantesUsuario [
	^ usuarioLogueado obtenerPreguntasRelevantes
]

{ #category : #methods }
CuOOra >> obtenerPreguntasRelevantesUsuario: unUsuario [
	^ preguntas select: [ :p | p esDeInteresPara: unUsuario ].
]

{ #category : #methods }
CuOOra >> obtenerPreguntasUsuario: unUsuario [
	^ (unUsuario obtenerPreguntas ).
]

{ #category : #methods }
CuOOra >> obtenerRespuestasUsuario: unUsuario [
	^ (unUsuario obtenerRespuestas)
]

{ #category : #accessing }
CuOOra >> preguntas [
	^ preguntas
]

{ #category : #accessing }
CuOOra >> preguntas: anObject [
	preguntas := anObject
]

{ #category : #'as yet unclassified' }
CuOOra >> setearVariables [
	| u1 u2 |
	u1 := self
		altaUsuario: 'manu'
		contrasenia: '123'.
	u2 := self
		altaUsuario: 'user'
		contrasenia: '123'
]

{ #category : #accessing }
CuOOra >> topicos [
	^ topicos
]

{ #category : #accessing }
CuOOra >> topicos: anObject [
	topicos := anObject
]

{ #category : #methods }
CuOOra >> ultimasCincoRelevantes [
	|p|
	p:= usuarioLogueado obtenerPreguntasRelevantes.	
	(p size > 5)
	ifTrue: [ ^p last: 5 ]
	ifFalse: [^p ]
	
]

{ #category : #accessing }
CuOOra >> usuarioLogueado [
	^ usuarioLogueado
]

{ #category : #accessing }
CuOOra >> usuarioLogueado: anObject [
	usuarioLogueado := anObject
]

{ #category : #accessing }
CuOOra >> usuarios [
	^ usuarios
]

{ #category : #accessing }
CuOOra >> usuarios: anObject [
	usuarios := anObject
]

{ #category : #methods }
CuOOra >> validarTopico: nombreStr [
	^ topicos detect: [ :topico | topico existeNombre: nombreStr ]
	ifNone: [ ^nil ]
]
