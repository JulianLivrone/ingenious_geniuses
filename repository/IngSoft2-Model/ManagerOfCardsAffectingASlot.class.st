"
Manager for the cards affecting a slot
"
Class {
	#name : #ManagerOfCardsAffectingASlot,
	#superclass : #Object,
	#instVars : [
		'slot',
		'cardsAffectingTheSlot'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #'instance creation' }
ManagerOfCardsAffectingASlot class >> forSlot: aSlot [
	^(self new) initializeForSlot: aSlot.
]

{ #category : #adding }
ManagerOfCardsAffectingASlot >> addCardToAffectTheSlot: aCard [
	cardsAffectingTheSlot isEmpty
		ifTrue: [ cardsAffectingTheSlot add: aCard ]
		ifFalse: [ self removeCard: aCard class ].
]

{ #category : #accessing }
ManagerOfCardsAffectingASlot >> cardsAffectingTheSlot [
	^ cardsAffectingTheSlot
]

{ #category : #changeState }
ManagerOfCardsAffectingASlot >> changeStateOfSlot: aSlot [
	slot isInNormalState
		ifTrue: [ slot changeStateToInverted ]
		ifFalse: [ slot changeStateToNormal ]
]

{ #category : #initialization }
ManagerOfCardsAffectingASlot >> initializeForSlot: aSlot [
	cardsAffectingTheSlot := OrderedCollection new.
	slot := aSlot.
]

{ #category : #removing }
ManagerOfCardsAffectingASlot >> removeCard: aCardClass [
	cardsAffectingTheSlot
		detect: [ :card | card isMemberOf: aCardClass ]
		ifFound: [ :card | cardsAffectingTheSlot remove: card ]
		ifNone: [ Error signal: 'There isn`t that card affecting this slot' ]
]

{ #category : #removing }
ManagerOfCardsAffectingASlot >> removeCardAndChangeState: aCardClass [
	cardsAffectingTheSlot
		detect: [ :card | card isMemberOf: aCardClass ]
		ifFound: [ :card | 
			cardsAffectingTheSlot remove: card.
			self changeStateOfSlot: slot ]
		ifNone: [ Error signal: 'There isn`t that card affecting this slot' ]
]

{ #category : #accessing }
ManagerOfCardsAffectingASlot >> slot [
	^ slot
]
