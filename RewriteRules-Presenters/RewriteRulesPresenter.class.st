"
I am the UI of the rewrite rules tool, a tool that allows you to create, match, browse, apply rewrite transformation rules. I also have basic information of how the rewrite rules work.
"
Class {
	#name : #RewriteRulesPresenter,
	#superclass : #SpPresenter,
	#instVars : [
		'tabManager'
	],
	#category : #'RewriteRules-Presenters-MainInterface'
}

{ #category : #specs }
RewriteRulesPresenter class >> aboutText [
	^ 'Build, match and browse customized Rewrite Rules.'
]

{ #category : #specs }
RewriteRulesPresenter class >> defaultSpec [
	^ SpBoxLayout newVertical
	add: #tabManager;
		yourself
]

{ #category : #specs }
RewriteRulesPresenter class >> menuCommandOn: aBuilder [
	<worldMenu>
	(aBuilder item: #'Rewrite Rules')
		action: [ self open ];
		order: 22;
		parent: #Tools;
		help: self aboutText;
		icon: self windowIcon;
		withSeparatorAfter
]

{ #category : #specs }
RewriteRulesPresenter class >> open [
	<script>
	^ self new
		openWithSpec
]

{ #category : #api }
RewriteRulesPresenter class >> titleHeight [
	^ 35
]

{ #category : #api }
RewriteRulesPresenter class >> toolHeight [
	^ 630
]

{ #category : #api }
RewriteRulesPresenter class >> toolPadding [
	^ 3
]

{ #category : #api }
RewriteRulesPresenter class >> toolWidth [
	^ 1100
]

{ #category : #specs }
RewriteRulesPresenter class >> windowIcon [
	^ (self iconNamed: #book) scaledToSize: 16 @ 16
]

{ #category : #initialization }
RewriteRulesPresenter >> initializePresenters [
	tabManager := self newNotebook.
	tabManager
		addPage:
			(SpNotebookPage
				title: 'Create Rewrite Rules'
				icon: (self iconNamed: #configuration)
				provider: [ RulesBuilderPresenter new ]);
		addPage:
			(SpNotebookPage
				title: 'Match Rewrite Rules'
				icon: (self iconNamed: #smallObjects)
				provider: [ RulesMatcherPresenter new ]);
		addPage:
			(SpNotebookPage
				title: 'Browse and apply saved Rewrite Rules'
				icon: (self iconNamed: #catalog)
				provider: [ RulesBrowserPresenter new ]);
		addPage:
			(SpNotebookPage
				title: 'Rewrite Rules Information'
				icon: (self iconNamed: #smallInfo)
				provider: [ RulesInformationHelperPresenter new ]).
	self focusOrder: tabManager
]

{ #category : #initialization }
RewriteRulesPresenter >> initializeWindow: aWindowPresenter [
	aWindowPresenter
		title: 'Rewrite Rule Builder';
		initialExtent: self class toolWidth @ self class toolHeight;
		windowIcon: self class windowIcon;
		askOkToClose: false;
		aboutText: self class aboutText
]
