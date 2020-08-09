Class {
	#name : #ManagerOfCardActiveInGameTest,
	#superclass : #TestCase,
	#instVars : [
		'juan',
		'pancho',
		'aBoard'
	],
	#category : #'IngSoft2-Tests'
}

{ #category : #asserting }
ManagerOfCardActiveInGameTest >> assertNumberOfCardsAffectingAPlayer: aPlayer inTheManagerOfCardsActiveInGame: aManagerOfCardsActiveInGame equals: aNumber [
	self assert: (aManagerOfCardsActiveInGame numberOfCardsAffectingAPlayer: aPlayer) equals: aNumber.
]

{ #category : #asserting }
ManagerOfCardActiveInGameTest >> assertNumberOfCardsAffectingASlot: aSlot inTheManagerOfCardsActiveInGame: aManagerOfCardsActiveInGame equals: aNumber [
	self assert: (aManagerOfCardsActiveInGame numberOfCardsAffectingASlot: (aBoard slotNumber: 1)) equals: aNumber.
]

{ #category : #asserting }
ManagerOfCardActiveInGameTest >> assertTotalEffectOverAPlayer: aPlayer inTheManagerOfCardsActiveInGame: aManagerOfCardsActiveInGame equals: aNumber [
	self assert: (aManagerOfCardsActiveInGame totalEffectOverAPlayer: aPlayer) equals: aNumber.
]

{ #category : #running }
ManagerOfCardActiveInGameTest >> setUp [
	juan := 'juan'.
	pancho := 'pancho'.
	aBoard := Board ofASlotDistribution: { SpeedUp createSlot . NoEffect createSlot . MoonWalk createSlotWithN: 2 . AtomicBomb createSlot . NoEffect createSlot . NoEffect createSlot . NoEffect createSlot . WormHole createSlot . NoEffect createSlot . SpeedUp createSlot }.
]

{ #category : #tests }
ManagerOfCardActiveInGameTest >> testAllManagersOfCardsOverAPlayerInitializeEmpty [
	| setOfPlayers managerOfCardsActiveInGame |
	setOfPlayers := {juan.
	pancho}.
	managerOfCardsActiveInGame := ManagerOfTheCardsActiveInGame
		createFor: setOfPlayers
		and: (aBoard slotsList).
	self assertNumberOfCardsAffectingAPlayer: juan inTheManagerOfCardsActiveInGame: managerOfCardsActiveInGame equals: 0.
	self assertNumberOfCardsAffectingAPlayer: pancho inTheManagerOfCardsActiveInGame: managerOfCardsActiveInGame equals: 0.
]

{ #category : #tests }
ManagerOfCardActiveInGameTest >> testAllManagersOfCardsOverASlotInitializeEmpty [
	| setOfPlayers managerOfCardsActiveInGame |
	setOfPlayers := {juan.
	pancho}.
	managerOfCardsActiveInGame := ManagerOfTheCardsActiveInGame
		createFor: setOfPlayers
		and: (aBoard slotsList).
	self assertNumberOfCardsAffectingASlot: (aBoard slotNumber: 1) inTheManagerOfCardsActiveInGame: managerOfCardsActiveInGame equals: 0.
	self assertNumberOfCardsAffectingASlot: (aBoard slotNumber: 2) inTheManagerOfCardsActiveInGame: managerOfCardsActiveInGame equals: 0.
	self assertNumberOfCardsAffectingASlot: (aBoard slotNumber: 3) inTheManagerOfCardsActiveInGame: managerOfCardsActiveInGame equals: 0.
	self assertNumberOfCardsAffectingASlot: (aBoard slotNumber: 4) inTheManagerOfCardsActiveInGame: managerOfCardsActiveInGame equals: 0.
	self assertNumberOfCardsAffectingASlot: (aBoard slotNumber: 5) inTheManagerOfCardsActiveInGame: managerOfCardsActiveInGame equals: 0.
	self assertNumberOfCardsAffectingASlot: (aBoard slotNumber: 6) inTheManagerOfCardsActiveInGame: managerOfCardsActiveInGame equals: 0.
	self assertNumberOfCardsAffectingASlot: (aBoard slotNumber: 7) inTheManagerOfCardsActiveInGame: managerOfCardsActiveInGame equals: 0.
	self assertNumberOfCardsAffectingASlot: (aBoard slotNumber: 8) inTheManagerOfCardsActiveInGame: managerOfCardsActiveInGame equals: 0.
	self assertNumberOfCardsAffectingASlot: (aBoard slotNumber: 9) inTheManagerOfCardsActiveInGame: managerOfCardsActiveInGame equals: 0.
	self assertNumberOfCardsAffectingASlot: (aBoard slotNumber: 10) inTheManagerOfCardsActiveInGame: managerOfCardsActiveInGame equals: 0.
]

{ #category : #tests }
ManagerOfCardActiveInGameTest >> testCantRemoveACardThatIsNotActiveOverAPlayer [
	| setOfPlayers managerOfCardsActiveInGame aCard |
	setOfPlayers := {juan.pancho}.
	managerOfCardsActiveInGame := ManagerOfTheCardsActiveInGame createFor: setOfPlayers and: (aBoard slotsList).
	self assertNumberOfCardsAffectingAPlayer: juan inTheManagerOfCardsActiveInGame: managerOfCardsActiveInGame equals: 0.
	aCard := Overload createCard.
	managerOfCardsActiveInGame addCard: aCard toPlayer: juan.
	managerOfCardsActiveInGame addCard: aCard toPlayer: juan.
	self assertNumberOfCardsAffectingAPlayer: juan inTheManagerOfCardsActiveInGame: managerOfCardsActiveInGame equals: 2.
	aCard := Speed createCard.
	self
		should: [ managerOfCardsActiveInGame removeCard: aCard fromPlayer: juan ]
		raise: Error
		withMessageText: 'There isn`t that card affecting this player'
]

{ #category : #tests }
ManagerOfCardActiveInGameTest >> testDifferentCardsAffectAPlayer [
	| setOfPlayers managerOfCardsActiveInGame aCard |
	setOfPlayers := {juan.
	pancho}.
	managerOfCardsActiveInGame := ManagerOfTheCardsActiveInGame
		createFor: setOfPlayers
		and: (aBoard slotsList).
	aCard := Overload createCard.
	managerOfCardsActiveInGame addCard: aCard toPlayer: juan.
	aCard := Speed createCard.
	managerOfCardsActiveInGame addCard: aCard toPlayer: juan.
	aCard := Speed createCard.
	managerOfCardsActiveInGame addCard: aCard toPlayer: juan.
	aCard := Acceleration createCard.
	managerOfCardsActiveInGame addCardToAllPlayers: aCard.
	self assertNumberOfCardsAffectingAPlayer: juan inTheManagerOfCardsActiveInGame: managerOfCardsActiveInGame equals: 4.
	self assertNumberOfCardsAffectingAPlayer: pancho inTheManagerOfCardsActiveInGame: managerOfCardsActiveInGame equals: 1.
]

{ #category : #tests }
ManagerOfCardActiveInGameTest >> testManagerOfEffectsOfTheCardsInGameRemovesAnActiveCardFromAPlayer [
	| setOfPlayers managerOfCardsActiveInGame aCard |
	setOfPlayers := {juan.
	pancho}.
	managerOfCardsActiveInGame := ManagerOfTheCardsActiveInGame
		createFor: setOfPlayers
		and: (aBoard slotsList).
	self assertNumberOfCardsAffectingAPlayer: juan inTheManagerOfCardsActiveInGame: managerOfCardsActiveInGame equals: 0.
	aCard := Overload createCard.
	managerOfCardsActiveInGame addCard: aCard toPlayer: juan.
	managerOfCardsActiveInGame addCard: aCard toPlayer: juan.
	self assertNumberOfCardsAffectingAPlayer: juan inTheManagerOfCardsActiveInGame: managerOfCardsActiveInGame equals: 2.
]

{ #category : #tests }
ManagerOfCardActiveInGameTest >> testReversalCardAffectsASlot [
	| setOfPlayers managerOfCardsActiveInGame aCard |
	setOfPlayers := {juan.pancho}.
	managerOfCardsActiveInGame := ManagerOfTheCardsActiveInGame createFor: setOfPlayers and: (aBoard slotsList).
	aCard := Reversal createCard.
	
	self assertNumberOfCardsAffectingASlot: (aBoard slotNumber: 1) inTheManagerOfCardsActiveInGame: managerOfCardsActiveInGame equals: 0.
	managerOfCardsActiveInGame addCard: aCard toSlot: (aBoard slotNumber: 1).
	self assertNumberOfCardsAffectingASlot: (aBoard slotNumber: 1) inTheManagerOfCardsActiveInGame: managerOfCardsActiveInGame equals: 1.
]

{ #category : #tests }
ManagerOfCardActiveInGameTest >> testSomeCardsAffectEachPlayer [
	| setOfPlayers managerOfCardsActiveInGame aCard |
	setOfPlayers := {juan.
	pancho}.
	managerOfCardsActiveInGame := ManagerOfTheCardsActiveInGame
		createFor: setOfPlayers
		and: (aBoard slotsList).
	aCard := Overload createCard.
	managerOfCardsActiveInGame addCard: aCard toPlayer: juan.
	aCard := Speed createCard.
	managerOfCardsActiveInGame addCard: aCard toPlayer: juan.
	aCard := Speed createCard.
	managerOfCardsActiveInGame addCard: aCard toPlayer: pancho.
	aCard := Acceleration createCard.
	managerOfCardsActiveInGame addCardToAllPlayers: aCard.
	self assertNumberOfCardsAffectingAPlayer: juan inTheManagerOfCardsActiveInGame: managerOfCardsActiveInGame equals: 3.
	self assertNumberOfCardsAffectingAPlayer: pancho inTheManagerOfCardsActiveInGame: managerOfCardsActiveInGame equals: 2.
]

{ #category : #tests }
ManagerOfCardActiveInGameTest >> testThereIsALeastOneCardActiveInGame [
	| setOfPlayers managerOfCardsActiveInGame aCard |
	setOfPlayers := {juan.
	pancho}.
	managerOfCardsActiveInGame := ManagerOfTheCardsActiveInGame
		createFor: setOfPlayers
		and: (aBoard slotsList).
	self
		assert: managerOfCardsActiveInGame thereIsAtLeastOneCardActiveInGame
		equals: false.
	aCard := Overload createCard.
	managerOfCardsActiveInGame addCard: aCard toPlayer: juan.
	self
		assert: managerOfCardsActiveInGame thereIsAtLeastOneCardActiveInGame
		equals: true.
	aCard := Acceleration createCard.
	managerOfCardsActiveInGame addCardToAllPlayers: aCard.
	self
		assert: managerOfCardsActiveInGame thereIsAtLeastOneCardActiveInGame
		equals: true
]

{ #category : #tests }
ManagerOfCardActiveInGameTest >> testTotalEffectOverAPlayerCanBeNegativePositivoOrCero [
	| setOfPlayers managerOfCardsActiveInGame aCard |
	setOfPlayers := {juan.
	pancho}.
	managerOfCardsActiveInGame := ManagerOfTheCardsActiveInGame
		createFor: setOfPlayers
		and: (aBoard slotsList).
	self assertTotalEffectOverAPlayer: juan inTheManagerOfCardsActiveInGame: managerOfCardsActiveInGame equals: 0.
	self assertTotalEffectOverAPlayer: pancho inTheManagerOfCardsActiveInGame: managerOfCardsActiveInGame equals: 0.
	aCard := Speed createCard.
	managerOfCardsActiveInGame addCard: aCard toPlayer: juan.
	self assertTotalEffectOverAPlayer: juan inTheManagerOfCardsActiveInGame: managerOfCardsActiveInGame equals: 1.
	self assertTotalEffectOverAPlayer: pancho inTheManagerOfCardsActiveInGame: managerOfCardsActiveInGame equals: 0.
	managerOfCardsActiveInGame addCard: aCard toPlayer: juan.
	aCard := Acceleration createCard.
	managerOfCardsActiveInGame addCardToAllPlayers: aCard.
	aCard := Overload createCard.
	managerOfCardsActiveInGame addCard: aCard toPlayer: pancho.
	managerOfCardsActiveInGame addCard: aCard toPlayer: pancho.
	self assertTotalEffectOverAPlayer: juan inTheManagerOfCardsActiveInGame: managerOfCardsActiveInGame equals: 3.
	self assertTotalEffectOverAPlayer: pancho inTheManagerOfCardsActiveInGame: managerOfCardsActiveInGame equals: -3.
	managerOfCardsActiveInGame addCard: aCard toPlayer: juan.
	self assertTotalEffectOverAPlayer: juan inTheManagerOfCardsActiveInGame: managerOfCardsActiveInGame equals: 1.
	self assertTotalEffectOverAPlayer: pancho inTheManagerOfCardsActiveInGame: managerOfCardsActiveInGame equals: -3.
]

{ #category : #tests }
ManagerOfCardActiveInGameTest >> testTotalEffectOverAPlayerIsTheSumOfEveryEffect [
	| setOfPlayers managerOfCardsActiveInGame aCard |
	setOfPlayers := {juan.
	pancho}.
	managerOfCardsActiveInGame := ManagerOfTheCardsActiveInGame
		createFor: setOfPlayers
		and: (aBoard slotsList).
	self assertTotalEffectOverAPlayer: juan inTheManagerOfCardsActiveInGame: managerOfCardsActiveInGame equals: 0.
	aCard := Speed createCard.
	managerOfCardsActiveInGame addCard: aCard toPlayer: juan.
	self assertTotalEffectOverAPlayer: juan inTheManagerOfCardsActiveInGame: managerOfCardsActiveInGame equals: 1.
	aCard := Speed createCard.
	managerOfCardsActiveInGame addCard: aCard toPlayer: juan.
	aCard := Acceleration createCard.
	managerOfCardsActiveInGame addCardToAllPlayers: aCard.
	self assertTotalEffectOverAPlayer: juan inTheManagerOfCardsActiveInGame: managerOfCardsActiveInGame equals: 3.
	aCard := Overload createCard.
	managerOfCardsActiveInGame addCard: aCard toPlayer: juan.
	self assertTotalEffectOverAPlayer: juan inTheManagerOfCardsActiveInGame: managerOfCardsActiveInGame equals: 1.
]

{ #category : #tests }
ManagerOfCardActiveInGameTest >> testTotalEffectOverDifferentPlayers [
	| setOfPlayers managerOfCardsActiveInGame aCard |
	setOfPlayers := {juan.
	pancho}.
	managerOfCardsActiveInGame := ManagerOfTheCardsActiveInGame
		createFor: setOfPlayers
		and: (aBoard slotsList).
	self assertTotalEffectOverAPlayer: juan inTheManagerOfCardsActiveInGame: managerOfCardsActiveInGame equals: 0.
	self assertTotalEffectOverAPlayer: pancho inTheManagerOfCardsActiveInGame: managerOfCardsActiveInGame equals: 0.
	aCard := Speed createCard.
	managerOfCardsActiveInGame addCard: aCard toPlayer: juan.
	self assertTotalEffectOverAPlayer: juan inTheManagerOfCardsActiveInGame: managerOfCardsActiveInGame equals: 1.
	self assertTotalEffectOverAPlayer: pancho inTheManagerOfCardsActiveInGame: managerOfCardsActiveInGame equals: 0.
	aCard := Overload createCard.
	managerOfCardsActiveInGame addCard: aCard toPlayer: juan.
	aCard := Acceleration createCard.
	managerOfCardsActiveInGame addCardToAllPlayers: aCard.
	self assertTotalEffectOverAPlayer: juan inTheManagerOfCardsActiveInGame: managerOfCardsActiveInGame equals: 0.
	self assertTotalEffectOverAPlayer: pancho inTheManagerOfCardsActiveInGame: managerOfCardsActiveInGame equals: 1.
]

{ #category : #tests }
ManagerOfCardActiveInGameTest >> testTwoReversalCardsDenyEachOther [
	| setOfPlayers managerOfCardsActiveInGame aCard |
	setOfPlayers := {juan.pancho}.
	managerOfCardsActiveInGame := ManagerOfTheCardsActiveInGame createFor: setOfPlayers and: (aBoard slotsList).
	aCard := Reversal createCard.
	
	self assertNumberOfCardsAffectingASlot: (aBoard slotNumber: 1) inTheManagerOfCardsActiveInGame: managerOfCardsActiveInGame equals: 0.
	managerOfCardsActiveInGame addCard: aCard toSlot: (aBoard slotNumber: 1).
	self assertNumberOfCardsAffectingASlot: (aBoard slotNumber: 1) inTheManagerOfCardsActiveInGame: managerOfCardsActiveInGame equals: 1.
	managerOfCardsActiveInGame addCard: aCard toSlot: (aBoard slotNumber: 1).
	self assertNumberOfCardsAffectingASlot: (aBoard slotNumber: 1) inTheManagerOfCardsActiveInGame: managerOfCardsActiveInGame equals: 0.
]

{ #category : #tests }
ManagerOfCardActiveInGameTest >> testTwoSameCardsAffectAPlayer [
	| setOfPlayers managerOfCardsActiveInGame aCard |
	setOfPlayers := {juan.
	pancho}.
	managerOfCardsActiveInGame := ManagerOfTheCardsActiveInGame
		createFor: setOfPlayers
		and: (aBoard slotsList).
	aCard := Overload createCard.
	managerOfCardsActiveInGame addCard: aCard toPlayer: juan.
	managerOfCardsActiveInGame addCard: aCard toPlayer: juan.
	self assertNumberOfCardsAffectingAPlayer: juan inTheManagerOfCardsActiveInGame: managerOfCardsActiveInGame equals: 2.
	self assertNumberOfCardsAffectingAPlayer: pancho inTheManagerOfCardsActiveInGame: managerOfCardsActiveInGame equals: 0.
]
