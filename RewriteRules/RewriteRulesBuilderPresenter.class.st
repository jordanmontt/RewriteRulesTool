"
I provide the UI to create customized rewrite rules.
"
Class {
	#name : #RewriteRulesBuilderPresenter,
	#superclass : #SpPresenter,
	#category : #'RewriteRules-RulesBuilder'
}

{ #category : #specs }
RewriteRulesBuilderPresenter class >> defaultSpec [
	^ SpBoxLayout newVertical
]
