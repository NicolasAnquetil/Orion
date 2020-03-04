"
A ORPackage is a generated class useful to Orion. All the methods are also generated from the instance variables of the corresponding famix class.
"
Class {
	#name : #ORPackage,
	#superclass : #FAMIXPackage,
	#traits : 'TFAMIXPackage',
	#classTraits : 'TFAMIXPackage classTrait',
	#category : 'OrionFamixCore-Class'
}

{ #category : #'as yet unclassified' }
ORPackage class >> isOrionClass [
	^ true
]

{ #category : #accessing }
ORPackage >> clientTypes [
	^ self clientTypesOR: self currentContext
]

{ #category : #accessing }
ORPackage >> clientTypesOR: aVersion [
	^ super clientTypes versionIn: aVersion
]
