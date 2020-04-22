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
		'codeInputArrow',
		'codeOutputArrow'
	],
	#category : #'RewriteRules-Presenters-Builder'
}

{ #category : #specs }
RulesBuilderPresenter class >> defaultSpec [
	| paddingConstraints |
	paddingConstraints := [ :constraints | constraints padding: RewriteRulesPresenter toolPadding ].
	^ SpBoxLayout newVertical
		add:
			(SpBoxLayout newHorizontal
				add: #inputCode withConstraints: paddingConstraints;
				add: #outputCode withConstraints: paddingConstraints;
				yourself);
		add: #transformationRule
			withConstraints: [ :constraints | 
			constraints
				height: self height;
				padding: RewriteRulesPresenter toolPadding ];
		yourself
]

{ #category : #specs }
RulesBuilderPresenter class >> height [
	^ (RewriteRulesPresenter toolHeight - 20 ) / 2
]

{ #category : #initialization }
RulesBuilderPresenter >> initializePresenters [
	transformationRule := self instantiate: TransformationRulePanel.
	inputCode := self instantiate: InputCodePresenter.
	outputCode := self instantiate: OutputCodePresenter
]
