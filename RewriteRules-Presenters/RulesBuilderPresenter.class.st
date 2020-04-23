"
I provide the UI to create customized rewrite rules.
"
Class {
	#name : #RulesBuilderPresenter,
	#superclass : #SpPresenter,
	#instVars : [
		'inputCode',
		'outputCode',
		'transformationRule',
		'codeInputStatus',
		'codeOutputStatus'
	],
	#category : #'RewriteRules-Presenters-Builder'
}

{ #category : #specs }
RulesBuilderPresenter class >> arrowHeight [
	^ 50
]

{ #category : #specs }
RulesBuilderPresenter class >> defaultSpec [
	| paddingConstraints statusBar |
	statusBar := SpBoxLayout newHorizontal
		add: #codeInputStatus;
		add: #codeOutputStatus;
		yourself.
	paddingConstraints := [ :constraints | constraints padding: RewriteRulesPresenter toolPadding ].
	^ SpBoxLayout newVertical
		add:
			(SpBoxLayout newHorizontal
				add: #inputCode withConstraints: paddingConstraints;
				add: #outputCode withConstraints: paddingConstraints;
				yourself);
		add: statusBar
			withConstraints: [ :constraints | constraints height: self arrowHeight ];
		add: #transformationRule
			withConstraints: [ :constraints | 
			constraints
				height: self height;
				padding: RewriteRulesPresenter toolPadding ];
		yourself
]

{ #category : #specs }
RulesBuilderPresenter class >> height [
	^ (RewriteRulesPresenter toolHeight - 70) / 2
]

{ #category : #initialization }
RulesBuilderPresenter >> initializePresenters [
	transformationRule := self instantiate: TransformationRulePanel.
	inputCode := self instantiate: InputCodePresenter.
	outputCode := self instantiate: OutputCodePresenter.
	codeInputStatus := self instantiate: InputStatusPresenter.
	codeOutputStatus := self instantiate: OutputStatusPresenter
]
