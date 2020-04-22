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
	^ SpBoxLayout newVertical add: #transformationRule; yourself
]

{ #category : #specs }
RulesBuilderPresenter class >> height [
	 ^40
]

{ #category : #specs }
RulesBuilderPresenter class >> width [
^50 
]

{ #category : #initialization }
RulesBuilderPresenter >> initializePresenters [
	transformationRule := self instantiate: TransformationRulePanel
]
