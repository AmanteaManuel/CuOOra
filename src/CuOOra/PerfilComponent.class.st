Class {
	#name : #PerfilComponent,
	#superclass : #MasterComponent,
	#instVars : [
		'usuario'
	],
	#category : #'CuOOra-ui'
}

{ #category : #rendering }
PerfilComponent >> initialize [
usuario:= Usuario newNombreUsuario: 'Manuel' contrasenia:'123' 
]

{ #category : #rendering }
PerfilComponent >> renderBody: aCanvas [
	aCanvas heading with: 'Preguntas de ' , usuario nombreUsuario.
	aCanvas anchor
		callback: [  ];
		with: 'fallow'.
	self renderPreguntas:aCanvas . 
]

{ #category : #rendering }
PerfilComponent >> renderContentOn: aCanvas [
	self renderHeader: aCanvas.
	self renderBody: aCanvas
]

{ #category : #rendering }
PerfilComponent >> renderHeader: aCanvas [
	aCanvas heading with: 'CuOOra'.
	aCanvas div
		id: 'usuarioencabezado';
		with: [ aCanvas
				render: 'Usuario: ' , 'Manuel' , ' '.
			aCanvas anchor
				callback: [  ];
				with: 'Log Out' ].
	aCanvas horizontalRule.
	aCanvas break
]

{ #category : #rendering }
PerfilComponent >> renderPreguntas:aCanvas [
	
]

{ #category : #rendering }
PerfilComponent >> style [
	^ '
	#body{
				font-size: 21;						
		 		text-align: center;
				margin-top: 100px;
			}		
		'
]
