"
I am the code presenter for the MatchRule.
"
Class {
	#name : #MatcherCodePresenter,
	#superclass : #SpPresenter,
	#instVars : [
		'codeArea',
		'label'
	],
	#category : #'RewriteRules-Presenters-Matcher'
}

{ #category : #specs }
MatcherCodePresenter class >> defaultSpec [
	^ SpBoxLayout newVertical
		add: #label height: 30 ;
		add: #codeArea;
		yourself
]

{ #category : #initialization }
MatcherCodePresenter >> initializeCodeArea [
	codeArea := self newCode
]

{ #category : #initialization }
MatcherCodePresenter >> initializeLabel [
	label := self newLabel
]

{ #category : #initialization }
MatcherCodePresenter >> initializePresenters [
	self initializeLabel.
	self initializeCodeArea.
	self focusOrder add: #label; add: #codeArea
]

{ #category : #accesing }
MatcherCodePresenter >> label: aName [
	label label: aName
]
