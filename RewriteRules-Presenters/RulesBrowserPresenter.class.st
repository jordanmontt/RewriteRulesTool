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
						add: #searchBar
							withConstraints: [ :constraints | 
							constraints
								padding: RewriteRulesPresenter toolPadding;
								height: self height ];
						add: #packages withConstraints: paddingConstraints;
						yourself);
				add: #classes withConstraints: paddingConstraints;
				add: #methods withConstraints: paddingConstraints);
		add: #actionBar withConstraints: [ :constraints | 
							constraints
								padding: RewriteRulesPresenter toolPadding;
								height: self height ];
		yourself
]

{ #category : #specs }
RulesBrowserPresenter class >> height [
	^ 40
]

{ #category : #initialization }
RulesBrowserPresenter >> initializePresenters [
	searchBar := self instantiate: SearchBarPresenter.
	packages := self instantiate: PackagesBrowserPresenter.
	classes := self instantiate: ClassesBrowserPresenter.
	methods := self instantiate: MethodsBrowserPresenter.
	actionBar := self instantiate: BrowserActionBar.
	self focusOrder
		add: searchBar;
		add: packages;
		add: classes;
		add: methods;
		add: actionBar
]
