"
A ORActionMoveMethodInPackage is a generated class useful to Orion. It corresponds to an action that can be performed on a type of model element 
"
Class {
	#name : #ORActionMoveMethodInPackage,
	#superclass : #ORActionMove,
	#category : 'OrionFamixCore-Action'
}

{ #category : #'as yet unclassified' }
ORActionMoveMethodInPackage class >> description [
	^'move method in another package'
]

{ #category : #'method execution' }
ORActionMoveMethodInPackage >> run [
	| theMethod theOldPackage theNewPackage|
	super run.
	theMethod := (self orionModel retrieveEntity:entity).
	theNewPackage := (self orionModel retrieveEntity:newContainer).
	
	theMethod parentPackage ifNotNil:[
		theOldPackage := (self orionModel retrieveEntity: (theMethod parentPackage)).
		theOldPackage privateChildNamedEntities:  (theOldPackage privateChildNamedEntities orionCopy orionRemove: theMethod).
	].

	theNewPackage privateChildNamedEntities:  (theNewPackage privateChildNamedEntities orionCopy unsafeAdd: theMethod).	
	theMethod privateParentPackage: theNewPackage.
	
	^theMethod
]
