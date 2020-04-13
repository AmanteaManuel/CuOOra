Class {
	#name : #LoginComponent,
	#superclass : #AccessGrantingComponent,
	#category : #'CuOOra-ui'
}

{ #category : #rendering }
LoginComponent >> login [
	(self model nombreUsuario: usuario contrasenia: contrasenia)
		ifNotNil: [ :u | u proceedWith: u ].
	"creo que el model se asigna con una soleinstance del sistema despues veo bien eso"
	usuario := nil.
	contrasenia := nil.
]

{ #category : #rendering }
LoginComponent >> proceedWith: unUsuario [
	self session user: unUsuario.
	self call: HomeComponent new.
]

{ #category : #rendering }
LoginComponent >> renderSignInButtonOn: aCanvas [
	aCanvas submitButton
		callback: [ self login ];
		with: 'Entrar'.
]
