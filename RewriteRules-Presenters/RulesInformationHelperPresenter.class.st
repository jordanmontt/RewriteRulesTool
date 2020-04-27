"
I have the basic information of how the rewrite rules work and how their syntax is written.
"
Class {
	#name : #RulesInformationHelperPresenter,
	#superclass : #SpPresenter,
	#instVars : [
		'topics',
		'content'
	],
	#category : #'RewriteRules-Presenters-InformationHelper'
}

{ #category : #specs }
RulesInformationHelperPresenter class >> defaultSpec [
	^ SpPanedLayout newHorizontal
		position: 200;
		add: #topics;
		add: #content; 
		yourself
]

{ #category : #initialization }
RulesInformationHelperPresenter >> connectPresenters [
	topics
		whenSelectionChangedDo: [ :selection | 
			selection selectedItem
				ifNil: 
					[ self updateContentText: '' ]
				ifNotNil:
					[ :newSelectedTopic | self updateContentText: newSelectedTopic content ] ].
	self selectFirstTopic
]

{ #category : #initialization }
RulesInformationHelperPresenter >> initializePresenters [
	self initializeTopics.
	content := self newText.
	self focusOrder add: #topics;add: #content.
]

{ #category : #initialization }
RulesInformationHelperPresenter >> initializeTopics [
	topics := self newList.
	topics
		items: self obtainTopics;
		display: [ :e | e title ]
]

{ #category : #actions }
RulesInformationHelperPresenter >> obtainTopics [
	^ RulesInformationContent topics
]

{ #category : #actions }
RulesInformationHelperPresenter >> selectFirstTopic [
	topics selectItem: (topics items at: 1).
]

{ #category : #actions }
RulesInformationHelperPresenter >> updateContentText: aText [
	content text: aText
]
