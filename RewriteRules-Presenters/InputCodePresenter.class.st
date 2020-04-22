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
		add: #title height: RewriteRulesPresenter titleHeight;
		add: #textModel;
		yourself
]

{ #category : #initialization }
InputCodePresenter >> initializePresenters [
	super initializePresenters.
	title := self instantiate: TitlePresenter.
	title name: 'Input code'
]
