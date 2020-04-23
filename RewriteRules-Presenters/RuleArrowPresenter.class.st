"
I am the arrow morph for the Transformation Rules Panel. 
"
Class {
	#name : #RuleArrowPresenter,
	#superclass : #AbstractArrowPresenter,
	#category : #'RewriteRules-Presenters-Morphs'
}

{ #category : #initialization }
RuleArrowPresenter >> initializePresenters [
	super initializePresenters.
	self morph
		vResizing: #spaceFill;
		hResizing: #spaceFil;
		color: Color veryLightGray;
		isHoverable: false
]
