"
I store metadata for this package. These meta data are used by other tools such as the SmalllintManifestChecker and the critics Browser
"
Class {
	#name : #ManifestCuOOraTests,
	#superclass : #PackageManifest,
	#category : #'CuOOra-Tests-Manifest'
}

{ #category : #'code-critics' }
ManifestCuOOraTests class >> ruleRBCollectionMessagesToExternalObjectRuleV1FalsePositive [
	^ #(#(#(#RGPackageDefinition #(#'CuOOra-Tests')) #'2020-04-03T20:48:02.748276-03:00') )
]
