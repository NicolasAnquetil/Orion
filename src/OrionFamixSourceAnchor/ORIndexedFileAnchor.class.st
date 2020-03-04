"
A ORIndexedFileAnchor is a generated class useful to Orion. All the methods are also generated from the instance variables of the corresponding famix class.
"
Class {
	#name : #ORIndexedFileAnchor,
	#superclass : #FAMIXIndexedFileAnchor,
	#traits : 'TFAMIXIndexedFileAnchor',
	#classTraits : 'TFAMIXIndexedFileAnchor classTrait',
	#category : 'OrionFamixSourceAnchor-Class'
}

{ #category : #'as yet unclassified' }
ORIndexedFileAnchor class >> isOrionClass [
	^ true
]

{ #category : #accessing }
ORIndexedFileAnchor >> currentContext [
	"Answers the model containing the current entity"
	^ self privateState currentContext
]

{ #category : #accessing }
ORIndexedFileAnchor >> currentContext: aVersion [
	"Answers the model containing the current entity"
	^ self privateState currentContext: aVersion
]

{ #category : #'initialize-release' }
ORIndexedFileAnchor >> defaultStateClass [ 
	"Answer the default implementator of this element's state."
	^ORDefaultState
]

{ #category : #accessing }
ORIndexedFileAnchor >> element [
	^ self elementOR: self currentContext
]

{ #category : #accessing }
ORIndexedFileAnchor >> elementOR: aVersion [
	^ self privateElement versionIn: aVersion
]

{ #category : #accessing }
ORIndexedFileAnchor >> endPos [
	^ self endPosOR: self currentContext
]

{ #category : #accessing }
ORIndexedFileAnchor >> endPosOR: aVersion [
	^ self privateEndPos versionIn: aVersion
]

{ #category : #accessing }
ORIndexedFileAnchor >> fileName [
	^ self fileNameOR: self currentContext
]

{ #category : #accessing }
ORIndexedFileAnchor >> fileNameOR: aVersion [
	^ self privateFileName versionIn: aVersion
]

{ #category : #testing }
ORIndexedFileAnchor >> isCreatedBetween: anOrionModel and: anotherOrionModel [
		
		^(anOrionModel entityStorage atID: self mooseID ifAbsent:[nil]) isNil
			and:[(anotherOrionModel entityStorage atID: self mooseID ifAbsent:[nil]) notNil].
		
]

{ #category : #testing }
ORIndexedFileAnchor >> isCreatedIn: anOrionModel [
		|parent|
		parent := anOrionModel parentModel.
		parent isNil 
			ifTrue:[^true]
			ifFalse:[
				^(parent entityStorage atID: self mooseID ifAbsent:[nil]) isNil.
			]
]

{ #category : #testing }
ORIndexedFileAnchor >> isModifiedBetween: anOrionModel and: anotherOrionModel [
		|old new|
		old := anOrionModel entityStorage atID: self mooseID ifAbsent:[^false].
		new := anotherOrionModel entityStorage atID: self mooseID ifAbsent:[^false].
		
		^old mooseModel ~~ new mooseModel.
]

{ #category : #testing }
ORIndexedFileAnchor >> isModifiedIn: anOrionModel [
		|parent|
		parent := anOrionModel parentModel.
		parent isNil 
			ifTrue:[^false]
			ifFalse:[
				^(parent entityStorage atID: self mooseID ifAbsent:[nil]) isNil.
			]
]

{ #category : #testing }
ORIndexedFileAnchor >> isOrionEntity [
	^ true
]

{ #category : #testing }
ORIndexedFileAnchor >> isRemovedBetween: anOrionModel and: anotherOrionModel [
		
		^(anOrionModel entityStorage atID: self mooseID ifAbsent:[nil]) notNil
			and:[(anotherOrionModel entityStorage atID: self mooseID ifAbsent:[nil]) isNil].
]

{ #category : #testing }
ORIndexedFileAnchor >> isRemovedIn: anOrionModel [
		|parent|
		parent := anOrionModel parentModel.
		parent ifNil:[
			^(anOrionModel entityStorage atID: self mooseID ifAbsent:[nil]) isNil
		].
		^(parent entityStorage atID: self mooseID ifAbsent:[nil]) notNil
			and:[(anOrionModel entityStorage atID: self mooseID ifAbsent:[nil]) isNil].
]

{ #category : #accessing }
ORIndexedFileAnchor >> orionID [
	^ self mooseID
]

{ #category : #accessing }
ORIndexedFileAnchor >> orionModel [
	"Answers the model containing the current entity"
	^ self privateState model
]

{ #category : #accessing }
ORIndexedFileAnchor >> orionModel: aModel [
	"Answers the model containing the current entity"
	^ self mooseModel: aModel
]

{ #category : #accessing }
ORIndexedFileAnchor >> startPos [
	^ self startPosOR: self currentContext
]

{ #category : #accessing }
ORIndexedFileAnchor >> startPosOR: aVersion [
	^ self privateStartPos versionIn: aVersion
]

{ #category : #accessing }
ORIndexedFileAnchor >> stateBetween: anOrionModel and: anotherOrionModel [

	(self isCreatedBetween: anOrionModel and: anotherOrionModel) ifTrue:[^#isCreated].
	(self isModifiedBetween: anOrionModel and: anotherOrionModel) ifTrue:[^#isModified].
	(self isRemovedBetween: anOrionModel and: anotherOrionModel) ifTrue:[^#isRemoved].
	^#notChanged
	
]

{ #category : #accessing }
ORIndexedFileAnchor >> stateIn: anOrionModel [

	(self isCreatedIn: anOrionModel) ifTrue:[^#isCreated].
	(self isModifiedIn: anOrionModel) ifTrue:[^#isModified].
	(self isRemovedIn: anOrionModel) ifTrue:[^#isRemoved].
	^#notChanged
	
]

{ #category : #accessing }
ORIndexedFileAnchor >> versionIn: anOrionModel [
	| upEntity |
	upEntity := anOrionModel entityStorage
		atID: self mooseID
		ifAbsent: [ "OREntityNotFoundInCurrentModel signal: self model: anOrionModel."
			^ nil	"Should NEVER happen... If it is happening, you are NOT in the right model and currentContext of the caller should have been set to the right model where the considered entity is existing. By set, I mean for at least the first entity where you begin the query; the currentContext is transmitted to the other entities  ---VB---" ].
	upEntity currentContext: anOrionModel.
	^ upEntity
]
