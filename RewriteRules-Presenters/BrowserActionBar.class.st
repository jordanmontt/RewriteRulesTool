"
I am the action bar for the browser presenter.
"
Class {
	#name : #BrowserActionBar,
	#superclass : #SpPresenter,
	#instVars : [
		'applyButton',
		'checkbox',
		'browseButton',
		'editButton',
		'rules'
	],
	#category : #'RewriteRules-Presenters-Browser'
}

{ #category : #specs }
BrowserActionBar class >> checkboxWidth [
	^ 160
]

{ #category : #specs }
BrowserActionBar class >> defaultSpec [
	^ SpBoxLayout newHorizontal
		add: #rules;
		add: #checkbox width: self checkboxWidth;
		add: #applyButton;
		add: #editButton;
		add: #browseButton;
		yourself
]

{ #category : #initialization }
BrowserActionBar >> initializeApplyButton [
	applyButton := self newButton.
	applyButton
		label: 'Apply rule';
		icon: (self iconNamed: #smallOk)
]

{ #category : #initialization }
BrowserActionBar >> initializeBrowseButton [
	browseButton := self newButton.
	browseButton
		label: 'Open rule in browser';
		icon: (self iconNamed: #smallOpen)
]

{ #category : #initialization }
BrowserActionBar >> initializeCheckbox [
	checkbox := self newCheckBox.
	checkbox label: 'Only custom rules'
]

{ #category : #initialization }
BrowserActionBar >> initializeEditButton [
	editButton := self newButton.
	editButton
		label: 'Edit rule';
		icon: (self iconNamed: #edit)
]

{ #category : #initialization }
BrowserActionBar >> initializePresenters [
	self initializeApplyButton.
	self initializeCheckbox.
	self initializeBrowseButton.
	self initializeEditButton.
	self initializeRulesDropList.
	self focusOrder
		add: applyButton;
		add: rules;
		add: checkbox;
		add: browseButton;
		add: editButton
]

{ #category : #initialization }
BrowserActionBar >> initializeRulesDropList [
	rules := self newDropList
]
