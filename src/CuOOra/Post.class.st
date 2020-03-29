"
Clase padre de pregunta y respuesta, modela una post, una publicacion o una respuesta en el sistema
"
Class {
	#name : #Post,
	#superclass : #Object,
	#instVars : [
		'descripcion',
		'fecha',
		'hora',
		'activo',
		'reacciones'
	],
	#category : #CuOOra
}

{ #category : #accesing }
Post >> activo [
	^ activo.
]

{ #category : #accesing }
Post >> activo: bool [ 
	activo :=bool. 
]

{ #category : #methods }
Post >> cantDislikes [
	^ reacciones collect: [ :reacion | reacion  not soyLike  ] size
]

{ #category : #methods }
Post >> cantLikes [
	^ reacciones collect: [ :reacion | reacion soyLike  ] size
]

{ #category : #methods }
Post >> darDislike [
reacciones add: (Dislike new)
]

{ #category : #methods }
Post >> darLike [
	reacciones add: (Like new).
]

{ #category : #accesing }
Post >> descripcion [
	^ descripcion.
]

{ #category : #accesing }
Post >> descripcion: unString [
	descripcion:= unString.
]

{ #category : #accesing }
Post >> fecha [
	^fecha.
]

{ #category : #accesing }
Post >> fecha: date [ 
	fecha := date.
]

{ #category : #accesing }
Post >> hora [
	^ hora.
]

{ #category : #accesing }
Post >> hora: time [ 
	hora:= time.
]

{ #category : #initialization }
Post >> initialize [
]

{ #category : #methods }
Post >> ponerInactivo [
	self activo: false.
]

{ #category : #accesing }
Post >> reacciones [
	^reacciones.
]

{ #category : #methods }
Post >> sacarDislike [
	
]

{ #category : #methods }
Post >> sacarLike [
	
]

{ #category : #methods }
Post >> soyPregunta [
 ^ self subclassResponsibility.
]
