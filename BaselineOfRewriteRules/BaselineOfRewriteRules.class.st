"
The baseline of Rewrite Rules tool.
"
Class {
	#name : #BaselineOfRewriteRules,
	#superclass : #BaselineOf,
	#category : #BaselineOfRewriteRules
}

{ #category : #baselines }
BaselineOfRewriteRules >> baseline: spec [
	<baseline>
	spec for: #common do: [ spec package: 'RewriteRules' ]
]
