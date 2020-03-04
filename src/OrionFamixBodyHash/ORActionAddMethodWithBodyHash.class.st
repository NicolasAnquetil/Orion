Class {
	#name : #ORActionAddMethodWithBodyHash,
	#superclass : #ORActionAddMethod,
	#instVars : [
		'bodyHash'
	],
	#category : 'OrionFamixBodyHash'
}

{ #category : #accessing }
ORActionAddMethodWithBodyHash >> bodyHash [
	^ bodyHash
]

{ #category : #accessing }
ORActionAddMethodWithBodyHash >> bodyHash: anObject [
	bodyHash := anObject
]

{ #category : #'method execution - generated' }
ORActionAddMethodWithBodyHash >> run [
	self runOR: self orionModel.
	entity := self orionModel retrieveEntity: entity.
	entity bodyHash: self bodyHash orionCopy.
	^ entity
]
