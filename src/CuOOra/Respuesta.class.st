"
clase que modela una Pregunta en el sistema, la misma hereda del posteo.
"
Class {
	#name : #Respuesta,
	#superclass : #Post,
	#instVars : [
		'usuario'
	],
	#category : #CuOOra
}

{ #category : #'instance creation' }
Respuesta class >> newRespuesta:descripcionStr usuario:unUsuario [
	^ self new	
		descripcion: descripcionStr; usuario: unUsuario 
]

{ #category : #initialization }
Respuesta >> initialize [
	self
		activo: true; fecha: Date today; hora: Date today hour;
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
