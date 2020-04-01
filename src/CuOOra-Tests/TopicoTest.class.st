"
A TopicoTest is a test class for testing the behavior of Topico
"
Class {
	#name : #TopicoTest,
	#superclass : #TestCase,
	#category : #'CuOOra-Tests'
}

{ #category : #test }
TopicoTest >> testExisteNombre [

	self flag: #toImplement.
	self assert: false
]
