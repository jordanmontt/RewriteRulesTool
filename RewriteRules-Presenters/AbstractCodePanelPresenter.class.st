"
I am an abstract class. My subclasses are one of four panels of RewriteRuleBuilder tool.
I am responsible for implementation of all actions that can be applied to ast nodes in RewriteRuleBuilder tool.
Also I update self ast ant text, that is displayed.

Instance Variables
	contentText:		<LabeledTextModel>
	varNames:		<OrderedCollection>

contentText
	- an instance of LabeledTextModel

varNames
	- holds names of all metavariables currently existing in MatchPanel

"
Class {
	#name : #AbstractCodePanelPresenter,
	#superclass : #SpPresenter,
	#instVars : [
		'textModel'
	],
	#category : #'RewriteRules-Presenters-Builder'
}

{ #category : #specs }
AbstractCodePanelPresenter class >> defaultSpec [
	^ SpBoxLayout newVertical add: #textModel; yourself
]

{ #category : #initialization }
AbstractCodePanelPresenter >> initializePresenters [
	textModel := self newCode
]
