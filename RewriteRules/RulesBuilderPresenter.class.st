"
I provide the UI to create customized rewrite rules.
"
Class {
	#name : #RulesBuilderPresenter,
	#superclass : #SpPresenter,
	#category : #'RewriteRules-RulesBuilder'
}

{ #category : #specs }
RulesBuilderPresenter class >> defaultSpec [
	^ SpBoxLayout newVertical
]
