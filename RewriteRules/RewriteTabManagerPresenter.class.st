"
I am the tab manager for the Rewrite Rules UI
"
Class {
	#name : #RewriteTabManagerPresenter,
	#superclass : #SpNotebookPresenter,
	#instVars : [
		'browseRulesTab',
		'buildRulesTab',
		'informationTab',
		'matchRulesTab'
	],
	#category : #'RewriteRules-MainInterface'
}

{ #category : #initialization }
RewriteTabManagerPresenter >> initialize [
	super initialize.
	self initializeTabs
]

{ #category : #initialization }
RewriteTabManagerPresenter >> initializeBrowseRulesTab [
	browseRulesTab := SpNotebookPage
		title: 'Browse and apply saved Rewrite Rules'
		icon: (self iconNamed: #catalog)
		provider: [ self rewriteRulesBrowserPresenter ]
]

{ #category : #initialization }
RewriteTabManagerPresenter >> initializeBuildRulesTab [
	buildRulesTab := (SpNotebookPage
		title: 'Create Rewrite Rules'
		icon: (self iconNamed: #configuration)
		provider: [ self rewriteRulesBuilderPresenter ])
]

{ #category : #initialization }
RewriteTabManagerPresenter >> initializeInformationTab [
	informationTab :=  SpNotebookPage
		title: 'Rewrite Rules Information'
		icon: (self iconNamed: #smallInfo)
		provider: [ self rewriteRulesInformationPresenter ]
]

{ #category : #initialization }
RewriteTabManagerPresenter >> initializeMatchTab [
	matchRulesTab := SpNotebookPage
		title: 'Match Rewrite Rules'
		icon: (self iconNamed: #smallObjects)
		provider: [ self rewriteRulesMatcherPresenter ]
]

{ #category : #initialization }
RewriteTabManagerPresenter >> initializeTabs [
	self initializeBrowseRulesTab.
	self initializeBuildRulesTab.
	self initializeInformationTab.
	self initializeMatchTab.
	self
		addPage: buildRulesTab;
		addPage: matchRulesTab;
		addPage: browseRulesTab;
		addPage: informationTab
]

{ #category : #initialization }
RewriteTabManagerPresenter >> rewriteRulesBrowserPresenter [
	^ RulesBrowserPresenter new
]

{ #category : #initialization }
RewriteTabManagerPresenter >> rewriteRulesBuilderPresenter [

	^ RulesBuilderPresenter new
]

{ #category : #initialization }
RewriteTabManagerPresenter >> rewriteRulesInformationPresenter [
	^ RulesInformationHelperPresenter new
]

{ #category : #initialization }
RewriteTabManagerPresenter >> rewriteRulesMatcherPresenter [
	^ RulesMatcherPresenter new
]
