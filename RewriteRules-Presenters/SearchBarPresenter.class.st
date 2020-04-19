"
I am the search bar that filters the packages.
An user of mine has to set these variables: 
	seachMatchOcurredBlock
	searchMatchDidntOcurredBlock
	fillWithAllItemsBlock""
"
Class {
	#name : #SearchBarPresenter,
	#superclass : #SpPresenter,
	#instVars : [
		'searchBar',
		'seachMatchOcurredBlock',
		'searchMatchDidntOcurredBlock',
		'fillWithAllItemsBlock'
	],
	#category : #'RewriteRules-Presenters-Browser'
}

{ #category : #specs }
SearchBarPresenter class >> defaultSpec [
	^ SpBoxLayout newVertical add: #searchBar;yourself
]

{ #category : #searching }
SearchBarPresenter >> areMatchingItemsValid: matchingItems [
	^ matchingItems isNotEmpty
		and: [ self noneNilItemsPresent: matchingItems ]
]

{ #category : #initialization }
SearchBarPresenter >> createSearchMorph [
	^ SearchMorph new
		model: self;
		updateSelector: #search:;
		ghostText: 'Search for Packages';
		yourself
]

{ #category : #api }
SearchBarPresenter >> fillWithAllItemsBlock: anObject [
	fillWithAllItemsBlock := anObject
]

{ #category : #initialization }
SearchBarPresenter >> initializePresenters [
	searchBar := SpMorphPresenter new morph: self createSearchMorph.
	self focusOrder add: #searchBar.
]

{ #category : #searching }
SearchBarPresenter >> isSearchTermEmpty: searchTerm [
	^ searchTerm = ''
]

{ #category : #searching }
SearchBarPresenter >> noneNilItemsPresent: matchingItems [
	^ matchingItems allSatisfy: [ :any | any isNotNil ]
]

{ #category : #actions }
SearchBarPresenter >> obtainMatchingItems: searchTerm [
	^ self obtainSystemPackages
		select: [ :each | ('' join: {'*' . searchTerm . '*'}) match: each name asString ]
]

{ #category : #actions }
SearchBarPresenter >> obtainSystemPackages [
	^ SystemPackagesProvider obtainSystemPackages
]

{ #category : #actions }
SearchBarPresenter >> performFillWithAllItemsBlock [
	fillWithAllItemsBlock value
]

{ #category : #actions }
SearchBarPresenter >> performSearchMatchDidntOcurredBlock [
	searchMatchDidntOcurredBlock value
]

{ #category : #actions }
SearchBarPresenter >> performSearchMatchOcurredBlock: matchingItems [
	seachMatchOcurredBlock value: matchingItems.
]

{ #category : #api }
SearchBarPresenter >> seachMatchOcurredBlock: anObject [
	seachMatchOcurredBlock := anObject
]

{ #category : #searching }
SearchBarPresenter >> search: searchTerm [
	| matchingItems |
	(self isSearchTermEmpty: searchTerm)
		ifTrue: [ self performFillWithAllItemsBlock ]
		ifFalse: [ matchingItems := self obtainMatchingItems: searchTerm.
			(self areMatchingItemsValid: matchingItems)
				ifTrue: [ self performSearchMatchOcurredBlock: matchingItems ]
				ifFalse: [ self performSearchMatchDidntOcurredBlock ] ]
]

{ #category : #api }
SearchBarPresenter >> searchMatchDidntOcurredBlock: anObject [
	searchMatchDidntOcurredBlock := anObject
]
