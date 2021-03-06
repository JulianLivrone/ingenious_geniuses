"
An Acceleration Card.
"
Class {
	#name : #Acceleration,
	#superclass : #Permanent,
	#category : #'IngSoft2-Model'
}

{ #category : #playing }
Acceleration >> applyEffectOverATarget: allThePlayers on: theGame [
	| theManagerOfCards |
	(allThePlayers isCollection) ifFalse: [ Error signal: 'The card Acccelation must receive a collection with all the players as a target' ].
	theManagerOfCards := theGame managerOfCardsActive.
	theManagerOfCards addCardToAllPlayers: self.
]

{ #category : #accessing }
Acceleration >> effect [
	^ effect
]

{ #category : #initialization }
Acceleration >> initializeCard [
	effect := 1.
	
]
