"
I am a button that can redo a change
"
Class {
	#name : #RedoRuleButton,
	#superclass : #SpPresenter,
	#instVars : [
		'redoButton'
	],
	#category : #'RewriteRules-Presenters-Builder'
}

{ #category : #specs }
RedoRuleButton class >> defaultSpec [
	^ SpBoxLayout newVertical
		add: #redoButton;
		yourself
]

{ #category : #initialization }
RedoRuleButton >> initializePresenters [
	redoButton := self newButton.
	redoButton label: 'Redo'; icon: (self iconNamed: #smallRedo)
]
