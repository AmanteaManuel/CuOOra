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
	| usuario pregunta topico |
	sistema := CuOOra new.
	usuario := Usuario newNombreUsuario: 'user' contrasenia: '123'.
	sistema usuarios add: usuario.
	sistema usuarioLogueado: usuario.
	usuario := Usuario newNombreUsuario: 'manu' contrasenia: '123'.
	sistema usuarios add: usuario.
	usuario := Usuario newNombreUsuario: 'cami' contrasenia: '123'.
	sistema usuarios add: usuario.
	"-----------------------------------------------------------"
	pregunta := Pregunta
		newPregunta: 'select?'
		descripcion: 'como se hace un select'
		topicos: 'SQL'.
	sistema preguntas add: pregunta.
	pregunta := Pregunta
		newPregunta: 'OrederedCollection?'
		descripcion: 'como screo una instacia?'
		topicos: 'Smalltalk'.
	sistema preguntas add: pregunta.
	pregunta := Pregunta
		newPregunta: 'polimorfismo'
		descripcion: 'alguien me puede explicar esto?'
		topicos: 'POO'.
	sistema preguntas add: pregunta.
	"-----------------------------------------------------------"
	topico := Topico newTopico: 'SQL' descripcion: 'prueba'.
	sistema preguntas add: pregunta.
	topico := Topico newTopico: 'Smalltalk' descripcion: 'prueba'.
	sistema preguntas add: pregunta.
	topico := Topico newTopico: 'POO' descripcion: 'prueba'.
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
