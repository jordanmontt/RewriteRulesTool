"
I am a status indicator for the output code.
"
Class {
	#name : #OutputStatusPresenter,
	#superclass : #AbstractArrowPresenter,
	#category : #'RewriteRules-Presenters-Morphs'
}

{ #category : #initialization }
OutputStatusPresenter >> initializePresenters [
	super initializePresenters.
	self morph
		rotationDegrees: -90;
		infoText: 'Result of applying rule to source code.'
]
