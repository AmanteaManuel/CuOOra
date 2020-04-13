Class {
	#name : #HomeComponent,
	#superclass : #WAComponent,
	#instVars : [
		'preguntas',
		'usuario'
	],
	#category : #'CuOOra-ui'
}

{ #category : #accessing }
HomeComponent >> initialize [ 
	|p t tList rList u1 u2|
	rList:= OrderedCollection new.	
	tList:= OrderedCollection new.
	preguntas:= OrderedCollection new.
	
	usuario:= Usuario newNombreUsuario: 'Manuel' contrasenia:'123'. 
	
	u1:= Usuario newNombreUsuario: 'U1' contrasenia:'123'. 
	u2:= Usuario newNombreUsuario: 'U2' contrasenia:'123'. 
	rList add: (Like newLike: u1).rList add: (Dislike newDislike: u2).
	
	t:= Topico newTopico: 'Objetos' descripcion: 'prueba'.
	tList add:t.
	
	p:= Pregunta newPregunta: 'Orientacion a Objetos' descripcion:'bla bla'  topicos: tList.
	p reacciones: rList.
	preguntas add: p.
	
	p:= Pregunta newPregunta: 'Orientacion a Objetos 2' descripcion:'ble ble ble'  topicos: tList.
	preguntas add: p.
]

{ #category : #accessing }
HomeComponent >> preguntas [
	^ preguntas
]

{ #category : #accessing }
HomeComponent >> preguntas: anObject [
	preguntas := anObject
]

{ #category : #rendering }
HomeComponent >> renderContentOn: aCanvas [
"header"
	aCanvas heading
		level1;
		with: 'CuOOra'.
	aCanvas div id:'usuarioencabezado'; with: [ 
		aCanvas render: 'Usuario: ', usuario nombreUsuario, ' '.
		aCanvas anchor
			callback: [ ];
			with: 'Log Out'.
	].
	aCanvas horizontalRule.	
	aCanvas break.
"body"
	aCanvas
		unorderedList: [ preguntas
				do: [ :pregunta | 						
						aCanvas listItem: [ aCanvas anchor
								callback: [ self renderPreguntaWith: pregunta ];
								with: pregunta titulo ].
						aCanvas paragraph: [
						aCanvas render: 'Realizada por: '.
						aCanvas anchor
							callback: []; 
							with: 'hacer '	].
						aCanvas paragraph: [
						aCanvas render: (pregunta cantidadRespuestas printString) , ' Respuestas'.
						].
						aCanvas paragraph: [
						aCanvas render: 'Cantidad likes ', (pregunta cantLikes printString) , ' | ',
											 'Cantidad disLikes ', (pregunta cantDislikes printString)
											].
						aCanvas horizontalRule.					
					] ].
			 
]

{ #category : #accessing }
HomeComponent >> renderPreguntaWith: unaPregunta [

]
