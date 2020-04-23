"
I am a status arrow for the input code. I turn green if the Pharo code matches with the input rule and I turn red otherwise.
"
Class {
	#name : #InputStatusPresenter,
	#superclass : #AbstractArrowPresenter,
	#instVars : [
		'color',
		'infoText'
	],
	#category : #'RewriteRules-Presenters-Morphs'
}

{ #category : #initialization }
InputStatusPresenter >> initializeInstanceVariables [
	color ifNil: [ color := Color r: 0.296875  g: 0.6015625  b: 0.1640625 ].
	infoText ifNil: [ infoText := 'Input AST matches LHS of rule.' ]
]

{ #category : #initialization }
InputStatusPresenter >> initializePresenters [
	super initializePresenters.
	self initializeInstanceVariables.
	self morph
		color: color;
		rotationDegrees: 90;
		infoText: infoText
]

{ #category : #'event handling' }
InputStatusPresenter >> ruleIsMatching [
	color := Color lightGreen.
	infoText := 'Input AST matches LHS of rule.'.
	self morph
		color: color;
		infoText: infoText
]

{ #category : #'event handling' }
InputStatusPresenter >> ruleIsNotMatching [
	color := Color lightRed.
	infoText := 'Input AST does not match LHS of rule.'.
	self morph
		color: color;
		infoText: infoText
]
