"
An UsuarioTest is a test class for testing the behavior of Usuario
"
Class {
	#name : #UsuarioTest,
	#superclass : #TestCase,
	#instVars : [
		'usuario',
		'top',
		'preguntaBorrar'
	],
	#category : #'CuOOra-Tests'
}

{ #category : #running }
UsuarioTest >> setUp [
	| topicos t like dislike p r u1 u2 u3 |
	t := Topico newTopico: 'SQL' descripcion: 'topico sql'.
	topicos := OrderedCollection new.
	topicos add: t.
	u1 := Usuario newNombreUsuario: 'user' contrasenia: '123'.
	u2 := Usuario newNombreUsuario: 'user2' contrasenia: '123'.
	u3 := Usuario newNombreUsuario: 'user3' contrasenia: '123'.
	u1 topicosInteres add: t.
	top := t.
	"---------------------------------------------------------"
	p := Pregunta
		newPregunta: 'select?'
		descripcion: 'como se hace un select'
		topicos: topicos.
	r := Respuesta newRespuesta: 'esta mal escrito el metodo'.
	"---------------------------------------------------------"
	like := Like newLike: u2.
	p reacciones add: like.
	dislike := Dislike newDislike: u3.
	p reacciones add: dislike.
	u1 posts add: p.
	u1 posts add: r.
	preguntaBorrar := Pregunta
		newPregunta: 'delete?'
		descripcion: 'como se hace un delte'
		topicos: topicos.
	u1 posts add: p.
	usuario := u1
]

{ #category : #test }
UsuarioTest >> testAgregarPregunta [
	| preg |
	preg := usuario posts
		add:
			(Pregunta
				newPregunta: 'select?'
				descripcion: 'como se hace un select'
				topicos: 'SQL').
	usuario agregarPregunta: preg.
	self assert: (usuario posts includes: preg)
]

{ #category : #test }
UsuarioTest >> testAgregarRespuesta [
	| resp |
	resp := usuario posts add: (Respuesta newRespuesta: 'te falta el ;').
	usuario agregarRespuesta: resp.
	self assert: (usuario posts includes: resp)
]

{ #category : #test }
UsuarioTest >> testAgregarTopicoInteres [
	| topico topicoFail |
	topico := Topico
		newTopico: 'Base de datos'
		descripcion: 'topico Base de datos'.
	topicoFail := top.
	usuario agregarTopicoInteres: topico.
	self
		assert: [ (usuario topicosInteres select: [ :t | t nombre = 'Base de datos' ])
				size = 1 ].
	usuario agregarTopicoInteres: topicoFail
	"self
		deny:
			[ (usuario topicosInteres select: [ :t | t nombre = 'SQL' ]) size = 2 ]"
	"PREGUNTAR DENY NO ANDA"
]

{ #category : #test }
UsuarioTest >> testCalcularPuntaje [
	self assert: [ 20 + 50 + 0 = usuario calcularPuntaje ]
]

{ #category : #test }
UsuarioTest >> testCantidadPreguntas [
	self assert: [ usuario cantidadPreguntas = 1 ]
]

{ #category : #test }
UsuarioTest >> testDiferenciaLikeDislikesPreguntas [
	self assert: [usuario diferenciaLikeDislikesPreguntas = 0].
]

{ #category : #test }
UsuarioTest >> testDiferenciaLikeDislikesRespuestas [
	self assert: [ 20 + 50 + 0 = usuario calcularPuntaje ]
]

{ #category : #test }
UsuarioTest >> testEliminarPregunta [
	usuario eliminarPregunta: preguntaBorrar.
	self assert: [ usuario posts includes: preguntaBorrar ].
]

{ #category : #test }
UsuarioTest >> testObtenerPreguntas [
	|list|
	list:= usuario obtenerPreguntas.
	self assert: [list size = 2].
]

{ #category : #test }
UsuarioTest >> testObtenerRespuestas [
	|list|
	list:= usuario obtenerRespuestas.
	self assert: [list size = 1].
]

{ #category : #test }
UsuarioTest >> testSacarDislike [

	self assert: false
]

{ #category : #test }
UsuarioTest >> testSacarLike [

	self assert: false
]

{ #category : #test }
UsuarioTest >> testSeguirUsuario [

	self flag: #toImplement.
	self assert: false
]

{ #category : #test }
UsuarioTest >> testSigueAUsuario [

	self flag: #toImplement.
	self assert: false
]
