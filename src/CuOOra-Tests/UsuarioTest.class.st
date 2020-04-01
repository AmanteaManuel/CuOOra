"
An UsuarioTest is a test class for testing the behavior of Usuario
"
Class {
	#name : #UsuarioTest,
	#superclass : #TestCase,
	#instVars : [
		'usuario'
	],
	#category : #'CuOOra-Tests'
}

{ #category : #running }
UsuarioTest >> setUp [
	usuario := Usuario newNombreUsuario: 'user' contrasenia: '123'.
	usuario posts add:( Pregunta
		newPregunta: 'select?'
		descripcion: 'como se hace un select'
		topicos: 'SQL').

 
]

{ #category : #test }
UsuarioTest >> testAgregarPregunta [
	|preg|
	preg:= usuario posts add:( Pregunta
		newPregunta: 'select?'
		descripcion: 'como se hace un select'
		topicos: 'SQL').
 
	usuario agregarPregunta: preg.
	self assert: (usuario posts includes:preg).
]

{ #category : #test }
UsuarioTest >> testObtenerPreguntas [
	self assert:( usuario obtenerPreguntas size = 1) 
]
