Class {
	#name : #RegisterComponent,
	#superclass : #AccessGrantingComponent,
	#category : #'CuOOra-ui'
}

{ #category : #'as yet unclassified' }
RegisterComponent >> registrarYLogin [
	| user |
	user := self model altaUsuario: usuario contrasenia: contrasenia.
	self proceedWith: user
]

{ #category : #rendering }
RegisterComponent >> renderInputElementsOn: aCanvas [
	aCanvas heading with: 'Registrar usuario'.
	super renderInputElementsOn: aCanvas.
]

{ #category : #'as yet unclassified' }
RegisterComponent >> renderSignUpButtonOn: aCanvas [
	aCanvas submitButton callback: [ self registrarYLogin ];
	with: 'Registrar'
]
