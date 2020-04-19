"
I am a child of AbstractBrowserPresenter and I show all the available classes of a package.
"
Class {
	#name : #ClassesBrowserPresenter,
	#superclass : #AbstractBrowserPresenter,
	#category : #'RewriteRules-Presenters-Browser'
}

{ #category : #initialization }
ClassesBrowserPresenter >> initializeListPresenter [
super initializeListPresenter .
	listPresenter beMultipleSelection.
	listPresenter display: [ :item | item name ].
	listPresenter icons: [ self iconNamed: #classIcon ].
	listPresenter sortingBlock: [ :a :b | a name < b name ]
]

{ #category : #initialization }
ClassesBrowserPresenter >> initializePresenters [
	super initializePresenters.
	self name: 'Classes'.
]
