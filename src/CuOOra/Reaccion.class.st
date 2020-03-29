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
