"
I am an DTO that stores the information of a single topic.
"
Class {
	#name : #InformationContent,
	#superclass : #Object,
	#instVars : [
		'title',
		'content',
		'index'
	],
	#category : #'RewriteRules-Core-InformationHelper'
}

{ #category : #accessing }
InformationContent >> content [
	^ content
]

{ #category : #accessing }
InformationContent >> content: anObject [
	content := anObject
]

{ #category : #accessing }
InformationContent >> index [
	^ index
]

{ #category : #accessing }
InformationContent >> index: anObject [
	index := anObject
]

{ #category : #accessing }
InformationContent >> title [
	^ title
]

{ #category : #accessing }
InformationContent >> title: anObject [
	title := anObject
]
