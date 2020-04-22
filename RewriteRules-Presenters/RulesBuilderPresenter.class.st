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
		'inputArrow',
		'outputArrow'
	],
	#category : #'RewriteRules-Presenters-Builder'
}

{ #category : #specs }
RulesBuilderPresenter class >> defaultSpec [
]

{ #category : #specs }
RulesBuilderPresenter class >> height [
	 ^40
]

{ #category : #specs }
RulesBuilderPresenter class >> width [
^50 
]
