Class {
	#name : #SessionWithUser,
	#superclass : #WASession,
	#instVars : [
		'usuario'
	],
	#category : #'CuOOra-ui'
}

{ #category : #accessing }
SessionWithUser >> usuario [
	^ usuario
]

{ #category : #accessing }
SessionWithUser >> usuario: anObject [
	usuario := anObject
]
