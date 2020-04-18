Class {
	#name : #MasterComponent,
	#superclass : #WAComponent,
	#category : #'CuOOra-ui'
}

{ #category : #rendering }
MasterComponent >> renderHeader: aCanvas [
	aCanvas div
		id: 'titulo';
		with:
			[ aCanvas heading with: 'CuOOra'.
			aCanvas div
				id: 'usuarioencabezado';
				with: [ aCanvas
						render: 'Usuario: ' , self session usuario nombreUsuario , ' '.
					aCanvas anchor
						callback: [  ];
						with: 'Log Out' ] ]. aCanvas horizontalRule.
	aCanvas break
]

{ #category : #rendering }
MasterComponent >> renderPregunta: pregunta canvas: aCanvas [
	aCanvas div
		id: 'tituloPregunta';
		with: [ aCanvas anchor
				callback: [ self call: (PreguntaComponent newPregunta: pregunta) ];
				with: pregunta titulo ].
	aCanvas div
		with: [ aCanvas paragraph with: 'Topicos: ' , pregunta topicosComoString ].
	aCanvas
		paragraph: [ aCanvas render: 'Realizada por: '.
			aCanvas anchor
				callback: [ self call: (PerfilComponent newPerfil: pregunta usuario) ];
				with: pregunta usuario nombreUsuario ].
	aCanvas
		paragraph: [ aCanvas
				render: pregunta cantidadRespuestas printString , ' Respuestas' ].
	aCanvas
		paragraph: [ aCanvas
				render:
					'Cantidad Likes ' , pregunta cantLikes printString , ' | '
						, 'Cantidad Dislikes ' , pregunta cantDislikes printString ].
	aCanvas
		paragraph: [ aCanvas anchor
				callback: [ self session model altaLike: pregunta ];
				with: 'Like'.
			aCanvas text: '|'.
			aCanvas anchor
				callback: [ self session model altaDislike: pregunta ];
				with: 'Dislike' ]
]

{ #category : #rendering }
MasterComponent >> style [
	^ '
	#usuarioencabezado{
		text-align:right;
		margin-right:50px
	}
	
	#btnFallow{
	text-align:right;
	margin-right:50px
	}
	
	#titulo{
				font-size: 21;						
		 		text-align: center;
			}
	#tituloPregunta{}
	#nombreOwnerPregunta{ text-decoration: overline;}
	'
]
