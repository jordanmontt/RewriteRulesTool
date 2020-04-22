"
I am the code presenter for the MatchRule.
"
Class {
	#name : #MatcherCodePresenter,
	#superclass : #SpPresenter,
	#instVars : [
		'codeArea',
		'title'
	],
	#category : #'RewriteRules-Presenters-Matcher'
}

{ #category : #specs }
MatcherCodePresenter class >> defaultSpec [
	^ SpBoxLayout newVertical
		add: #title height: RewriteRulesPresenter titleHeight;
		add: #codeArea;
		yourself
]

{ #category : #initialization }
MatcherCodePresenter >> initializeCodeArea [
	codeArea := self newCode
]

{ #category : #initialization }
MatcherCodePresenter >> initializeLabel [
	title := self instantiate: TitlePresenter
]

{ #category : #initialization }
MatcherCodePresenter >> initializePresenters [
	self initializeLabel.
	self initializeCodeArea.
	self focusOrder add: #label; add: #codeArea
]

{ #category : #accesing }
MatcherCodePresenter >> label: aName [
	title name: aName
]
