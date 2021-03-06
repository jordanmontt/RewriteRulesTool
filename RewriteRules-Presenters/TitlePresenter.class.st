"
I am a morph that can be use as a label.
"
Class {
	#name : #TitlePresenter,
	#superclass : #SpPresenter,
	#instVars : [
		'titleMorph',
		'titleName'
	],
	#category : #'RewriteRules-Presenters-Morphs'
}

{ #category : #specs }
TitlePresenter class >> defaultSpec [
	^ SpBoxLayout newVertical
		add: #titleMorph;
		yourself
]

{ #category : #initialization }
TitlePresenter >> initialize [
	super initialize.
	titleName := ''
]

{ #category : #initialization }
TitlePresenter >> initializePresenters [
	| morph |
	morph := StringMorph
		contents: titleName
		font:
			(LogicalFont
				familyName: self obtainFontFamilyName
				pointSize: self obtainFontPointSize).
	titleMorph := self newMorph.
	titleMorph
		morph: (PanelMorph new addMorphFront: morph)
]

{ #category : #api }
TitlePresenter >> name: aName [
	titleName := '    ' , aName.
	(titleMorph morph submorphs at: 1) contents: titleName
]

{ #category : #initialization }
TitlePresenter >> obtainFontFamilyName [
	^ self theme labelFont familyName
]

{ #category : #initialization }
TitlePresenter >> obtainFontPointSize [
	^ self theme labelFont pointSize + 2
]
