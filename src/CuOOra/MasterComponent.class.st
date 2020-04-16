Class {
	#name : #MasterComponent,
	#superclass : #WAComponent,
	#category : #'CuOOra-ui'
}

{ #category : #rendering }
MasterComponent >> renderHeader: aCanvas [
	
	aCanvas heading with: 'CuOOra'.
	aCanvas div
		id: 'usuarioencabezado';
		with: [ aCanvas render: 'Usuario: ' , self session usuario nombreUsuario, ' '.
			aCanvas anchor
				callback: [  ];
				with: 'Log Out' ].
	aCanvas horizontalRule.
	aCanvas break
]

{ #category : #rendering }
MasterComponent >> style [
	^ '
	#usuarioencabezado{
		text-align:right;
	}
	'
]
