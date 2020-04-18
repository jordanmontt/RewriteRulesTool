"
I provide the UI to browse all the rewrite rules that have been created and saved. You can apply those rules to any class.
"
Class {
	#name : #RulesBrowserPresenter,
	#superclass : #SpPresenter,
	#category : #'RewriteRules-Presenters-Browser'
}

{ #category : #specs }
RulesBrowserPresenter class >> defaultSpec [
^ SpBoxLayout newVertical 
]
