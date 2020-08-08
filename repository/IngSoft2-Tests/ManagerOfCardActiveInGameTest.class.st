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
	self
		assert: (managerOfCardsActiveInGame numberOfCardsAffectingAPlayer: juan)
		equals: 0.
	self
		assert: (managerOfCardsActiveInGame numberOfCardsAffectingAPlayer: pancho)
		equals: 0
]

{ #category : #tests }
ManagerOfCardActiveInGameTest >> testAllManagersOfCardsOverASlotInitializeEmpty [
	| setOfPlayers managerOfCardsActiveInGame |
	setOfPlayers := {juan.
	pancho}.
	managerOfCardsActiveInGame := ManagerOfTheCardsActiveInGame
		createFor: setOfPlayers
		and: (aBoard slotsList).
	self
		assert: (managerOfCardsActiveInGame numberOfCardsAffectingASlot: (aBoard slotNumber: 1))
		equals: 0.
			self
		assert: (managerOfCardsActiveInGame numberOfCardsAffectingASlot: (aBoard slotNumber: 2))
		equals: 0.
			self
		assert: (managerOfCardsActiveInGame numberOfCardsAffectingASlot: (aBoard slotNumber: 3))
		equals: 0.
			self
		assert: (managerOfCardsActiveInGame numberOfCardsAffectingASlot: (aBoard slotNumber: 4))
		equals: 0.
			self
		assert: (managerOfCardsActiveInGame numberOfCardsAffectingASlot: (aBoard slotNumber: 5))
		equals: 0.
			self
		assert: (managerOfCardsActiveInGame numberOfCardsAffectingASlot: (aBoard slotNumber: 6))
		equals: 0.
			self
		assert: (managerOfCardsActiveInGame numberOfCardsAffectingASlot: (aBoard slotNumber: 7))
		equals: 0.
			self
		assert: (managerOfCardsActiveInGame numberOfCardsAffectingASlot: (aBoard slotNumber: 8))
		equals: 0.
			self
		assert: (managerOfCardsActiveInGame numberOfCardsAffectingASlot: (aBoard slotNumber: 9))
		equals: 0.
			self
		assert: (managerOfCardsActiveInGame numberOfCardsAffectingASlot: (aBoard slotNumber: 10))
		equals: 0.
		
]

{ #category : #tests }
ManagerOfCardActiveInGameTest >> testCantRemoveACardThatIsNotActiveOverAPlayer [
	| setOfPlayers managerOfCardsActiveInGame aCard |
	setOfPlayers := {juan.
	pancho}.
	managerOfCardsActiveInGame := ManagerOfTheCardsActiveInGame
		createFor: setOfPlayers
		and: (aBoard slotsList).
	self
		assert: (managerOfCardsActiveInGame numberOfCardsAffectingAPlayer: juan)
		equals: 0.
	aCard := Overload createCard.
	managerOfCardsActiveInGame addCard: aCard toPlayer: juan.
	managerOfCardsActiveInGame addCard: aCard toPlayer: juan.
	self
		assert: (managerOfCardsActiveInGame numberOfCardsAffectingAPlayer: juan)
		equals: 2.
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
	self
		assert: (managerOfCardsActiveInGame numberOfCardsAffectingAPlayer: juan)
		equals: 4.
	self
		assert: (managerOfCardsActiveInGame numberOfCardsAffectingAPlayer: pancho)
		equals: 1
]

{ #category : #tests }
ManagerOfCardActiveInGameTest >> testManagerOfEffectsOfTheCardsInGameRemovesAnActiveCardFromAPlayer [
	| setOfPlayers managerOfCardsActiveInGame aCard |
	setOfPlayers := {juan.
	pancho}.
	managerOfCardsActiveInGame := ManagerOfTheCardsActiveInGame
		createFor: setOfPlayers
		and: (aBoard slotsList).
	self
		assert: (managerOfCardsActiveInGame numberOfCardsAffectingAPlayer: juan)
		equals: 0.
	aCard := Overload createCard.
	managerOfCardsActiveInGame addCard: aCard toPlayer: juan.
	managerOfCardsActiveInGame addCard: aCard toPlayer: juan.
	self
		assert: (managerOfCardsActiveInGame numberOfCardsAffectingAPlayer: juan)
		equals: 2.
	managerOfCardsActiveInGame removeCard: Overload fromPlayer: juan.
	self
		assert: (managerOfCardsActiveInGame numberOfCardsAffectingAPlayer: juan)
		equals: 1
]

{ #category : #tests }
ManagerOfCardActiveInGameTest >> testReversalCardAffectsASlot [
	| setOfPlayers managerOfCardsActiveInGame aCard |
	setOfPlayers := {juan.pancho}.
	managerOfCardsActiveInGame := ManagerOfTheCardsActiveInGame createFor: setOfPlayers and: (aBoard slotsList).
	aCard := Reversal createCard.
	
	self assert: (managerOfCardsActiveInGame numberOfCardsAffectingASlot: (aBoard slotNumber: 1)) equals: 0.
	managerOfCardsActiveInGame addCard: aCard toSlot: (aBoard slotNumber: 1).
	self assert: (managerOfCardsActiveInGame numberOfCardsAffectingASlot: (aBoard slotNumber: 1)) equals: 1.
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
	self
		assert: (managerOfCardsActiveInGame numberOfCardsAffectingAPlayer: juan)
		equals: 3.
	self
		assert: (managerOfCardsActiveInGame numberOfCardsAffectingAPlayer: pancho)
		equals: 2
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
	self
		assert: (managerOfCardsActiveInGame totalEffectOverAPlayer: juan)
		equals: 0.
	self
		assert: (managerOfCardsActiveInGame totalEffectOverAPlayer: pancho)
		equals: 0.
	aCard := Speed createCard.
	managerOfCardsActiveInGame addCard: aCard toPlayer: juan.
	self
		assert: (managerOfCardsActiveInGame totalEffectOverAPlayer: juan)
		equals: 1.
	self
		assert: (managerOfCardsActiveInGame totalEffectOverAPlayer: pancho)
		equals: 0.
	managerOfCardsActiveInGame addCard: aCard toPlayer: juan.
	aCard := Acceleration createCard.
	managerOfCardsActiveInGame addCardToAllPlayers: aCard.
	aCard := Overload createCard.
	managerOfCardsActiveInGame addCard: aCard toPlayer: pancho.
	managerOfCardsActiveInGame addCard: aCard toPlayer: pancho.
	self
		assert: (managerOfCardsActiveInGame totalEffectOverAPlayer: juan)
		equals: 3.
	self
		assert: (managerOfCardsActiveInGame totalEffectOverAPlayer: pancho)
		equals: -3.
	managerOfCardsActiveInGame addCard: aCard toPlayer: juan.
	self
		assert: (managerOfCardsActiveInGame totalEffectOverAPlayer: juan)
		equals: 1.
	self
		assert: (managerOfCardsActiveInGame totalEffectOverAPlayer: pancho)
		equals: -3
]

{ #category : #tests }
ManagerOfCardActiveInGameTest >> testTotalEffectOverAPlayerIsTheSumOfEveryEffect [
	| setOfPlayers managerOfCardsActiveInGame aCard |
	setOfPlayers := {juan.
	pancho}.
	managerOfCardsActiveInGame := ManagerOfTheCardsActiveInGame
		createFor: setOfPlayers
		and: (aBoard slotsList).
	self
		assert: (managerOfCardsActiveInGame totalEffectOverAPlayer: juan)
		equals: 0.
	aCard := Speed createCard.
	managerOfCardsActiveInGame addCard: aCard toPlayer: juan.
	self
		assert: (managerOfCardsActiveInGame totalEffectOverAPlayer: juan)
		equals: 1.
	aCard := Speed createCard.
	managerOfCardsActiveInGame addCard: aCard toPlayer: juan.
	aCard := Acceleration createCard.
	managerOfCardsActiveInGame addCardToAllPlayers: aCard.
	self
		assert: (managerOfCardsActiveInGame totalEffectOverAPlayer: juan)
		equals: 3.
	aCard := Overload createCard.
	managerOfCardsActiveInGame addCard: aCard toPlayer: juan.
	self
		assert: (managerOfCardsActiveInGame totalEffectOverAPlayer: juan)
		equals: 1
]

{ #category : #tests }
ManagerOfCardActiveInGameTest >> testTotalEffectOverDifferentPlayers [
	| setOfPlayers managerOfCardsActiveInGame aCard |
	setOfPlayers := {juan.
	pancho}.
	managerOfCardsActiveInGame := ManagerOfTheCardsActiveInGame
		createFor: setOfPlayers
		and: (aBoard slotsList).
	self
		assert: (managerOfCardsActiveInGame totalEffectOverAPlayer: juan)
		equals: 0.
	self
		assert: (managerOfCardsActiveInGame totalEffectOverAPlayer: pancho)
		equals: 0.
	aCard := Speed createCard.
	managerOfCardsActiveInGame addCard: aCard toPlayer: juan.
	self
		assert: (managerOfCardsActiveInGame totalEffectOverAPlayer: juan)
		equals: 1.
	self
		assert: (managerOfCardsActiveInGame totalEffectOverAPlayer: pancho)
		equals: 0.
	aCard := Overload createCard.
	managerOfCardsActiveInGame addCard: aCard toPlayer: juan.
	aCard := Acceleration createCard.
	managerOfCardsActiveInGame addCardToAllPlayers: aCard.
	self
		assert: (managerOfCardsActiveInGame totalEffectOverAPlayer: juan)
		equals: 0.
	self
		assert: (managerOfCardsActiveInGame totalEffectOverAPlayer: pancho)
		equals: 1
]

{ #category : #tests }
ManagerOfCardActiveInGameTest >> testTwoReversalCardsDenyEachOther [
	| setOfPlayers managerOfCardsActiveInGame aCard |
	setOfPlayers := {juan.pancho}.
	managerOfCardsActiveInGame := ManagerOfTheCardsActiveInGame createFor: setOfPlayers and: (aBoard slotsList).
	aCard := Reversal createCard.
	
	self assert: (managerOfCardsActiveInGame numberOfCardsAffectingASlot: (aBoard slotNumber: 1)) equals: 0.
	managerOfCardsActiveInGame addCard: aCard toSlot: (aBoard slotNumber: 1).
	self assert: (managerOfCardsActiveInGame numberOfCardsAffectingASlot: (aBoard slotNumber: 1)) equals: 1.
	managerOfCardsActiveInGame addCard: aCard toSlot: (aBoard slotNumber: 1).
	self assert: (managerOfCardsActiveInGame numberOfCardsAffectingASlot: (aBoard slotNumber: 1)) equals: 0.
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
	self
		assert: (managerOfCardsActiveInGame numberOfCardsAffectingAPlayer: juan)
		equals: 2.
	self
		assert: (managerOfCardsActiveInGame numberOfCardsAffectingAPlayer: pancho)
		equals: 0
]
