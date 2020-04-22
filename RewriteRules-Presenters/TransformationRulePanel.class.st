"
I am the responsible for the creation of a transformation rule.
"
Class {
	#name : #TransformationRulePanel,
	#superclass : #SpPresenter,
	#instVars : [
		'inputRule',
		'outputRule',
		'undoButton',
		'redoButton',
		'generateButton',
		'ruleArrow',
		'title'
	],
	#category : #'RewriteRules-Presenters-Builder'
}

{ #category : #specs }
TransformationRulePanel class >> arrowHeight [
	^ 50
]

{ #category : #specs }
TransformationRulePanel class >> buttonsPanelWidht [
	^ 150
]

{ #category : #specs }
TransformationRulePanel class >> defaultSpec [
	| buttonsPanel paddingConstraints arrowConstrainsts |
	paddingConstraints := [ :constraints | 
	constraints
		padding: self padding;
		height: 70 ].
	arrowConstrainsts := [ :constraints | 
	constraints
		padding: self padding;
		height: self arrowHeight ].
	buttonsPanel := SpBoxLayout newVertical
		add: #generateButton withConstraints: paddingConstraints;
		add: #ruleArrow withConstraints: arrowConstrainsts;
		add: #undoButton withConstraints: paddingConstraints;
		add: #redoButton withConstraints: paddingConstraints;
		borderWidth: 4;
		yourself.
	^ SpBoxLayout newVertical
		add: #title height: self titleHeight;
		add:
			(SpBoxLayout newHorizontal
				add: #inputRule;
				add: buttonsPanel width: self buttonsPanelWidht;
				add: #outputRule;
				yourself);
		yourself
]

{ #category : #specs }
TransformationRulePanel class >> padding [
^ 5
]

{ #category : #specs }
TransformationRulePanel class >> titleHeight [
	^ 35
]

{ #category : #initialization }
TransformationRulePanel >> initializePresenters [
	inputRule := self instantiate: InputTransformationRulePresenter.
	outputRule := self instantiate: OutputTransformationRulePresenter.
	undoButton := self instantiate: UndoRuleButton.
	redoButton := self instantiate: RedoRuleButton.
	generateButton := self instantiate: GenerateRuleButton.
	ruleArrow := self instantiate: RuleMorphArrow.
	title := self instantiate: TitlePresenter.
	title name: 'Transformation Rule'
]
