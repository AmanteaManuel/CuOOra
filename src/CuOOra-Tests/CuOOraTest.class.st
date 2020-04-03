"
A CuOOraTest is a test class for testing the behavior of CuOOra
"
Class {
	#name : #CuOOraTest,
	#superclass : #TestCase,
	#instVars : [
		'sistema'
	],
	#category : #'CuOOra-Tests'
}

{ #category : #running }
CuOOraTest >> setUp [
	| usuario pregunta t1 t2 t3 |
	sistema := CuOOra new.
	usuario := Usuario newNombreUsuario: 'user' contrasenia: '123'.
	sistema usuarios add: usuario.
	sistema usuarioLogueado: usuario.
	usuario := Usuario newNombreUsuario: 'manu' contrasenia: '123'.
	sistema usuarios add: usuario.
	usuario := Usuario newNombreUsuario: 'cami' contrasenia: '123'.
	sistema usuarios add: usuario.
	"-----------------------------------------------------------"
	t1 := Topico newTopico: 'SQL' descripcion: 'prueba'.
	sistema topicos add: t1.
	t2 := Topico newTopico: 'Smalltalk' descripcion: 'prueba'.
	sistema topicos add: t2.
	t3 := Topico newTopico: 'POO' descripcion: 'prueba'.
	sistema topicos add: t3.
	"-----------------------------------------------------------"
	pregunta := Pregunta
		newPregunta: 'select?'
		descripcion: 'como se hace un select'
		topicos: sistema topicos.
	sistema preguntas add: pregunta.
	sistema usuarioLogueado posts add: pregunta.
	pregunta := Pregunta
		newPregunta: 'OrederedCollection?'
		descripcion: 'como screo una instacia?'
		topicos: sistema topicos.
	sistema preguntas add: pregunta.
	pregunta := Pregunta
		newPregunta: 'polimorfismo'
		descripcion: 'alguien me puede explicar esto?'
		topicos: sistema topicos.
	sistema preguntas add: pregunta
	"-----------------------------------------------------------"
]

{ #category : #test }
CuOOraTest >> testAltaDislike [
	self assert: false.
]

{ #category : #test }
CuOOraTest >> testAltaFollow [
	| u |
	sistema usuarioLogueado: sistema usuarios first.
	u := sistema usuarios last.
	sistema altaFollow: u.
	self assert: (sistema usuarioLogueado sigueAUsuario: u).
]

{ #category : #test }
CuOOraTest >> testAltaLike [
	| p like |
	p := sistema preguntas last.
	like := sistema altaLike: p.
	self assert: (p reacciones includes: like).
]

{ #category : #test }
CuOOraTest >> testAltaPreguntaDescripcionTopicos [
	|p|
	"como regla de negocio el topico ya debe estar cargado en el sistema." 
	p:= sistema altaPregunta: 'collect pharo' descripcion:'no anda'  topicos:'pharo'.
	self assert: [sistema preguntas includes:p].
	self assert: [sistema usuarioLogueado posts includes:p]. 
	
	
]

{ #category : #test }
CuOOraTest >> testAltaRespuestaPregunta [
	| p r |
	p := sistema preguntas first.
	r :=sistema altaRespuesta: 'La solucion es...' pregunta: p.
	self assert: (p respuestas includes: r)
]

{ #category : #test }
CuOOraTest >> testAltaTopicoDescripcion [
	| t |
	t := sistema altaTopico: 'Programacion' descripcion: 'prueba'.
	self assert: (sistema topicos includes: t).
	"Pruebo con un topico que ya exista."
	t := sistema altaTopico: 'SQL' descripcion: 'prueba'.
	self deny: (sistema topicos includes: t)
]

{ #category : #test }
CuOOraTest >> testAltaTopicoInteres [
	| t |
	"Toma el ultimo de los topicos de la lista, y lo agrega como topico de interes
	del usuario."
	t := sistema topicos last.
	sistema altaTopicoInteres: t.
	self assert: (sistema usuarioLogueado topicosDeInteres includes: t).
]

{ #category : #test }
CuOOraTest >> testAltaUsuarioContrasenia [
	| u |
	u := sistema altaUsuario: 'usuarioNuevo' contrasenia: '123'.
	self assert: (sistema usuarios includes: u).
	u := sistema altaUsuario: 'cami' contrasenia: '123'.
	self deny: (sistema usuarios includes: u)
]

{ #category : #test }
CuOOraTest >> testBajaPregunta [
	| p |
	p := sistema preguntas last.
	sistema bajaPregunta: p.
	self deny: p activo
]

{ #category : #test }
CuOOraTest >> testCalcularPuntajeUsuario [
	self assert: false
]

{ #category : #test }
CuOOraTest >> testExisteNombreUsuario [
	self assert: (sistema existeNombreUsuario:'cami').
	self deny: (sistema existeNombreUsuario:'nombreDisponible').
]

{ #category : #test }
CuOOraTest >> testObtenerPreguntasRelevantesUsuario [
	self assert: (sistema usuarioLogueado obtenerPreguntas size) equals: 3
]

{ #category : #test }
CuOOraTest >> testObtenerPreguntasUsuario [
	|cant|
	cant := sistema usuarioLogueado cantidadPreguntas.
	self assert: (cant equals: 1)
]

{ #category : #test }
CuOOraTest >> testObtenerRespuestasUsuario [
	self assert: false
]

{ #category : #test }
CuOOraTest >> testValidarTopico [
	| list |
	list := sistema validarTopico: 'Consultas'.
	self assert: list isNil.
	list := sistema validarTopico: 'SQL'.
	self assert: list isNotNil
]
