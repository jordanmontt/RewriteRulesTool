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
TransformationRulePanel >> initializeGenerateButton [
	generateButton := self newButton.
	generateButton
		label: 'Generate rule';
		icon: (self iconNamed: #smallSave)
]

{ #category : #initialization }
TransformationRulePanel >> initializeInputRule [
	inputRule := self instantiate: InputTransformationRulePresenter
]

{ #category : #initialization }
TransformationRulePanel >> initializeOutputRule [
	outputRule := self instantiate: OutputTransformationRulePresenter
]

{ #category : #initialization }
TransformationRulePanel >> initializePresenters [
	self initializeUndoButton.
	self initializeRedoButton.
	self initializeGenerateButton.
	self initializeTitle.
	self initializeInputRule.
	self initializeOutputRule.
	self initializeRuleArrow
]

{ #category : #initialization }
TransformationRulePanel >> initializeRedoButton [
	redoButton := self newButton.
	redoButton
		label: 'Redo';
		icon: (self iconNamed: #smallRedo)
]

{ #category : #initialization }
TransformationRulePanel >> initializeRuleArrow [
	ruleArrow := self instantiate: RuleArrowPresenter
]

{ #category : #initialization }
TransformationRulePanel >> initializeTitle [
	title := self instantiate: TitlePresenter.
	title name: 'Transformation Rule'
]

{ #category : #initialization }
TransformationRulePanel >> initializeUndoButton [
	undoButton := self newButton.
	undoButton
		label: 'Undo';
		icon: (self iconNamed: #smallUndo)
]
