"
A Reversal Card
"
Class {
	#name : #Reversal,
	#superclass : #Permanent,
	#category : #'IngSoft2-Model'
}

{ #category : #playing }
Reversal >> applyEffectOverATarget: aTarget on: theGame [
	| theManagerOfCards |
	self validationOfTarget: aTarget.
	theManagerOfCards := theGame managerOfCardsActive.
	theManagerOfCards addCard: self toSlot: aTarget
]

{ #category : #initialization }
Reversal >> initializeCard [
	effect := 0.
]

{ #category : #playing }
Reversal >> validationOfTarget: aTarget [
	(aTarget isKindOf: BoardSlot)
		ifTrue: [ aTarget twoStates
				ifTrue: [ aTarget isInNormalState
						ifTrue: [ aTarget changeStateToInverted ]
						ifFalse: [ aTarget changeStateToNormal ] ]
				ifFalse:
					[ Error signal: 'That slot doesn`t have two states, only NormalState' ] ]
		ifFalse: [ Error signal: 'The card Reversal must receive a slot as a target' ]
]
