"
I am a morph that has the form of an arrow.
"
Class {
	#name : #ArrowMorph,
	#superclass : #PolygonMorph,
	#instVars : [
		'infoText',
		'isHoverable'
	],
	#category : #'RewriteRules-Presenters-Morphs'
}

{ #category : #'instance creation' }
ArrowMorph class >> new [
	^ self
		vertices:
			{(0 @ 80).
			(150 @ 80).
			(150 @ 25).
			(260 @ 100).
			(150 @ 175).
			(150 @ 120).
			(0 @ 120)}
		color: Color gray
		borderWidth: 1.5
		borderColor: Color black
]

{ #category : #'event handling' }
ArrowMorph >> handlesMouseOver: anEvent [
	isHoverable ifNil: [ isHoverable := true ].
	^ isHoverable
]

{ #category : #'event handling' }
ArrowMorph >> infoMorph [
	| borders stringMorph |
	borders := BorderedMorph new.
	stringMorph := StringMorph contents: infoText.
	borders
		color: self systemThemeColor;
		borderColor: self color;
		borderWidth: 2;
		width: stringMorph width + 10;
		addMorphCentered: stringMorph.
	^ borders
]

{ #category : #api }
ArrowMorph >> infoText: aText [
	infoText := aText
]

{ #category : #api }
ArrowMorph >> isHoverable: aBoolean [
	isHoverable := aBoolean
]

{ #category : #'event handling' }
ArrowMorph >> mouseEnter: anEvent [
	self addMorphCentered: self infoMorph
]

{ #category : #'event handling' }
ArrowMorph >> mouseLeave: anEvent [
	self removeAllMorphs
]

{ #category : #'event handling' }
ArrowMorph >> systemThemeColor [
	^ self theme class baseColor
]
