"
Equivale a Deck.
"
Class {
	#name : #ManagerOfTheCardsActiveInGame,
	#superclass : #Object,
	#instVars : [
		'lastCardPlayed',
		'managersOfCardsAffectingAPlayer',
		'managersOfCardsAffectingASlot'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #'instance creation' }
ManagerOfTheCardsActiveInGame class >> createFor: aSetOfPlayers and: aSlotList [
	^ self new initializeForPlayers: aSetOfPlayers andSlots: aSlotList
]

{ #category : #'card handling' }
ManagerOfTheCardsActiveInGame >> addCard: aCard toPlayer: aPlayer [
	managersOfCardsAffectingAPlayer
		detect:
			[ :aManagerOfCardsAffectingAPlayer | aManagerOfCardsAffectingAPlayer player == aPlayer ]
		ifFound:
			[ :aManagerOfCardsAffectingAPlayer | aManagerOfCardsAffectingAPlayer addCardToAffectThePlayer: aCard ].
	self updateLastCardPlayed: aCard
]

{ #category : #'card handling' }
ManagerOfTheCardsActiveInGame >> addCard: aCard toSlot: aSlot [
	managersOfCardsAffectingASlot
		detect:
			[ :aManagerOfCardsAffectingASlot | aManagerOfCardsAffectingASlot slot == aSlot ]
		ifFound:
			[ :aManagerOfCardsAffectingASlot | aManagerOfCardsAffectingASlot addCardToAffectTheSlot: aCard ].
	self updateLastCardPlayed: aCard
]

{ #category : #'card handling' }
ManagerOfTheCardsActiveInGame >> addCardToAllPlayers: aCard [
	managersOfCardsAffectingAPlayer
		do:
			[ :aManagerOfCardsAffectingAPlayer | aManagerOfCardsAffectingAPlayer addCardToAffectThePlayer: aCard ].
	self updateLastCardPlayed: aCard
]

{ #category : #'card handling' }
ManagerOfTheCardsActiveInGame >> cancelCardOnTargetWithCardAndPlayer: aTarget [
	| theCardClass targetPlayer |
	theCardClass := aTarget at: 1.
	targetPlayer := aTarget at: 2.
	self thereIsAtLeastOneCardActiveInGame
		ifTrue: [ self removeCard: theCardClass fromPlayer: targetPlayer ]
		ifFalse: [ Error signal: 'There aren`t permanent cards in game' ]
]

{ #category : #'card handling' }
ManagerOfTheCardsActiveInGame >> cancelCardOnTargetWithCardAndSlot: aTarget [
	| theCardClass targetSlot |
	theCardClass := aTarget at: 1.
	targetSlot := aTarget at: 2.
	self thereIsAtLeastOneCardActiveInGame
		ifTrue: [ self removeCardAndChangeState: theCardClass fromSlot: targetSlot ]
		ifFalse: [ Error signal: 'There aren`t permanent cards in game' ]
]

{ #category : #initialization }
ManagerOfTheCardsActiveInGame >> initializeForPlayers: aSetOfPlayers andSlots: aSlotList [
	| aux |
	lastCardPlayed := Card new.
	managersOfCardsAffectingAPlayer := OrderedCollection new.
	managersOfCardsAffectingASlot := OrderedCollection new.
	aSetOfPlayers
		do: [ :aPlayer | 
			aux := ManagerOfCardsAffectingAPlayer forPlayer: aPlayer.
			managersOfCardsAffectingAPlayer add: aux ].
	aSlotList
		do: [ :aSlot | 
			aux := ManagerOfCardsAffectingASlot forSlot: aSlot.
			managersOfCardsAffectingASlot add: aux ]
]

{ #category : #query }
ManagerOfTheCardsActiveInGame >> lastCardPlayed [
	^ lastCardPlayed
]

{ #category : #utilities }
ManagerOfTheCardsActiveInGame >> numberOfCardsAffectingAPlayer: aPlayer [
	managersOfCardsAffectingAPlayer
		detect: [ :aManagerOfCardsAffectingAPlayer | aManagerOfCardsAffectingAPlayer player == aPlayer ]
		ifFound: [ :aManagerOfCardsAffectingAPlayer | ^ aManagerOfCardsAffectingAPlayer cardsAffectingThePlayer size ]
]

{ #category : #utilities }
ManagerOfTheCardsActiveInGame >> numberOfCardsAffectingASlot: aSlot [
	managersOfCardsAffectingASlot
		detect: [ :aManagerOfCardsAffectingASlot | aManagerOfCardsAffectingASlot slot == aSlot ]
		ifFound: [ :aManagerOfCardsAffectingASlot | ^ aManagerOfCardsAffectingASlot cardsAffectingTheSlot size ]
]

{ #category : #'card handling' }
ManagerOfTheCardsActiveInGame >> removeCard: aCardClass fromPlayer: aPlayer [
	managersOfCardsAffectingAPlayer
		detect:
			[ :aManagerOfCardsAffectingAPlayer | aManagerOfCardsAffectingAPlayer player == aPlayer ]
		ifFound:
			[ :aManagerOfCardsAffectingAPlayer | aManagerOfCardsAffectingAPlayer removeCard: aCardClass ].
	self updateLastCardPlayed: Cancellation createCard
]

{ #category : #'card handling' }
ManagerOfTheCardsActiveInGame >> removeCardAndChangeState: aCardClass fromSlot: aSlot [
	managersOfCardsAffectingASlot
		detect:
			[ :aManagerOfCardsAffectingASlot | aManagerOfCardsAffectingASlot slot == aSlot ]
		ifFound:
			[ :aManagerOfCardsAffectingASlot | aManagerOfCardsAffectingASlot removeCardAndChangeState: aCardClass ].
	self updateLastCardPlayed: Cancellation createCard
]

{ #category : #utilities }
ManagerOfTheCardsActiveInGame >> thereIsAtLeastOneCardActiveInGame [
	managersOfCardsAffectingAPlayer
		detect:
			[ :cardsOfAPlayer | cardsOfAPlayer cardsAffectingThePlayer isNotEmpty ]
		ifFound: [ ^ true ].
	managersOfCardsAffectingASlot
		detect:
			[ :cardsOfASlot | cardsOfASlot cardsAffectingTheSlot isNotEmpty ]
		ifFound: [ ^ true ].
	^ false
]

{ #category : #calculations }
ManagerOfTheCardsActiveInGame >> totalEffectOverAPlayer: aPlayer [
	managersOfCardsAffectingAPlayer
		detect:
			[ :aManagersOfCardsAffectingAPlayer | aManagersOfCardsAffectingAPlayer player == aPlayer ]
		ifFound:
			[ :aManagersOfCardsAffectingAPlayer | ^ aManagersOfCardsAffectingAPlayer calculateTotalEffectOverThePlayer ]
]

{ #category : #'card handling' }
ManagerOfTheCardsActiveInGame >> updateLastCardPlayed: aCard [
	lastCardPlayed := aCard.
]
