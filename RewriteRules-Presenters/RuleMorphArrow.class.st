Class {
	#name : #RuleMorphArrow,
	#superclass : #AbstractMorphArrow,
	#category : #'RewriteRules-Presenters-Morphs'
}

{ #category : #initialization }
RuleMorphArrow >> initializePresenters [
	super initializePresenters.
	self morph 		vResizing: #spaceFill;
		hResizing: #spaceFil;
		scale: 0.01.
]

{ #category : #initialization }
RuleMorphArrow >> morphClass [
	^ PolygonMorph
]
