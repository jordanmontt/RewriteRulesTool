"
I am the abstract class for an arrow morph. I create the arrow polygon and my subclasees define my orentation and other custumization options.
"
Class {
	#name : #AbstractArrowPresenter,
	#superclass : #SpPresenter,
	#instVars : [
		'arrowMorphAsPresenter'
	],
	#category : #'RewriteRules-Presenters-Morphs'
}

{ #category : #specs }
AbstractArrowPresenter class >> defaultSpec [
	^ SpBoxLayout newVertical add: #arrowMorphAsPresenter; yourself
]

{ #category : #initialization }
AbstractArrowPresenter >> initializePresenters [
	arrowMorphAsPresenter := self newMorph.
	arrowMorphAsPresenter morph: ArrowMorph new
]

{ #category : #api }
AbstractArrowPresenter >> morph [
	^ arrowMorphAsPresenter morph
]
