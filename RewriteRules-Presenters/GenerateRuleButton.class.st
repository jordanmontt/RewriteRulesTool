"
If you press me I will be save the rule
"
Class {
	#name : #GenerateRuleButton,
	#superclass : #SpPresenter,
	#instVars : [
		'generateButton'
	],
	#category : #'RewriteRules-Presenters-Builder'
}

{ #category : #specs }
GenerateRuleButton class >> defaultSpec [
	^ SpBoxLayout newVertical add: #generateButton; yourself
]

{ #category : #initialization }
GenerateRuleButton >> initializePresenters [
	generateButton := self newButton.
	generateButton label: 'Generate rule'; icon: (self iconNamed: #smallSave)
]
