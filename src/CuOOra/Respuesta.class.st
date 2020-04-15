"
clase que modela una Pregunta en el sistema, la misma hereda del posteo.
"
Class {
	#name : #Respuesta,
	#superclass : #Post,
	#instVars : [
		'usuario'
	],
	#category : #'CuOOra-Model'
}

{ #category : #'instance creation' }
Respuesta class >> newRespuesta:descripcionStr [
	^ self new	
		descripcion: descripcionStr.
]

{ #category : #initialization }
Respuesta >> initialize [
	self
		activo: true; fecha: Date today; hora: Time now; 
		reacciones: OrderedCollection new.
]

{ #category : #methods }
Respuesta >> soyPregunta [
	^false.
]

{ #category : #accesing }
Respuesta >> usuario [
	^usuario
]

{ #category : #accesing }
Respuesta >> usuario: user [
	usuario:= user.
]
