"
A PreguntaTest is a test class for testing the behavior of Pregunta
"
Class {
	#name : #PreguntaTest,
	#superclass : #TestCase,
	#instVars : [
		'pregunta',
		'topico'
	],
	#category : #'CuOOra-Tests'
}

{ #category : #running }
PreguntaTest >> setUp [
	| t t1 preg |
	t := OrderedCollection new.
	t1 := Topico newTopico: 'Pharo' descripcion: 'Preguntas sobre Pharo'.
	t add: t1.
	t1 := Topico
		newTopico: 'Objetos'
		descripcion: 'Preguntas sobre Objetos'.
	t add: t1.
	topico := t1.
	preg := Pregunta
		newPregunta: 'Iceberg?'
		descripcion: 'No funciona.'
		topicos: t.
	pregunta := preg
	"-----------------------------"
]

{ #category : #test }
PreguntaTest >> testAgregarRespuesta [
|r|

r := Respuesta  newRespuesta: 'La solucion es...'.
pregunta agregarRespuesta: r.

self assert: (pregunta respuestas includes:r).
]

{ #category : #test }
PreguntaTest >> testPerteneceATopico [
	| t |
	t := Topico
		newTopico: 'Objetos'
		descripcion: 'Preguntas sobre Objetos'.
	self assert: (pregunta perteneceATopico: topico)
]
