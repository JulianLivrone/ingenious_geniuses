"
A Cancellation Card.
"
Class {
	#name : #Cancellation,
	#superclass : #Instant,
	#category : #'IngSoft2-Model'
}

{ #category : #playing }
Cancellation >> applyEffectOverATarget: aTarget on: theGame [
	| theManagerOfCards |
	self validationOfTarget: aTarget.
	theManagerOfCards := theGame managerOfCardsActive.
	(aTarget at: 2) isString
		ifTrue: [ theManagerOfCards cancelCardOnTargetWithCardAndPlayer: aTarget ]
		ifFalse: [ theManagerOfCards cancelCardOnTargetWithCardAndSlot: aTarget ]
]

{ #category : #validation }
Cancellation >> validationOfFirstTarget: aTarget [
	(aTarget createCard isKindOf: Card)
		ifFalse: [ Error
				signal:
					'The card Cancellation must receive a collection with a Card and a player/slot as a target' ]
]

{ #category : #validation }
Cancellation >> validationOfSecondTarget: aTarget [
	(aTarget isKindOf: String) | (aTarget isKindOf: BoardSlot)
		ifFalse: [ Error
				signal:
					'The card Cancellation must receive a collection with a Card and a player/slot as a target' ]
]

{ #category : #validation }
Cancellation >> validationOfTarget: aTarget [
	aTarget isArray
		ifTrue: [ self validationOfFirstTarget: (aTarget at: 1).
			self validationOfSecondTarget: (aTarget at: 2) ]
		ifFalse: [ Error
				signal:
					'The card Cancellation must receive a collection with a Card and a player/slot as a target' ]
]
