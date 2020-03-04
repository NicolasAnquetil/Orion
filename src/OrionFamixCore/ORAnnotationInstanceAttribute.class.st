"
A ORAnnotationInstanceAttribute is a generated class useful to Orion. All the methods are also generated from the instance variables of the corresponding famix class.
"
Class {
	#name : #ORAnnotationInstanceAttribute,
	#superclass : #FAMIXAnnotationInstanceAttribute,
	#traits : 'TFAMIXAnnotationInstanceAttribute',
	#classTraits : 'TFAMIXAnnotationInstanceAttribute classTrait',
	#category : 'OrionFamixCore-Class'
}

{ #category : #'as yet unclassified' }
ORAnnotationInstanceAttribute class >> isOrionClass [
	^ true
]

{ #category : #'as yet unclassified' }
ORAnnotationInstanceAttribute >> deleteInAction: anAction [
	ORActionRemoveAnnotationInstanceAttribute new
		parentAction: anAction;
		orionModel: anAction orionModel;
		entity: self;
		run; postRun
]
