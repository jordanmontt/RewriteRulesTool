"
I am a child of AbstractBrowserPresenter and I show all the available packages in the system.
"
Class {
	#name : #PackagesBrowserPresenter,
	#superclass : #AbstractBrowserPresenter,
	#category : #'RewriteRules-Presenters-Browser'
}

{ #category : #initialization }
PackagesBrowserPresenter >> initializeListPresenter [
	super initializeListPresenter.
	listPresenter beMultipleSelection.
	listPresenter display: [ :item | item name ].
	listPresenter icons: [ self iconNamed: #packageIcon ].
	listPresenter sortingBlock: [ :a :b | a name < b name ]
]

{ #category : #initialization }
PackagesBrowserPresenter >> initializePresenters [
	super initializePresenters.
	self items: SystemPackagesProvider obtainSystemPackages.
	self name: 'Packages'.
]
