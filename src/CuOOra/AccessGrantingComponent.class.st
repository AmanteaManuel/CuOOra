"
""|app|
app := WAAdmin register: AccessGrantingComponent asApplicationAt: 'sistema'.
app sessionClass: SessionWithUser. 

Smalltalk garbageCollect ""
"
Class {
	#name : #AccessGrantingComponent,
	#superclass : #WAComponent,
	#instVars : [
		'usuario',
		'contrasenia',
		'model'
	],
	#category : #'CuOOra-ui'
}

{ #category : #accessing }
AccessGrantingComponent >> contrasenia [
	^ contrasenia
]

{ #category : #accessing }
AccessGrantingComponent >> contrasenia: anObject [
	contrasenia := anObject
]

{ #category : #accessing }
AccessGrantingComponent >> initialize [
	super initialize.
	model := CuOOra new
]

{ #category : #rendering }
AccessGrantingComponent >> login: anUser [
	(model
		nombreUsuario: anUser nombreUsuario
		contrasenia: anUser contrasenia)
		ifNotNil: [ :u | self proceedWith: u ].
	usuario := nil.
	contrasenia := nil
]

{ #category : #accessing }
AccessGrantingComponent >> model [
	^ model.
]

{ #category : #rendering }
AccessGrantingComponent >> proceedWith: unUsuario [
	self session usuario: unUsuario.
	self call: HomeComponent new
]

{ #category : #rendering }
AccessGrantingComponent >> registrarUsuario [
	self call: RegisterComponent new.
]

{ #category : #rendering }
AccessGrantingComponent >> renderContentOn: aCanvas [
	| logueo |
	logueo := Usuario new.
	aCanvas
		form: [ aCanvas text: 'Nombre de usuario'.
			aCanvas textInput
				callback: [ :value | logueo nombreUsuario: value ].
			aCanvas break.
			aCanvas text: 'Contraseña: '.
			aCanvas textInput
				callback: [ :value | logueo contrasenia: value ].
			aCanvas break.
			aCanvas submitButton
				callback: [ self login: logueo ];
				with: 'Ingresar' ]
]

{ #category : #accessing }
AccessGrantingComponent >> usuario [
	^ usuario
]

{ #category : #accessing }
AccessGrantingComponent >> usuario: anObject [
	usuario := anObject
]
