"
A ORActionUnextendMethod is a generated class useful to Orion. It corresponds to an action that can be performed on a type of model element 
"
Class {
	#name : #ORActionUnextendMethod,
	#superclass : #ORActionMove,
	#category : 'OrionFamixCore-Action'
}

{ #category : #'as yet unclassified' }
ORActionUnextendMethod class >> description [
	^'unextend method'
]

{ #category : #'as yet unclassified' }
ORActionUnextendMethod class >> needs: anElement [
	^nil
]

{ #category : #'as yet unclassified' }
ORActionUnextendMethod class >> scope [
	<ORActionFor: #ORMethod>
	^self
]

{ #category : #'method execution' }
ORActionUnextendMethod >> run [
	| newMethod theNewClass theNewPackage theOldPackage |
	super run.
	newMethod := (self orionModel retrieveEntity:entity).
		
	theOldPackage := (self orionModel retrieveEntity:entity parentPackage).
	theOldPackage privateChildNamedEntities:  (theOldPackage privateChildNamedEntities orionCopy orionRemove: newMethod).
	
	theNewClass := (self orionModel retrieveEntity:entity parentType).
	theNewClass extendedInPackages remove: entity parentPackage.
	
	theNewPackage := (self orionModel retrieveEntity: theNewClass parentPackage).
	
	newMethod privateParentPackage: theNewPackage.
	theNewPackage privateChildNamedEntities:  (theNewPackage privateChildNamedEntities orionCopy unsafeAdd: newMethod).

	^newMethod
]
