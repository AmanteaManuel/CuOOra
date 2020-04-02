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
	| usuario pregunta topico t1 t2 t3 |
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
CuOOraTest >> testAltaFollow [
 
	self flag: #toImplement. 
	self assert: false
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

]

{ #category : #test }
CuOOraTest >> testAltaTopicoDescripcion [
	| t |
	t := sistema altaTopico: 'Programacion' descripcion: 'prueba'.
	self assert: (sistema topicos includes: t).
	"Pruebo con un topico que no exista."
	t := sistema altaTopico: 'SQL' descripcion: 'prueba'.
	self deny: (sistema topicos includes: t)
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
CuOOraTest >> testExisteNombreUsuario [

	self flag: #toImplement.
	self assert: false
]
