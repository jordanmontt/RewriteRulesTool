"
I have the basic information of how the rewrite rules work and how their syntax is written.
"
Class {
	#name : #RulesInformationPresenter,
	#superclass : #SpPresenter,
	#category : #'RewriteRules-RulesInformation'
}

{ #category : #specs }
RulesInformationPresenter class >> defaultSpec [
	^ SpBoxLayout newVertical
]
