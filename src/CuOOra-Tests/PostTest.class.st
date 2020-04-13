"
A PostTest is a test class for testing the behavior of Post
"
Class {
	#name : #PostTest,
	#superclass : #TestCase,
	#instVars : [
		'pregunta',
		'usuario'
	],
	#category : #'CuOOra-Tests'
}

{ #category : #running }
PostTest >> setUp [
	|topicos |
	usuario:= Usuario newNombreUsuario: 'Manuel' contrasenia:'Amantea'. 
	topicos:= OrderedCollection new.
	topicos add: [ Topico newTopico: 'SQL' descripcion:'base de datos'  ].
	pregunta:= Pregunta newPregunta: 'pregunta prueba' descripcion:'asd'  topicos: topicos.	

]

{ #category : #test }
PostTest >> testTieneDislikeDe [
|u like|
	u:= Usuario newNombreUsuario: 'Juan' contrasenia:'Amantea'. 
	like:= Dislike newDislike: u.
	pregunta reacciones add: like.
	self assert:[pregunta tieneDislikeDe: u].
]

{ #category : #test }
PostTest >> testTieneLikeDe [
|u like|
	u:= Usuario newNombreUsuario: 'Juan' contrasenia:'Amantea'. 
	like:= Like newLike: u.
	pregunta reacciones add: like.
	self assert:[pregunta tieneLikeDe: u].
]
