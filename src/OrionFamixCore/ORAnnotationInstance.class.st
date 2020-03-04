"
A ORAnnotationInstance is a generated class useful to Orion. All the methods are also generated from the instance variables of the corresponding famix class.
"
Class {
	#name : #ORAnnotationInstance,
	#superclass : #FAMIXAnnotationInstance,
	#traits : 'TFAMIXAnnotationInstance',
	#classTraits : 'TFAMIXAnnotationInstance classTrait',
	#category : 'OrionFamixCore-Class'
}

{ #category : #'as yet unclassified' }
ORAnnotationInstance class >> isOrionClass [
	^ true
]

{ #category : #'as yet unclassified' }
ORAnnotationInstance >> deleteInAction: anAction [
	ORActionRemoveAnnotationInstance new parentAction: anAction; orionModel: anAction orionModel; entity: self; run ; postRun
]

{ #category : #'as yet unclassified' }
ORAnnotationInstance >> deleteInModel: aModelVersion [
	(ORActionRemoveAnnotationInstance new
		orionModel: aModelVersion;
		entity: self;
		yourself)
		manualRun;
		postRun
]
