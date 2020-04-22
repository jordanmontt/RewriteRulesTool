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
		help: 'Build, match and browse customized Rewrite Rules.';
		icon: ((self iconNamed: #book) scaledToSize: 16 @ 16);
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

{ #category : #initialization }
RewriteRulesPresenter >> connectPresenters [
	super connectPresenters.
]

{ #category : #initialization }
RewriteRulesPresenter >> initialExtent [
	^ self class toolWidth @ self class toolHeight
]

{ #category : #initialization }
RewriteRulesPresenter >> initializePresenters [
	tabManager := self instantiate: RewriteTabManagerPresenter
]

{ #category : #initialization }
RewriteRulesPresenter >> title [ 
	^ 'Rewrite Rule Builder'
]
