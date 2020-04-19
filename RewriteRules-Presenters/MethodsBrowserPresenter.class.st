"
I am a child of AbstractBrowserPresenter and I show all the available methods of a class.
"
Class {
	#name : #MethodsBrowserPresenter,
	#superclass : #AbstractBrowserPresenter,
	#category : #'RewriteRules-Presenters-Browser'
}

{ #category : #initialization }
MethodsBrowserPresenter >> initializeListPresenter [
	super initializeListPresenter.
	listPresenter beSingleSelection.
	listPresenter display: [ :item | '    ' , item selector asString ]
]

{ #category : #initialization }
MethodsBrowserPresenter >> initializePresenters [
	super initializePresenters.
	self name: 'Methods'
]
