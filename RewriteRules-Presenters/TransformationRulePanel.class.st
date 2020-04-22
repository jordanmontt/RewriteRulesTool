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
	^ 60
]

{ #category : #specs }
TransformationRulePanel class >> buttonsPanelWidth [
	^ 110
]

{ #category : #specs }
TransformationRulePanel class >> defaultSpec [
	| buttonsPanel paddingConstraints panelConstraints |
	paddingConstraints := [ :constraints | constraints padding: RewriteRulesPresenter toolPadding ].
	panelConstraints := [ :constraints | 
	constraints
		padding: RewriteRulesPresenter toolPadding;
		width: self buttonsPanelWidth ].
	buttonsPanel := SpBoxLayout newVertical
		add: #generateButton;
		add: #ruleArrow;
		add: #undoButton;
		add: #redoButton;
		yourself.
	^ SpBoxLayout newVertical
		add: #title
			withConstraints: [ :constraints | 
			constraints
				height: RewriteRulesPresenter titleHeight ];
		add:
			(SpBoxLayout newHorizontal
				add: #inputRule withConstraints: paddingConstraints;
				add: buttonsPanel withConstraints: panelConstraints;
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
