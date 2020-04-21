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
		add: #label height: self height;
		add: #codeArea;
		yourself
]

{ #category : #specs }
MatcherCodePresenter class >> height [
	^ 29
]

{ #category : #initialization }
MatcherCodePresenter >> initializeCodeArea [
	codeArea := self newCode
]

{ #category : #initialization }
MatcherCodePresenter >> initializeLabel [
	label := self instantiate: TitlePresenter
]

{ #category : #initialization }
MatcherCodePresenter >> initializePresenters [
	self initializeLabel.
	self initializeCodeArea.
	self focusOrder add: #label; add: #codeArea
]

{ #category : #accesing }
MatcherCodePresenter >> label: aName [
	label name: aName
]
