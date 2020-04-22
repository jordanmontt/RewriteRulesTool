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
		add: #title height: RewriteRulesPresenter titleHeight;
		add: #textModel;
		yourself
]

{ #category : #initialization }
OutputCodePresenter >> initializePresenters [
	super initializePresenters.
	title := self instantiate: TitlePresenter.
	title name: 'Output code'
]
