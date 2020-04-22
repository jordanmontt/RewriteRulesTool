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
AbstractMorphArrow >> createArrowMorph [
	| morph |
	morph := self morphClass
		vertices:
			{(0 @ 80).
			(150 @ 80).
			(150 @ 25).
			(260 @ 100).
			(150 @ 175).
			(150 @ 120).
			(0 @ 120)}
		color: Color lightGray
		borderWidth: 5
		borderColor: Color black.
	morph scale: 0.25.
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

{ #category : #initialization }
AbstractMorphArrow >> morphClass [
	^ self subclassResponsibility
]
