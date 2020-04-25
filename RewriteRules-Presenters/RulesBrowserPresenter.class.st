"
I provide the UI to browse all the rewrite rules that have been created and saved. You can apply those rules to any class.
"
Class {
	#name : #RulesBrowserPresenter,
	#superclass : #SpPresenter,
	#instVars : [
		'searchBar',
		'packages',
		'classes',
		'methods',
		'actionBar'
	],
	#category : #'RewriteRules-Presenters-Browser'
}

{ #category : #specs }
RulesBrowserPresenter class >> defaultSpec [
	| paddingConstraints |
	paddingConstraints := [ :constraints | constraints padding: RewriteRulesPresenter toolPadding ].
	^ SpBoxLayout newVertical
		add:
			(SpBoxLayout newHorizontal
				add:
					(SpBoxLayout newVertical								
						add: #packages withConstraints: paddingConstraints;
						yourself);
				add: #classes withConstraints: paddingConstraints;
				add: #methods withConstraints: paddingConstraints);
		add: #actionBar
			withConstraints: [ :constraints | 
			constraints
				padding: RewriteRulesPresenter toolPadding;
				height: self height ];
		yourself
]

{ #category : #specs }
RulesBrowserPresenter class >> height [
	^ 40
]

{ #category : #defaults }
RulesBrowserPresenter >> areSelectedItemsValid: selectedItems [
	^ (selectedItems isNotEmpty)
		and: [ selectedItems allSatisfy: [ :package | package isNotNil ] ]
]

{ #category : #initialization }
RulesBrowserPresenter >> connectPresenters [
	packages
		whenSelectionChangedDo:
			[ :selection | [ self selectedPackagesChanged ] cull: selection selectedItems ].
	classes
		whenSelectionChangedDo:
			[ :selection | [ self selectedClassesChanged ] cull: selection selectedItems ].
	methods
		whenSelectionChangedDo:
			[ :selection | [ self selectedMethodsChanged ] cull: selection selectedItems ]
]

{ #category : #defaults }
RulesBrowserPresenter >> fillMethodsPane: selectedClasses [
	| allMethodsInClasses |
	allMethodsInClasses := OrderedCollection new.
	selectedClasses
		do: [ :eachClass | allMethodsInClasses addAll: eachClass selectors].
	methods items: allMethodsInClasses.
	methods resetListSelection
]

{ #category : #defaults }
RulesBrowserPresenter >> iconFor: class [
	((class
		includesBehavior: (Smalltalk globals at: #TestCase ifAbsent: [ false ]))
		and: [ class isAbstract not ])
		ifTrue: [ class hasPassedTest
				ifTrue: [ ^ self iconNamed: #testGreenIcon ].
			class hasFailedTest
				ifTrue: [ ^ self iconNamed: #testYellowIcon ].
			class hasErrorTest
				ifTrue: [ ^ self iconNamed: #testRedIcon ].
			^ self iconNamed: #testNotRunIcon ].
	class organization classComment
		ifEmpty: [ ^ self iconNamed: #uncommentedClassIcon ].
	((class
		includesBehavior: (Smalltalk globals at: #TestCase ifAbsent: [ false ]))
		and: [ class isAbstract not ])
		ifTrue: [ class hasPassedTest
				ifTrue: [ ^ self iconNamed: #testGreenIcon ].
			class hasFailedTest
				ifTrue: [ ^ self iconNamed: #testYellowIcon ].
			class hasErrorTest
				ifTrue: [ ^ self iconNamed: #testRedIcon ].
			^ self iconNamed: #testNotRunIcon ].
	class organization classComment
		ifEmpty: [ ^ self iconNamed: #uncommentedClassIcon ].
	^ class systemIcon
]

{ #category : #initialization }
RulesBrowserPresenter >> initializePresenters [
	packages := self newList.
	classes := self newList.
	methods := self newList.
	actionBar := self instantiate: BrowserActionBar.
	packages
		items: self obtainSystemPackages;
		enableItemSubstringFilter;
		icons: [ :elem | self iconNamed: #packageIcon ];
		sortingBlock: [ :a :b | a name < b name ];
		display: [ :item | item name ];
		beMultipleSelection.
	classes
		enableItemSubstringFilter;
		icons: [ :elem | self iconFor: elem ];
		sortingBlock: [ :a :b | a name < b name ];
		display: [ :item | item name ];
		beMultipleSelection.
	methods
		enableItemSubstringFilter;
		display: [ :item | '    ' , item ].
	self focusOrder
		add: packages;
		add: classes;
		add: methods;
		add: actionBar
]

{ #category : #defaults }
RulesBrowserPresenter >> obtainAllClassesOfSelectedPackages: selectedPackages [
	| classesInPackage |
	classesInPackage := OrderedCollection new.
	selectedPackages
		do: [ :each | classesInPackage addAll: each classes ].
	^ classesInPackage
]

{ #category : #defaults }
RulesBrowserPresenter >> obtainSystemPackages [
	^ RBBrowserEnvironment new packages
]

{ #category : #'event handling' }
RulesBrowserPresenter >> selectedClassesChanged [
	| selectedClasses |
	selectedClasses := classes selectedItems.
	(self areSelectedItemsValid: selectedClasses)
		ifFalse: [ ^ self ].
	self fillMethodsPane: selectedClasses
]

{ #category : #'event handling' }
RulesBrowserPresenter >> selectedMethodsChanged [
]

{ #category : #'event handling' }
RulesBrowserPresenter >> selectedPackagesChanged [
	| selectedPackages classesInPackage |
	selectedPackages := packages selectedItems.
	(self areSelectedItemsValid: selectedPackages)
		ifFalse: [ ^ self ].
	classesInPackage := self
		obtainAllClassesOfSelectedPackages: selectedPackages.
	self updateClassesItems: classesInPackage
]

{ #category : #defaults }
RulesBrowserPresenter >> updateClassesItems: classesInPackage [
	classes items: classesInPackage.
	classes resetListSelection
]
