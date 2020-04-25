"
I am an Abstract class for the packages, classes and methods list. you must set the value of selectionChangeBlock variable.
"
Class {
	#name : #AbstractBrowserPresenter,
	#superclass : #SpPresenter,
	#instVars : [
		'listPresenter',
		'selectionChangeBlock',
		'titlePresenter'
	],
	#category : #'RewriteRules-Presenters-Browser'
}

{ #category : #specs }
AbstractBrowserPresenter class >> defaultSpec [
	^ SpBoxLayout newVertical
		add: #titlePresenter
			withConstraints: [ :constraints | constraints height: RewriteRulesPresenter titleHeight ];
		add: #listPresenter;
		yourself
]

{ #category : #initialization }
AbstractBrowserPresenter >> connectPresenters [
	listPresenter whenSelectionChangedDo: [ selectionChangeBlock value ]
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
		add: titlePresenter;
		add: listPresenter
]

{ #category : #initialization }
AbstractBrowserPresenter >> initializeTitlePresenter [
	titlePresenter := self instantiate: TitlePresenter.
]

{ #category : #api }
AbstractBrowserPresenter >> items: aCollection [
	listPresenter items: aCollection
]

{ #category : #api }
AbstractBrowserPresenter >> name: aName [
	titlePresenter name: aName.
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
