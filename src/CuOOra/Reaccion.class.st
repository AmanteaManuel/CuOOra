"
Una reaccion puede ser un like o dislike.
"
Class {
	#name : #Reaccion,
	#superclass : #Object,
	#instVars : [
		'fechaHora',
		'usuario'
	],
	#category : #CuOOra
}

{ #category : #initialization }
Reaccion >> soyLike [
	self subclassResponsibility 
]

{ #category : #methods }
Reaccion >> tieneLikeDe:usuarioObj [
	^ (self usuario = usuarioObj).
]

{ #category : #accesing }
Reaccion >> usuario [
	^usuario.
]
