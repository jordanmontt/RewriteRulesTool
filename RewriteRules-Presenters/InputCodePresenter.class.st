"
input code presenter
"
Class {
	#name : #InputCodePresenter,
	#superclass : #AbstractCodePanelPresenter,
	#instVars : [
		'title'
	],
	#category : #'RewriteRules-Presenters-Builder'
}

{ #category : #specs }
InputCodePresenter class >> defaultSpec [
	^ SpBoxLayout newVertical
		add: #title height: self titleHeight;
		add: #textModel;
		yourself
]

{ #category : #specs }
InputCodePresenter class >> titleHeight [
	^ 35
]

{ #category : #initialization }
InputCodePresenter >> initializePresenters [
	super initializePresenters.
	title := self instantiate: TitlePresenter.
	title name: 'Input code'
]
