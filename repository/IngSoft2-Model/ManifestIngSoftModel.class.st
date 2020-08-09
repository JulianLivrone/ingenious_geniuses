"
I store metadata for this package. These meta data are used by other tools such as the SmalllintManifestChecker and the critics Browser
"
Class {
	#name : #ManifestIngSoftModel,
	#superclass : #PackageManifest,
	#category : #'IngSoft2-Model-Manifest'
}

{ #category : #'code-critics' }
ManifestIngSoftModel class >> ruleRBBadMessageRuleV1FalsePositive [
	^ #(#(#(#RGPackageDefinition #(#'IngSoft2-Model')) #'2020-08-09T11:59:10.084544-03:00') )
]

{ #category : #'code-critics' }
ManifestIngSoftModel class >> ruleRBUtilityMethodsRuleV1FalsePositive [
	^ #(#(#(#RGPackageDefinition #(#'IngSoft2-Model')) #'2020-08-09T11:45:19.041544-03:00') )
]
