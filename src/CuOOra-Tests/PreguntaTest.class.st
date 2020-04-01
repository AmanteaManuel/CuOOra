"
A PreguntaTest is a test class for testing the behavior of Pregunta
"
Class {
	#name : #PreguntaTest,
	#superclass : #TestCase,
	#instVars : [
		'pregunta'
	],
	#category : #'CuOOra-Tests'
}

{ #category : #running }
PreguntaTest >> setUp [ 
|t preg|
	t := OrderedCollection new.
	t add: 'Pharo'.
	preg := (Pregunta 
				newPregunta: 'Iceberg?' 
				descripcion: 'No funciona.' 
				topicos: t).
	
	
]

{ #category : #test }
PreguntaTest >> testAgregarRespuesta [
|r|

r := Respuesta  newRespuesta: 'La solucion es...'.
pregunta agregarRespuesta: r.

self assert: (pregunta respuestas includes:r).
]
