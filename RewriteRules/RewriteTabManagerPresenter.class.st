"
I am the tab manager for the Rewrite Rules UI
"
Class {
	#name : #RewriteTabManagerPresenter,
	#superclass : #SpPresenter,
	#instVars : [
		'tabManager'
	],
	#category : #'RewriteRules-TabManager'
}

{ #category : #specs }
RewriteTabManagerPresenter class >> defaultSpec [
	^ SpBoxLayout newVertical add: #tabManager;yourself
]

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
RewriteTabManagerPresenter >> connectPresenters [
	
]

{ #category : #initialization }
RewriteTabManagerPresenter >> informationTab [
	^ SpNotebookPage
		title: 'Rewrite Rules Information'
		icon: (self iconNamed: #smallInfo)
		provider: [ self rewriteRulesInformationPresenter ]
]

{ #category : #initialization }
RewriteTabManagerPresenter >> initializePresenters [
	tabManager := self newNotebook. self initializeTabs
]

{ #category : #initialization }
RewriteTabManagerPresenter >> initializeTabs [
	tabManager addPage: self buildRulesTab; addPage: self browseRulesTab; addPage: self matchRulesTab; addPage: self informationTab
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
	^ RewriteRulesBrowserPresenter new
]

{ #category : #initialization }
RewriteTabManagerPresenter >> rewriteRulesBuilderPresenter [

	^ RewriteRulesBuilderPresenter new
]

{ #category : #initialization }
RewriteTabManagerPresenter >> rewriteRulesInformationPresenter [
	^ RewriteRulesInformationPresenter new
]

{ #category : #initialization }
RewriteTabManagerPresenter >> rewriteRulesMatcherPresenter [
	^ RewriteRulesMatcherPresenter
]
