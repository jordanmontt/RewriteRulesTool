"
I provide the UI to create customized rewrite rules.
"
Class {
	#name : #RulesBuilderPresenter,
	#superclass : #SpPresenter,
	#category : #'RewriteRules-Presenters-Builder'
}

{ #category : #specs }
RulesBuilderPresenter class >> defaultSpec [
	^ SpBoxLayout newVertical
]