"
I am the arrow morph for the Transformation Rules Panel. 
"
Class {
	#name : #RuleMorphArrow,
	#superclass : #AbstractMorphArrow,
	#category : #'RewriteRules-Presenters-Morphs'
}

{ #category : #initialization }
RuleMorphArrow >> color [
	^ Color veryLightGray
]

{ #category : #initialization }
RuleMorphArrow >> initializePresenters [
	super initializePresenters.
	self morph
		vResizing: #spaceFill;
		hResizing: #spaceFil
]
