Class {
	#name : #RulesBrowserPresenterTest,
	#superclass : #TestCase,
	#instVars : [
		'rulesBrowser'
	],
	#category : #'RewriteRules-Tests'
}

{ #category : #running }
RulesBrowserPresenterTest >> setUp [
	rulesBrowser := RulesBrowserPresenter new.
	
]

{ #category : #running }
RulesBrowserPresenterTest >> testSelectedClassesChanged [
	"If one or more classes are selecteded, all the selectors of those classes should be in the methods list"

	| selectedClasses selectorsOfTheSelectedClasses |
	selectedClasses := OrderedCollection new
		add: OrderedCollection;
		add: String;
		yourself.
	selectorsOfTheSelectedClasses := OrderedCollection new.
	selectedClasses
		do: [ :c | selectorsOfTheSelectedClasses addAll: c selectors ].
	rulesBrowser classes items: Smalltalk globals allClasses.
	rulesBrowser classes selectItems: selectedClasses.
	self
		assertCollection: rulesBrowser classes selectedItems
		hasSameElements: selectedClasses.
	self
		assertCollection: rulesBrowser methods items
		hasSameElements: selectorsOfTheSelectedClasses
]

{ #category : #running }
RulesBrowserPresenterTest >> testSelectedPackagesChanged [
	"If one or more packages are selecteded, all the classes of those packages should be in the classes list"

	| selectedPackages classesOfTheSelectedPackages |
	selectedPackages := OrderedCollection new
		add: (RPackageOrganizer default packageNamed: #'RewriteRules-Presenters');
		add: (RPackageOrganizer default packageNamed: #'RewriteRules-Core');
		yourself.
	classesOfTheSelectedPackages := OrderedCollection new.
	selectedPackages
		do: [ :each | classesOfTheSelectedPackages addAll: each classes ].
	rulesBrowser packages selectItems: selectedPackages.
	self
		assert: rulesBrowser packages selectedItems size
		equals: selectedPackages size.
	self
		assertCollection: rulesBrowser classes items
		hasSameElements: classesOfTheSelectedPackages.
	self
		assertCollection: rulesBrowser methods items
		hasSameElements: #()
]
