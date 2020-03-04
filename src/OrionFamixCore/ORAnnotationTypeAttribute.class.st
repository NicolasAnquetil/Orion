"
A ORAnnotationTypeAttribute is a generated class useful to Orion. All the methods are also generated from the instance variables of the corresponding famix class.
"
Class {
	#name : #ORAnnotationTypeAttribute,
	#superclass : #FAMIXAnnotationTypeAttribute,
	#traits : 'TFAMIXAnnotationTypeAttribute',
	#classTraits : 'TFAMIXAnnotationTypeAttribute classTrait',
	#category : 'OrionFamixCore-Class'
}

{ #category : #'as yet unclassified' }
ORAnnotationTypeAttribute class >> isOrionClass [
	^ true
]

{ #category : #'as yet unclassified' }
ORAnnotationTypeAttribute >> deleteInModel: aModel [
	ORActionRemoveAnnotationTypeAttribute new
		orionModel: aModel;
		entity: self; 
		run;
		postRun
]
