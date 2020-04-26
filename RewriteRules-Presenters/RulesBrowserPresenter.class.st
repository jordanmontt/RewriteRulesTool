"
I provide the UI to browse all the rewrite rules that have been created and saved. You can apply those rules to any class.
"
Class {
	#name : #RulesBrowserPresenter,
	#superclass : #SpPresenter,
	#instVars : [
		'packages',
		'classes',
		'methods',
		'actionBar'
	],
	#category : #'RewriteRules-Presenters-Browser'
}

{ #category : #specs }
RulesBrowserPresenter class >> defaultSpec [
	| paddingConstraints actionBarConstraints |
	paddingConstraints := [ :constraints | constraints padding: RewriteRulesPresenter toolPadding ].
	actionBarConstraints := [ :constraints | 
	constraints
		padding: RewriteRulesPresenter toolPadding;
		height: 50 ].
	^ SpBoxLayout newVertical
		add:
			(SpBoxLayout newHorizontal
				add: #packages withConstraints: paddingConstraints;
				add: #classes withConstraints: paddingConstraints;
				add: #methods withConstraints: paddingConstraints;
				yourself);
		add: #actionBar withConstraints: actionBarConstraints;
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

{ #category : #accessing }
RulesBrowserPresenter >> classes [
	^ classes
]

{ #category : #initialization }
RulesBrowserPresenter >> connectPresenters [
	packages
		whenSelectionChangedDo:
			[ :selection | [ self selectedPackagesChanged ] cull: selection selectedItems ].
	classes
		whenSelectionChangedDo:
			[ :selection | [ self selectedClassesChanged ] cull: selection selectedItems ]
]

{ #category : #defaults }
RulesBrowserPresenter >> iconForClass: class [
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
RulesBrowserPresenter >> initializeActionBar [
	actionBar := self instantiate: BrowserActionBar
]

{ #category : #initialization }
RulesBrowserPresenter >> initializeClassesPresenters [
	classes := self newList.
	classes
		headerTitle: 'Classes';
		display: [ :item | item name ];
		icons: [ :elem | self iconForClass: elem ];
		sortingBlock: [ :a :b | a name < b name ];
		enableItemSubstringFilter;
		beMultipleSelection
]

{ #category : #initialization }
RulesBrowserPresenter >> initializeMethodsPresenters [
	methods := self newList.
	methods
		headerTitle: 'Methods';
		display: [ :item | '    ' , item ];
		enableItemSubstringFilter
		
]

{ #category : #initialization }
RulesBrowserPresenter >> initializePackagesPresenters [
	packages := self newList.
	packages
		items: self obtainSystemPackages;
		headerTitle: 'Packages';
		display: [ :item | item name ];
		icons: [ :elem | self iconNamed: #packageIcon ];
		sortingBlock: [ :a :b | a name < b name ];
		enableItemSubstringFilter;
		beMultipleSelection
]

{ #category : #initialization }
RulesBrowserPresenter >> initializePresenters [
	self initializePackagesPresenters.
	self initializeClassesPresenters.
	self initializeMethodsPresenters.
	self initializeActionBar.
	self focusOrder
		add: packages;
		add: classes;
		add: methods;
		add: actionBar
]

{ #category : #accessing }
RulesBrowserPresenter >> methods [
	^ methods
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

{ #category : #accessing }
RulesBrowserPresenter >> packages [
	^ packages
]

{ #category : #defaults }
RulesBrowserPresenter >> refreshClassesList: classesInPackage [
	classes unselectAll.
	classes items: classesInPackage.
	self refreshMethodsList: #()
]

{ #category : #defaults }
RulesBrowserPresenter >> refreshMethodsList: selectedClasses [
	| allMethodsInClasses |
	allMethodsInClasses := OrderedCollection new.
	selectedClasses
		do: [ :eachClass | allMethodsInClasses addAll: eachClass selectors ].
	methods unselectAll.
	methods items: allMethodsInClasses
]

{ #category : #'event handling' }
RulesBrowserPresenter >> selectedClassesChanged [
	| selectedClasses |
	selectedClasses := classes selectedItems.
	(self areSelectedItemsValid: selectedClasses)
		ifFalse: [ ^ self ].
	self refreshMethodsList: selectedClasses
]

{ #category : #'event handling' }
RulesBrowserPresenter >> selectedPackagesChanged [
	| selectedPackages classesInPackage |
	selectedPackages := packages selectedItems.
	(self areSelectedItemsValid: selectedPackages)
		ifFalse: [ ^ self ].
	classesInPackage := self
		obtainAllClassesOfSelectedPackages: selectedPackages.
	self refreshClassesList: classesInPackage
]
