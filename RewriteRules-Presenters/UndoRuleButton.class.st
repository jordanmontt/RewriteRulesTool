"
I am an undo button.
"
Class {
	#name : #UndoRuleButton,
	#superclass : #SpPresenter,
	#instVars : [
		'undoButton'
	],
	#category : #'RewriteRules-Presenters-Builder'
}

{ #category : #specs }
UndoRuleButton class >> defaultSpec [
	^ SpBoxLayout newVertical
		add: #undoButton;
		yourself
]

{ #category : #initialization }
UndoRuleButton >> initializePresenters [
	undoButton := self newButton.
	undoButton
		label: 'Undo';
		icon: (self iconNamed: #smallUndo)
]
