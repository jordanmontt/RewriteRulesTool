"
I store metadata for this package. These meta data are used by other tools such as the SmalllintManifestChecker and the critics Browser
"
Class {
	#name : #ManifestRewriteRulesPresenters,
	#superclass : #PackageManifest,
	#category : #'RewriteRules-Presenters-Manifest'
}

{ #category : #'code-critics' }
ManifestRewriteRulesPresenters class >> ruleLongMethodsRuleV1FalsePositive [
	^ #(#(#(#RGMethodDefinition #(#RulesBrowserPresenter #iconForClass: #false)) #'2020-04-26T20:59:35.770771-04:00') )
]

{ #category : #'code-critics' }
ManifestRewriteRulesPresenters class >> ruleRBGlobalVariablesUsageV1FalsePositive [
	^ #(#(#(#RGMethodDefinition #(#RulesBrowserPresenter #iconForClass: #false)) #'2020-04-26T20:59:35.254509-04:00') )
]

{ #category : #'code-critics' }
ManifestRewriteRulesPresenters class >> ruleVariableReferencedOnceRuleV1FalsePositive [
	^ #(#(#(#RGClassDefinition #(#RewriteRulesPresenter)) #'2020-04-26T20:59:36.301759-04:00') )
]
