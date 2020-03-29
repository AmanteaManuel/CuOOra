Class {
	#name : #Dislike,
	#superclass : #Reaccion,
	#category : #CuOOra
}

{ #category : #'instance creation' }
Dislike class >> newDislike [
	^self new.
]

{ #category : #'instance creation' }
Dislike class >> newDislike: usuarioObj [
	^ self new usuario: usuarioObj
	
]

{ #category : #methods }
Dislike >> initialize [ 
	fechaHora := DateAndTime now.
]

{ #category : #initialization }
Dislike >> soyLike [
	^ false
]
