"
A ORSourcedEntity is a generated class useful to Orion. All the methods are also generated from the instance variables of the corresponding famix class.
"
Class {
	#name : #ORSourcedEntity,
	#superclass : #FAMIXSourcedEntity,
	#traits : 'TFAMIXSourcedEntity',
	#classTraits : 'TFAMIXSourcedEntity classTrait',
	#category : 'OrionFamixCore-Class'
}

{ #category : #'as yet unclassified' }
ORSourcedEntity class >> isOrionClass [
	^ true
]

{ #category : #'as yet unclassified' }
ORSourcedEntity >> famixClass [
	"All Orion classes are direct subclasses of their Famix counterpart"
	^ super famixClass superclass
]
