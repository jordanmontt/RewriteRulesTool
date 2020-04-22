"
I am the abstract class for an arrow morph. I create the arrow polygon and my subclasees define my orentation and other custumization options.
"
Class {
	#name : #AbstractMorphArrow,
	#superclass : #SpPresenter,
	#instVars : [
		'arrowMorphAsPresenter'
	],
	#category : #'RewriteRules-Presenters-Morphs'
}

{ #category : #specs }
AbstractMorphArrow class >> defaultSpec [
	^ SpBoxLayout newVertical add: #arrowMorphAsPresenter; yourself
]

{ #category : #initialization }
AbstractMorphArrow >> color [
	self subclassResponsibility
]

{ #category : #initialization }
AbstractMorphArrow >> createArrowMorph [
	| morph |
	morph := PolygonMorph
		vertices:
			{(0 @ 80).
			(150 @ 80).
			(150 @ 25).
			(260 @ 100).
			(150 @ 175).
			(150 @ 120).
			(0 @ 120)}
		color: self color
		borderWidth: 1.5
		borderColor: Color black.
	^ morph
]

{ #category : #initialization }
AbstractMorphArrow >> initializePresenters [
	arrowMorphAsPresenter := self newMorph.
	arrowMorphAsPresenter morph: self createArrowMorph.
]

{ #category : #api }
AbstractMorphArrow >> morph [
	^ arrowMorphAsPresenter morph
]
