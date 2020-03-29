Class {
	#name : #Reaccion,
	#superclass : #Object,
	#instVars : [
		'fechaHora'
	],
	#category : #CuOOra
}

{ #category : #initialization }
Reaccion >> initialize [
	fechaHora := DateAndTime now.
]

{ #category : #initialization }
Reaccion >> soyLike [
	self subclassResponsibility 
]
