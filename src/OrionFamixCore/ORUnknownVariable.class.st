"
A ORUnknownVariable is a generated class useful to Orion. All the methods are also generated from the instance variables of the corresponding famix class.
"
Class {
	#name : #ORUnknownVariable,
	#superclass : #FAMIXUnknownVariable,
	#traits : 'TFAMIXUnknownVariable',
	#classTraits : 'TFAMIXUnknownVariable classTrait',
	#category : 'OrionFamixCore-Class'
}

{ #category : #'as yet unclassified' }
ORUnknownVariable class >> isOrionClass [
	^ true
]

{ #category : #'as yet unclassified' }
ORUnknownVariable >> deleteInModel: aModelVersion [
	(ORActionRemoveUnknownVariable new
		orionModel: aModelVersion;
		entity: self)
		manualRun;
		postRun
]
