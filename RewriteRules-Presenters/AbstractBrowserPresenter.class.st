"
I am an Abstract class for the packages, classes and methods list. you must set the value of selectionChangeBlock variable.
"
Class {
	#name : #AbstractBrowserPresenter,
	#superclass : #SpPresenter,
	#instVars : [
		'listPresenter',
		'selectionChangeBlock',
		'titleName',
		'titlePresenter'
	],
	#category : #'RewriteRules-Presenters-Browser'
}

{ #category : #specs }
AbstractBrowserPresenter class >> defaultSpec [
	^ SpBoxLayout newVertical
		add: #titlePresenter
			withConstraints: [ :constraints | 
			constraints
				padding: self padding;
				height: self titleHeight ];
		add: #listPresenter withConstraints: [ :constraints | constraints padding: self padding ];
		yourself
]

{ #category : #specs }
AbstractBrowserPresenter class >> padding [
	^ 4
]

{ #category : #specs }
AbstractBrowserPresenter class >> titleHeight [
	^ 32
]

{ #category : #initialization }
AbstractBrowserPresenter >> connectPresenters [
	listPresenter whenSelectionChangedDo: [ selectionChangeBlock value ]
]

{ #category : #initialization }
AbstractBrowserPresenter >> initialize [
super initialize .
	titleName := ''
]

{ #category : #initialization }
AbstractBrowserPresenter >> initializeListPresenter [
	listPresenter := self newList.
]

{ #category : #initialization }
AbstractBrowserPresenter >> initializePresenters [
	self initializeTitlePresenter.
	self initializeListPresenter.
	self focusOrder
		add: #titlePresenter;
		add: #listPresenter
]

{ #category : #initialization }
AbstractBrowserPresenter >> initializeTitlePresenter [
	| morph |
	morph := StringMorph
		contents: titleName
		font:
			(LogicalFont
				familyName: Smalltalk ui theme labelFont familyName
				pointSize: Smalltalk ui theme labelFont pointSize + 5).
	titlePresenter := SpMorphPresenter new
		morph: (PanelMorph new addMorphFront: morph);
		yourself
]

{ #category : #api }
AbstractBrowserPresenter >> items: aCollection [
	listPresenter items: aCollection
]

{ #category : #api }
AbstractBrowserPresenter >> name: aName [
	titleName := aName.
	(titlePresenter morph submorphs at: 1) contents: aName
]

{ #category : #api }
AbstractBrowserPresenter >> resetListSelection [
	listPresenter resetListSelection
]

{ #category : #api }
AbstractBrowserPresenter >> selectedItems [
	^ listPresenter selectedItems
]

{ #category : #api }
AbstractBrowserPresenter >> selectionChangeBlock: aBlock [
	selectionChangeBlock := aBlock 
]
