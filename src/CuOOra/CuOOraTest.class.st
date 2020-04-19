"
A CuOOraTest is a test class for testing the behavior of CuOOra
"
Class {
	#name : #CuOOraTest,
	#superclass : #TestCase,
	#instVars : [
		'sistema',
		'usuarioLogueado'
	],
	#category : #'CuOOra-Tests'
}

{ #category : #running }
CuOOraTest >> setUp [
	| usuario pregunta t1 t2 t3 tList respuesta |
	sistema := CuOOra new.
	tList := OrderedCollection new.
	"Agrego usuarios al sistema"
	usuario := Usuario newNombreUsuario: 'user' contrasenia: '123'.
	sistema usuarios add: usuario.
	usuarioLogueado := usuario.
	usuario := Usuario newNombreUsuario: 'manu' contrasenia: '123'.
	sistema usuarios add: usuario.
	usuario := Usuario newNombreUsuario: 'cami' contrasenia: '123'.
	sistema usuarios add: usuario.
	"-----------------------------------------------------------"
	"Agrego topicos"
	t1 := Topico newTopico: 'SQL' descripcion: 'prueba'.
	sistema topicos add: t1.
	t2 := Topico newTopico: 'Smalltalk' descripcion: 'prueba'.
	sistema topicos add: t2.
	t3 := Topico newTopico: 'POO' descripcion: 'prueba'.
	sistema topicos add: t3.
	tList add: t1.
	tList add: t2.
	"-----------------------------------------------------------"
	pregunta := Pregunta
		newPregunta: 'select?'
		descripcion: 'como se hace un select'
		topicos: tList.
	sistema preguntas add: pregunta.
	usuarioLogueado posts add: pregunta.
	pregunta := Pregunta
		newPregunta: 'OrederedCollection?'
		descripcion: 'como screo una instacia?'
		topicos: tList.
	sistema preguntas add: pregunta.
	pregunta := Pregunta
		newPregunta: 'polimorfismo'
		descripcion: 'alguien me puede explicar esto?'
		topicos: tList.
	sistema preguntas add: pregunta.
	"-----------------------------------------------------------"
	respuesta := Respuesta newRespuesta: 'La respuesta es...'.
	pregunta respuestas add: respuesta.
	usuarioLogueado posts add: respuesta
]

{ #category : #test }
CuOOraTest >> testAltaLikeDe [
	| p |
	p := sistema preguntas last.
	sistema altaLike: p de: usuarioLogueado.
	self assert: p cantLikes equals: 1
]

{ #category : #test }
CuOOraTest >> testAltaPreguntaDescripcionTopicos [
	| p t tList |
	"como regla de negocio el topico ya debe estar cargado en el sistema."
	p := sistema
		altaPregunta: 'collect pharo'
		descripcion: 'no anda'
		topicos: 'OO1, pharo'
		usuario: usuarioLogueado.
	self assert: [ sistema preguntas includes: p ].
	self assert: [ usuarioLogueado posts includes: p ]
]

{ #category : #test }
CuOOraTest >> testAltaRespuestaPregunta [
	| p r |
	p := sistema preguntas first.
	r := sistema altaRespuesta: 'La solucion es...' pregunta: p usuario: usuarioLogueado.
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
	sistema altaTopicoInteres: t de: usuarioLogueado.
	self assert: (usuarioLogueado topicosDeInteres includes: t)
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
	| p |
	p := sistema calcularPuntajeUsuario: usuarioLogueado.
	self assert: p equals: 20 * 1 + (50 * 1)
]

{ #category : #test }
CuOOraTest >> testExisteNombreUsuario [
	self assert: (sistema existeNombreUsuario:'cami').
	self deny: (sistema existeNombreUsuario:'nombreDisponible').
]

{ #category : #test }
CuOOraTest >> testObtenerPreguntasRelevantesUsuario [
	| t |
	t := sistema topicos last.
	sistema altaTopicoInteres: t.
	self assert: sistema obtenerPreguntasRelevantesUsuario size equals: 1
]

{ #category : #test }
CuOOraTest >> testObtenerPreguntasUsuario [
	self assert: [ (sistema obtenerRespuestasUsuario: usuarioLogueado)
		size = 1 ]
]

{ #category : #test }
CuOOraTest >> testObtenerRespuestasUsuario [
	self assert: [ (sistema obtenerRespuestasUsuario: usuarioLogueado)
		size = 1 ]
]

{ #category : #test }
CuOOraTest >> testValidarTopico [
	| list |
	list := sistema validarTopico: 'Consultas'.
	self assert: list isNil.
	list := sistema validarTopico: 'SQL'.
	self assert: list isNotNil
]
