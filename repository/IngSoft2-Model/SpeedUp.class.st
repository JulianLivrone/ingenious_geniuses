"
This object is a subclass of BoardSlot and has the responsability to apply it´s effect to the player or players of the Game.
"
Class {
	#name : #SpeedUp,
	#superclass : #BoardSlot,
	#category : #'IngSoft2-Model'
}

{ #category : #playing }
SpeedUp >> applyEffectTo: aPlayer from: game [
	state applySpeedUpEffectTo: aPlayer from: game
]

{ #category : #initialization }
SpeedUp >> initializeSlot [
	state := NormalState new.
	twoStates := true.
]
