"
Normal state of a BoardSlot
"
Class {
	#name : #NormalState,
	#superclass : #Object,
	#category : #'IngSoft2-Model'
}

{ #category : #playing }
NormalState >> applyAtomicBombEffectTo: aPlayer from: game [
	game moveEveryPlayerToSlotOne.
]

{ #category : #playing }
NormalState >> applyCardGiverEffectTo: aPlayer from: game [
	game giveRandomCardToPlayer: aPlayer.
]

{ #category : #playing }
NormalState >> applyMoonWalkEffectTo: aPlayer from: game withN: n [
	game moveEveryPlayerButThePlayer: aPlayer aNumberOfSlotsEqualTo: n.
]

{ #category : #playing }
NormalState >> applyNoEffectEffectTo: aPlayer from: game [
]

{ #category : #playing }
NormalState >> applySpeedUpEffectTo: aPlayer from: game [
	game move: aPlayer ANumberOfSlotsEqualTo: 4
]

{ #category : #playing }
NormalState >> applyWormHoleEffectTo: aPlayer from: game [
	game move: aPlayer ANumberOfSlotsEqualTo: -4
]
