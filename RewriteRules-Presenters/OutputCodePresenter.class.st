"
Output code presenter
"
Class {
	#name : #OutputCodePresenter,
	#superclass : #AbstractCodePanelPresenter,
	#instVars : [
		'title'
	],
	#category : #'RewriteRules-Presenters-Builder'
}

{ #category : #specs }
OutputCodePresenter class >> defaultSpec [
	^ SpBoxLayout newVertical
		add: #title height: self titleHeight;
		add: #textModel;
		yourself
]

{ #category : #specs }
OutputCodePresenter class >> titleHeight [
	^ 35 
]

{ #category : #initialization }
OutputCodePresenter >> initializePresenters [
	super initializePresenters.
	title := self instantiate: TitlePresenter.
	title name: 'Output code'
]
