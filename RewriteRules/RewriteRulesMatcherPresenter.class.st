"
I match any rewrite rule with a block of Pharo code and I show all the matches.
"
Class {
	#name : #RewriteRulesMatcherPresenter,
	#superclass : #SpPresenter,
	#category : #'RewriteRules-RulesMatcher'
}

{ #category : #specs }
RewriteRulesMatcherPresenter class >> defaultSpec [
	^ SpBoxLayout newVertical
]
