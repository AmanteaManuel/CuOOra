Class {
	#name : #AccessGrantingComponent,
	#superclass : #WAComponent,
	#instVars : [
		'usuario',
		'contrasenia'
	],
	#category : #'CuOOra-ui'
}

{ #category : #rendering }
AccessGrantingComponent >> renderContentOn: aCanvas [
	aCanvas
		form: [ self renderInputElementsOn: aCanvas.
			aCanvas submitButton with: 'Enviar'
			"chequear si esta bien ese boton" ]
]

{ #category : #rendering }
AccessGrantingComponent >> renderInputElementsOn: aCanvas [
	aCanvas label: 'Nombre usuario'.
	aCanvas paragraph: [ aCanvas textInput on: #usuario of: self].
	aCanvas label: 'Contrasena'.
	aCanvas paragraph: [ aCanvas passwordInput on: #contrasenia of: self ]
]
