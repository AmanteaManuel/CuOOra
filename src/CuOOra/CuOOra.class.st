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
CuOOra >> altaPregunta: tituloStr descripcion: descripcionStr topicos: topicosList usuario:anUser [
	| p |
	p := Pregunta
		newPregunta: tituloStr
		descripcion: descripcionStr
		topicos: topicosList
		usuario:anUser.
	usuarioLogueado agregarPregunta: p.
	preguntas add: p.
	^ p
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
	"| u1 u2 |
	u1 := self altaUsuario: 'manu' contrasenia: '123'.
	u2 := self altaUsuario: 'user' contrasenia: '123'"

	| usuario pregunta t1 t2 t3 respuesta |
	usuario := Usuario newNombreUsuario: 'user' contrasenia: '123'.
	self usuarios add: usuario.
	self usuarioLogueado: usuario.
	usuario := Usuario newNombreUsuario: 'manu' contrasenia: '123'.
	self usuarios add: usuario.
	usuario := Usuario newNombreUsuario: 'cami' contrasenia: '123'.
	self usuarios add: usuario.
	"-----------------------------------------------------------"
	t1 := Topico newTopico: 'SQL' descripcion: 'prueba'.
	self topicos add: t1.
	t2 := Topico newTopico: 'Smalltalk' descripcion: 'prueba'.
	self topicos add: t2.
	t3 := Topico newTopico: 'POO' descripcion: 'prueba'.
	self topicos add: t3.
	"-----------------------------------------------------------"
	pregunta := Pregunta
		newPregunta: 'select?'
		descripcion: 'como se hace un select'
		topicos: self topicos.
	self preguntas add: pregunta.
	self usuarioLogueado posts add: pregunta.
	pregunta := Pregunta
		newPregunta: 'OrederedCollection?'
		descripcion: 'como screo una instacia?'
		topicos: self topicos.
	self preguntas add: pregunta.
	pregunta := Pregunta
		newPregunta: 'polimorfismo'
		descripcion: 'alguien me puede explicar esto?'
		topicos: self topicos.
	self preguntas add: pregunta.
	"-----------------------------------------------------------"
	respuesta := Respuesta newRespuesta: 'La respuesta es...'.
	pregunta respuestas add: respuesta.
	self usuarioLogueado posts add: respuesta
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
CuOOra >> ultimasCincoRelevantes:usuario [
	| p |
	p := usuario obtenerPreguntasRelevantes.
	p size > 5
		ifTrue: [ ^ p last: 5 ]
		ifFalse: [ ^ p ]
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
