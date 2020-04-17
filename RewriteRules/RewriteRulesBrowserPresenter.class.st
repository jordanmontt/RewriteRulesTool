"
I provide the UI to browse all the rewrite rules that have been created and saved. You can apply those rules to any class.
"
Class {
	#name : #RewriteRulesBrowserPresenter,
	#superclass : #SpPresenter,
	#category : #'RewriteRules-RulesBrowser'
}

{ #category : #specs }
RewriteRulesBrowserPresenter class >> defaultSpec [
^ SpBoxLayout newVertical 
]
