Class {
	#name : #PreguntaComponent,
	#superclass : #MasterComponent,
	#instVars : [
		'pregunta'
	],
	#category : #'CuOOra-ui'
}

{ #category : #'instance creation' }
PreguntaComponent class >> newPregunta: unaPregunta [
	^ self new pregunta: unaPregunta.
]

{ #category : #accessing }
PreguntaComponent >> initialize [
"setea una pregunta"
	| tList t p u |
	u := Usuario new.
	tList := OrderedCollection new.
	t := Topico newTopico: 'Objetos' descripcion: 'prueba'.
	tList add: t.
	t := Topico newTopico: 'Pharo' descripcion: 'prueba'.
	tList add: t.
	p := Pregunta
		newPregunta: 'Problemas con pharo'
		descripcion: 'No me anda el seaside'
		topicos: tList.
	pregunta := p
]

{ #category : #'as yet unclassified' }
PreguntaComponent >> pregunta: unaPregunta [ 
	pregunta := unaPregunta.
]

{ #category : #rendering }
PreguntaComponent >> renderContentOn: aCanvas [
	self renderHeader: aCanvas.

	self renderPregunta: aCanvas
]

{ #category : #rendering }
PreguntaComponent >> renderPregunta: aCanvas [
	aCanvas heading with: pregunta titulo.
	aCanvas paragraph with: pregunta descripcion.
	aCanvas div
		with: [ aCanvas paragraph with: 'Topicos: ' , pregunta topicosComoString ].
	aCanvas
		paragraph: [ aCanvas text: 'Realizada por: ', pregunta usuario nombreUsuario. 
			aCanvas anchor callback: [ pregunta usuario ] ].	
	aCanvas
		paragraph: [ aCanvas
				render:
					'Likes ' , pregunta cantLikes printString , ' | ' , 'Dislikes '
						, pregunta cantDislikes printString ].
	aCanvas
		paragraph: [ aCanvas anchor
				callback: [ "llamar a darLike" ];
				with: 'Like'.
			aCanvas text: '|'.
			aCanvas anchor
				callback: [ "llamar darDislike" ];
				with: 'Dislike' ].
	aCanvas horizontalRule.
	self renderTextareaRespuesta: aCanvas.
	aCanvas horizontalRule
]

{ #category : #rendering }
PreguntaComponent >> renderTextareaRespuesta: aCanvas [
	aCanvas
		form: [ aCanvas textArea
				rows: 10;
				columns: 50;
				callback: [ :value |  ];
				with: 'Escriba aqui el texto de su respuesta'.
			aCanvas break.
			aCanvas submitButton
				callback: [ "botonGuardar" ];
				value: 'Responder'.
			aCanvas submitButton
				callback: [ "BotonCancelar" ];
				value: 'Cancelar' ].
			aCanvas horizontalRule.
]
