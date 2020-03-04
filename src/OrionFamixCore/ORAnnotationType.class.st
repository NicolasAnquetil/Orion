"
A ORAnnotationType is a generated class useful to Orion. All the methods are also generated from the instance variables of the corresponding famix class.
"
Class {
	#name : #ORAnnotationType,
	#superclass : #FAMIXAnnotationType,
	#traits : 'TFAMIXAnnotationType',
	#classTraits : 'TFAMIXAnnotationType classTrait',
	#category : 'OrionFamixCore-Class'
}

{ #category : #'as yet unclassified' }
ORAnnotationType class >> isOrionClass [
	^ true
]

{ #category : #adding }
ORAnnotationType >> addAttributeNamed: aString inModel: aModelVersion [
	^ aString
		ifNotNil: [ (ORActionAddAnnotationTypeAttribute new
				orionModel: aModelVersion;
				container: self;
				newName: aString)
				manualRun;
				postRun ]
]

{ #category : #'as yet unclassified' }
ORAnnotationType >> deleteInModel: aModelVersion [ 
	(ORActionRemoveAnnotationType  new
		orionModel: aModelVersion;
		entity: self)
		manualRun;
		postRun
]
