"
I store metadata for this package. These meta data are used by other tools such as the SmalllintManifestChecker and the critics Browser
"
Class {
	#name : #ManifestIngSoftTests,
	#superclass : #PackageManifest,
	#category : #'IngSoft2-Tests-Manifest'
}

{ #category : #'code-critics' }
ManifestIngSoftTests class >> ruleGRTemporaryNeitherReadNorWrittenRuleV1FalsePositive [
	^ #(#(#(#RGMethodDefinition #(#GameTest #testHappyPathDeterministic #false)) #'2020-07-27T15:36:14.124105-03:00') )
]

{ #category : #'code-critics' }
ManifestIngSoftTests class >> ruleRBLongMethodsRuleV1FalsePositive [
	^ #(#(#(#RGMethodDefinition #(#GameTest #testHappyPathDeterministic #false)) #'2020-07-27T15:44:17.89802-03:00') #(#(#RGMethodDefinition #(#GameTest #testValidationOfTheTargetThatTheCardsReceive #false)) #'2020-07-27T21:40:43.322437-03:00') #(#(#RGMethodDefinition #(#GameTest #testReversalCardCantChangeAOneStateSlot #false)) #'2020-07-28T15:48:40.554757-03:00') #(#(#RGMethodDefinition #(#GameTest #testReversalCardOnlyChangeTheStateOfTheSelectedSlot #false)) #'2020-07-29T17:02:00.288026-03:00') #(#(#RGMethodDefinition #(#GameTest #testHappyPathDeterministicWithReversalCard #false)) #'2020-08-07T14:19:09.242794-03:00') #(#(#RGMethodDefinition #(#GameTest #testUsingAReversalCardOnASpeedUpNowTheEffectChangesRoundsMadeIfNecessary #false)) #'2020-08-07T15:09:11.447794-03:00') #(#(#RGMethodDefinition #(#GameTest #testPlayerWinsThanksToUsingAReversalCardOnAWormHoleSlot #false)) #'2020-08-07T15:10:24.051794-03:00') #(#(#RGMethodDefinition #(#GameTest #testUsingAReversalCardOnMoonWalkNowTheEffectChangesRoundsMadeIfNecessary #false)) #'2020-08-07T15:15:49.877794-03:00') #(#(#RGMethodDefinition #(#GameTest #testReversalCardAppliedOnDifferentSlots #false)) #'2020-08-07T15:23:24.036794-03:00') )
]
