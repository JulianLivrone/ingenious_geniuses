"
Inverted state of a BoardSlot
"
Class {
	#name : #InvertedState,
	#superclass : #Object,
	#category : #'IngSoft2-Model'
}

{ #category : #playing }
InvertedState >> applyMoonWalkEffectTo: aPlayer from: game withN: n [
	game moveEveryPlayerButThePlayer: aPlayer aNumberOfSlotsEqualTo: n * -1.
]

{ #category : #playing }
InvertedState >> applySpeedUpEffectTo: aPlayer from: game [
	game move: aPlayer ANumberOfSlotsEqualTo: -4
]

{ #category : #playing }
InvertedState >> applyWormHoleEffectTo: aPlayer from: game [
	game move: aPlayer ANumberOfSlotsEqualTo: 4
]
