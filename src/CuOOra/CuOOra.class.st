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
	#category : #CuOOra
}

{ #category : #methods }
CuOOra >> altaDislike:post [
	post darDislike:usuarioLogueado.
]

{ #category : #methods }
CuOOra >> altaFollow:user [

	usuarioLogueado seguirUsuario: user.
]

{ #category : #methods }
CuOOra >> altaLike:post [
	post altaLike: usuarioLogueado. 
]

{ #category : #methods }
CuOOra >> altaPregunta:tituloStr descripcion:descripcionStr topicos:topicosList [
	|p|
	p := Pregunta newPregunta: tituloStr descripcion:descripcionStr topicos:topicosList.
	usuarioLogueado agregarPregunta:p.
	preguntas add: p.
	
]

{ #category : #methods }
CuOOra >> altaRespuesta:descripcionStr pregunta:preguntaObj [
	|r|
	r := Respuesta newRespuesta:descripcionStr.
	preguntaObj agregarRespuesta: r.
	"DEBERIAMOS DE AGREGARO LOS OBJETOS CAMBIADOS A LA LISTA OTRA VEZ????"
]

{ #category : #methods }
CuOOra >> altaTopico:nombreStr descripcion:descripcionStr [
	(self validarTopico:nombreStr)
		ifTrue: [^ self].
	topicos add: (Topico newTopico:nombreStr descripcion:descripcionStr).
]

{ #category : #methods }
CuOOra >> altaTopicoInteres: topicoObj [
	usuarioLogueado agregarTopicoInteres: topicoObj
]

{ #category : #methods }
CuOOra >> altaUsuario: nombreStr contrasenia: contraseniaStr [
	(self existeNombreUsuario: nombreStr)
		ifTrue: [ ^ self ].
	usuarios add: (Usuario newNombreUsuario: nombreStr contrasenia: contraseniaStr).
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
CuOOra >> existeNombreUsuario:nombreStr [
	^ ( usuarios includes: [ :user | user nombre == nombreStr ]).
]

{ #category : #methods }
CuOOra >> obtenerPreguntasRelevantesUsuario [
	^( usuarioLogueado obtenerPreguntasRelevantesUsuario ).
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

{ #category : #accessing }
CuOOra >> topicos [
	^ topicos
]

{ #category : #accessing }
CuOOra >> topicos: anObject [
	topicos := anObject
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
CuOOra >> validarTopico:nombreStr [
	^ (topicos detect: [ :topico | topico existeNombre:nombreStr ]).
]
