"
A OREntity is a generated class useful to Orion. All the methods are also generated from the instance variables of the corresponding famix class.  
"
Class {
	#name : #OREntity,
	#superclass : #FAMIXEntity,
	#traits : 'TFAMIXEntity',
	#classTraits : 'TFAMIXEntity classTrait',
	#category : 'OrionFamixCore-Class'
}

{ #category : #'as yet unclassified' }
OREntity class >> isOrionClass [
	^ true
]
