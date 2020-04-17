"
I am the presenter and I show the matches of a rewrite rule.
"
Class {
	#name : #MatchMapPresenter,
	#superclass : #SpTablePresenter,
	#category : #'RewriteRules-RulesMatcher'
}

{ #category : #initialization }
MatchMapPresenter >> initialize [
	super initialize.
	self
		addColumn:
			(SpStringTableColumn
				title: 'Pattern'
				evaluated: [ :assoc | assoc key formattedCode ]);
		addColumn:
			(SpStringTableColumn
				title: 'Match'
				evaluated: [ :assoc | assoc value formattedCode ]);
		beResizable
]
