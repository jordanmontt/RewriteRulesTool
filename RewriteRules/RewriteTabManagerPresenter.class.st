"
I am the tab manager for the Rewrite Rules UI
"
Class {
	#name : #RewriteTabManagerPresenter,
	#superclass : #SpNotebookPresenter,
	#category : #'RewriteRules-MainInterface'
}

{ #category : #initialization }
RewriteTabManagerPresenter >> browseRulesTab [
	^ SpNotebookPage
		title: 'Browse and apply saved Rewrite Rules'
		icon: (self iconNamed: #catalog)
		provider: [ self rewriteRulesBrowserPresenter ]
]

{ #category : #initialization }
RewriteTabManagerPresenter >> buildRulesTab [
	^ SpNotebookPage
		title: 'Create Rewrite Rules'
		icon: (self iconNamed: #configuration)
		provider: [ self rewriteRulesBuilderPresenter ]
]

{ #category : #initialization }
RewriteTabManagerPresenter >> informationTab [
	^ SpNotebookPage
		title: 'Rewrite Rules Information'
		icon: (self iconNamed: #smallInfo)
		provider: [ self rewriteRulesInformationPresenter ]
]

{ #category : #initialization }
RewriteTabManagerPresenter >> initialize [
	super initialize.
	self initializeTabs
]

{ #category : #initialization }
RewriteTabManagerPresenter >> initializeTabs [
	self
		addPage: self buildRulesTab;
		addPage: self matchRulesTab;
		addPage: self browseRulesTab;
		addPage: self informationTab
]

{ #category : #initialization }
RewriteTabManagerPresenter >> matchRulesTab [
	^ SpNotebookPage
		title: 'Match Rewrite Rules'
		icon: (self iconNamed: #smallObjects)
		provider: [ self rewriteRulesMatcherPresenter ]
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
	^ RulesInformationPresenter new
]

{ #category : #initialization }
RewriteTabManagerPresenter >> rewriteRulesMatcherPresenter [
	^ RulesMatcherPresenter new
]
