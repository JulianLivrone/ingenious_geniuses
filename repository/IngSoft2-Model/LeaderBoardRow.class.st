"
This object has as instance variables the information related to a player; for example the position or number of rounds made and has the responsability to update this information after each turn
"
Class {
	#name : #LeaderBoardRow,
	#superclass : #Object,
	#instVars : [
		'player',
		'playerPosition',
		'playerRoundsMade',
		'slotsPassedByThePlayer'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #'instance creation' }
LeaderBoardRow class >> forA: aPlayer [
	^ self new initializeWithA: aPlayer
]

{ #category : #comparing }
LeaderBoardRow >> <= aLeaderBoardRow [
	^ slotsPassedByThePlayer <= aLeaderBoardRow slotsPassedByThePlayer
]

{ #category : #update }
LeaderBoardRow >> changePositionAndRoundsMadeBy: aPlayer inA: slotsQuantity forThis: board [
	playerPosition := playerPosition + slotsQuantity.
	playerPosition > board numberOfSlots
		ifTrue: [ playerPosition := playerPosition - board numberOfSlots.
			playerRoundsMade := playerRoundsMade + 1 ].
	playerPosition < 0
		ifTrue: [ playerPosition := playerPosition + board numberOfSlots + 1.
			playerRoundsMade := playerRoundsMade - 1 ].
	slotsPassedByThePlayer := playerRoundsMade * board numberOfSlots + playerPosition
]

{ #category : #'as yet unclassified' }
LeaderBoardRow >> currentPlayerIsWinnerForThis: roundsForTheGameToBeOver [
	^ playerRoundsMade == roundsForTheGameToBeOver
]

{ #category : #initialization }
LeaderBoardRow >> initializeWithA: aPlayer [
	player := aPlayer.
	playerPosition := 0.
	playerRoundsMade := 0.
	slotsPassedByThePlayer := 0.
]

{ #category : #'player information' }
LeaderBoardRow >> player [
	^ player
]

{ #category : #accessing }
LeaderBoardRow >> playerPosition [
	^ playerPosition
]

{ #category : #accessing }
LeaderBoardRow >> playerRoundsMade [
	^ playerRoundsMade
]

{ #category : #accessing }
LeaderBoardRow >> slotsPassedByThePlayer [
	^ slotsPassedByThePlayer
]