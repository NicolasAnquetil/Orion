"
A ORParameterizableClass is a generated class useful to Orion. All the methods are also generated from the instance variables of the corresponding famix class.
"
Class {
	#name : #ORParameterizableClass,
	#superclass : #FAMIXParameterizableClass,
	#traits : 'TFAMIXParameterizableClass',
	#classTraits : 'TFAMIXParameterizableClass classTrait',
	#category : 'OrionFamixJava-Class'
}

{ #category : #'as yet unclassified' }
ORParameterizableClass class >> isOrionClass [
	^ true
]
