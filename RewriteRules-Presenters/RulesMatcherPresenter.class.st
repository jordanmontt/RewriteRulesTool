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
	| expressionsColumn listResultColumn paddingConstraints |
	paddingConstraints := [ :constraints | constraints padding: RewriteRulesPresenter toolPadding ].
	expressionsColumn := SpBoxLayout newVertical
		add: #patternExpression withConstraints: paddingConstraints;
		add: #codeExpression;
		yourself.
	listResultColumn := SpBoxLayout newVertical
		add: #executeButton  height: RewriteRulesPresenter titleHeight;
		add: #resultList withConstraints: paddingConstraints;
		yourself.
	^ SpBoxLayout newHorizontal
		add: expressionsColumn
			withConstraints: [ :constraints | 
			constraints
				padding: RewriteRulesPresenter toolPadding;
				width: self width ];
		add: listResultColumn withConstraints: paddingConstraints;
		add: #matchMap withConstraints: paddingConstraints;
		yourself
]

{ #category : #specs }
RulesMatcherPresenter class >> width [
	^ RewriteRulesPresenter toolWidth / 2.5
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
		add: patternExpression;
		add: codeExpression;
		add: executeButton;
		add: resultList;
		add: matchMap
]
