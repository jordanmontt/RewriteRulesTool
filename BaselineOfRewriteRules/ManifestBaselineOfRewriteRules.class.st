"
I store metadata for this package. These meta data are used by other tools such as the SmalllintManifestChecker and the critics Browser
"
Class {
	#name : #ManifestBaselineOfRewriteRules,
	#superclass : #PackageManifest,
	#category : #'BaselineOfRewriteRules-Manifest'
}

{ #category : #'code-critics' }
ManifestBaselineOfRewriteRules class >> ruleClassNotReferencedRuleV1FalsePositive [
	^ #(#(#(#RGClassDefinition #(#BaselineOfRewriteRules)) #'2020-04-22T14:41:17.476928-04:00') )
]

{ #category : #'code-critics' }
ManifestBaselineOfRewriteRules class >> ruleUtilityMethodsRuleV1FalsePositive [
	^ #(#(#(#RGMethodDefinition #(#BaselineOfRewriteRules #baseline: #false)) #'2020-04-26T21:02:04.340774-04:00') )
]
