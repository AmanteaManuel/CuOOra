Class {
	#name : #Pregunta,
	#superclass : #Post,
	#instVars : [
		'titulo',
		'respuestas',
		'topicos'
	],
	#category : #CuOOra
}

{ #category : #'instance creation' }
Pregunta class >> newPregunta:tituloStr descripcion:descripcionStr [
]

{ #category : #initialization }
Pregunta >> initialize [ 
]

{ #category : #methods }
Pregunta >> perteneceATopico [
]

{ #category : #methods }
Pregunta >> soyPregunta [
]

{ #category : #accesing }
Pregunta >> titulo [
	^ titulo.
]

{ #category : #accesing }
Pregunta >> titulo:unString [
	titulo := unString.
]
