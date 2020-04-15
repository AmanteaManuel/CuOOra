Class {
	#name : #LoginComponent,
	#superclass : #AccessGrantingComponent,
	#category : #'CuOOra-ui'
}

{ #category : #rendering }
LoginComponent >> renderSignInButtonOn: aCanvas [
aCanvas submitButton
		callback: [ self login ];
		with: 'Entrar'
]
