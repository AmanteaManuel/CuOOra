Class {
	#name : #Dislike,
	#superclass : #Reaccion,
	#category : #CuOOra
}

{ #category : #'instance creation' }
Dislike class >> newDislike [
	^self new.
]

{ #category : #initialization }
Dislike >> soyLike [
	^ false
]
