"
I am a class that return all the available packages that exist in the system.
"
Class {
	#name : #SystemPackagesProvider,
	#superclass : #Object,
	#category : #'RewriteRules-Core-Browser'
}

{ #category : #private }
SystemPackagesProvider class >> browsedEnvironment [
	^ RBBrowserEnvironment new
]

{ #category : #private }
SystemPackagesProvider class >> obtainSystemPackages [
	^ self browsedEnvironment packages
]
