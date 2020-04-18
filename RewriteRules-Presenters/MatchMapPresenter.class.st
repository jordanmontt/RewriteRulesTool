"
I am the presenter and I show the matches of a rewrite rule.
"
Class {
	#name : #MatchMapPresenter,
	#superclass : #SpTablePresenter,
	#category : #'RewriteRules-Presenters-Matcher'
}

{ #category : #initialization }
MatchMapPresenter >> addMatchColumn [
	self
		addColumn:
			(SpStringTableColumn
				title: 'Match'
				evaluated: [ :assoc | assoc value formattedCode ])
]

{ #category : #initialization }
MatchMapPresenter >> addPatternColumn [
	self
		addColumn:
			(SpStringTableColumn
				title: 'Pattern'
				evaluated: [ :assoc | assoc key formattedCode ])
]

{ #category : #initialization }
MatchMapPresenter >> initialize [
	super initialize.
	self addPatternColumn.
	self addMatchColumn.
	self beResizable
]
