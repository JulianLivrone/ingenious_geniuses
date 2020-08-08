"
This object has an abstract method so that it´s subclasses have the responsability to override this method according to each subclass funcionality
"
Class {
	#name : #BoardSlot,
	#superclass : #Object,
	#instVars : [
		'state',
		'twoStates'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #'instance creation' }
BoardSlot class >> createSlot [
	^ self new initializeSlot
]

{ #category : #playing }
BoardSlot >> applyEffectTo: aPlayer from: game [
	^ self subclassResponsibility
]

{ #category : #changeState }
BoardSlot >> changeStateToInverted [
	state := InvertedState new.
]

{ #category : #changeState }
BoardSlot >> changeStateToNormal [
	state := NormalState new.
]

{ #category : #initialization }
BoardSlot >> initializeSlot [
	state := NormalState new.
	twoStates := false.
]

{ #category : #testing }
BoardSlot >> isInNormalState [
	^ state isKindOf: NormalState
]

{ #category : #accessing }
BoardSlot >> state [
	^ state
]

{ #category : #accessing }
BoardSlot >> twoStates [
	^ twoStates
]
