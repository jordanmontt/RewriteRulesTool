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
	| buttonsPanel arrowConstrainsts paddingConstraints |
	arrowConstrainsts := [ :constraints | 
	constraints
		padding: RewriteRulesPresenter toolPadding;
		height: self arrowHeight ].
	paddingConstraints := [ :constraints | constraints padding: RewriteRulesPresenter toolPadding ].
	buttonsPanel := SpBoxLayout newVertical
		add: #generateButton withConstraints: paddingConstraints;
		add: #ruleArrow withConstraints: arrowConstrainsts;
		add: #undoButton withConstraints: paddingConstraints;
		add: #redoButton withConstraints: paddingConstraints;
		yourself.
	^ SpBoxLayout newVertical
		add: #title height: RewriteRulesPresenter titleHeight;
		add:
			(SpBoxLayout newHorizontal
				add: #inputRule withConstraints: paddingConstraints;
				add: buttonsPanel width: self buttonsPanelWidht;
				add: #outputRule withConstraints: paddingConstraints;
				yourself);
		yourself
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
