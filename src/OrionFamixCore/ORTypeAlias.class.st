"
A ORTypeAlias is a generated class useful to Orion. All the methods are also generated from the instance variables of the corresponding famix class.
"
Class {
	#name : #ORTypeAlias,
	#superclass : #FAMIXTypeAlias,
	#traits : 'TFAMIXTypeAlias',
	#classTraits : 'TFAMIXTypeAlias classTrait',
	#category : 'OrionFamixCore-Class'
}

{ #category : #'as yet unclassified' }
ORTypeAlias class >> isOrionClass [
	^ true
]
