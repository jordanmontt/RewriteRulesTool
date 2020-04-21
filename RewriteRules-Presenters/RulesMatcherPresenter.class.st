"
I match any rewrite rule with a block of Pharo code and I show all the matches.
"
Class {
	#name : #RulesMatcherPresenter,
	#superclass : #SpPresenter,
	#instVars : [
		'patternExpression',
		'codeExpression',
		'executeButton',
		'resultList',
		'matchMap'
	],
	#category : #'RewriteRules-Presenters-Matcher'
}

{ #category : #specs }
RulesMatcherPresenter class >> defaultSpec [
	| expressionsColumn listResultColumn |
	expressionsColumn := SpBoxLayout newVertical
		add: #patternExpression;
		add: #codeExpression;
		yourself.
	listResultColumn := SpBoxLayout newVertical
		add: #executeButton
			withConstraints: [ :constraints | 
			constraints
				padding: self padding;
				height: self height ];
		add: #resultList;
		yourself.
	^ SpBoxLayout newHorizontal
		add: expressionsColumn
			withConstraints: [ :constraints | 
			constraints
				padding: self padding;
				width: self width ];
		add: listResultColumn
			withConstraints: [ :constraints | constraints padding: self padding ];
		add: #matchMap
			withConstraints: [ :constraints | constraints padding: self padding ];
		yourself
]

{ #category : #specs }
RulesMatcherPresenter class >> height [
	^ 35
]

{ #category : #specs }
RulesMatcherPresenter class >> padding [
	^ 5
]

{ #category : #specs }
RulesMatcherPresenter class >> width [
	^ 450
]

{ #category : #initialization }
RulesMatcherPresenter >> initializeCodeExpressionPresenter [
	codeExpression := self instantiate: MatcherCodePresenter.
	codeExpression label: 'Pharo code'
]

{ #category : #initialization }
RulesMatcherPresenter >> initializeExecuteButton [
	executeButton := self newButton.
	executeButton
		icon: (self iconNamed: #smallDoIt);
		label: 'Match Rule';
		shortcut: Character cr meta
]

{ #category : #initialization }
RulesMatcherPresenter >> initializeMatchMap [
	matchMap := self instantiate: MatchMapPresenter.
]

{ #category : #initialization }
RulesMatcherPresenter >> initializePatternExpressionPresenter [
	patternExpression := self instantiate: MatcherCodePresenter.
	patternExpression label: 'Pattern code'
]

{ #category : #initialization }
RulesMatcherPresenter >> initializePresenters [
	self initializePatternExpressionPresenter.
	self initializeCodeExpressionPresenter.
	self initializeExecuteButton.
	self initializeResultList.
	self initializeMatchMap.
	self initializefocusOrder
]

{ #category : #initialization }
RulesMatcherPresenter >> initializeResultList [
	resultList := self instantiate: MatcherResultListPresenter.
]

{ #category : #initialization }
RulesMatcherPresenter >> initializefocusOrder [
	self focusOrder
		add: #patternExpression;
		add: #codeExpression;
		add: #executeButton;
		add: #resultList;
		add: #matchMap
]
