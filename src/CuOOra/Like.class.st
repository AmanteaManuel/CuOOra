Class {
	#name : #Like,
	#superclass : #Reaccion,
	#category : #CuOOra
}

{ #category : #'instance creation' }
Like class >> newLike [
	^ self new.
]

{ #category : #'instance creation' }
Like class >> newLike: usuarioObj [
	^ self new usuario: usuarioObj
]

{ #category : #methods }
Like >> soyLike [
	^ true
]
