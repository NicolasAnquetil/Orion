"
A ORFileAnchor is a generated class useful to Orion. All the methods are also generated from the instance variables of the corresponding famix class.
"
Class {
	#name : #ORFileAnchor,
	#superclass : #FAMIXFileAnchor,
	#traits : 'TFAMIXFileAnchor',
	#classTraits : 'TFAMIXFileAnchor classTrait',
	#category : 'OrionFamixSourceAnchor-Class'
}

{ #category : #'as yet unclassified' }
ORFileAnchor class >> isOrionClass [
	^ true
]

{ #category : #accessing }
ORFileAnchor >> currentContext [
	"Answers the model containing the current entity"
	^ self privateState currentContext
]

{ #category : #accessing }
ORFileAnchor >> currentContext: aVersion [
	"Answers the model containing the current entity"
	^ self privateState currentContext: aVersion
]

{ #category : #'initialize-release' }
ORFileAnchor >> defaultStateClass [ 
	"Answer the default implementator of this element's state."
	^ORDefaultState
]

{ #category : #accessing }
ORFileAnchor >> element [
	^ self elementOR: self currentContext
]

{ #category : #accessing }
ORFileAnchor >> elementOR: aVersion [
	^ self privateElement versionIn: aVersion
]

{ #category : #accessing }
ORFileAnchor >> endColumn [
	^ self endColumnOR: self currentContext
]

{ #category : #accessing }
ORFileAnchor >> endColumnOR: aVersion [
	^ self privateEndColumn versionIn: aVersion
]

{ #category : #accessing }
ORFileAnchor >> endLine [
	^ self endLineOR: self currentContext
]

{ #category : #accessing }
ORFileAnchor >> endLineOR: aVersion [
	^ self privateEndLine versionIn: aVersion
]

{ #category : #accessing }
ORFileAnchor >> fileName [
	^ self fileNameOR: self currentContext
]

{ #category : #accessing }
ORFileAnchor >> fileNameOR: aVersion [
	^ self privateFileName versionIn: aVersion
]

{ #category : #testing }
ORFileAnchor >> isCreatedBetween: anOrionModel and: anotherOrionModel [
		
		^(anOrionModel entityStorage atID: self mooseID ifAbsent:[nil]) isNil
			and:[(anotherOrionModel entityStorage atID: self mooseID ifAbsent:[nil]) notNil].
		
]

{ #category : #testing }
ORFileAnchor >> isCreatedIn: anOrionModel [
		|parent|
		parent := anOrionModel parentModel.
		parent isNil 
			ifTrue:[^true]
			ifFalse:[
				^(parent entityStorage atID: self mooseID ifAbsent:[nil]) isNil.
			]
]

{ #category : #testing }
ORFileAnchor >> isModifiedBetween: anOrionModel and: anotherOrionModel [
		|old new|
		old := anOrionModel entityStorage atID: self mooseID ifAbsent:[^false].
		new := anotherOrionModel entityStorage atID: self mooseID ifAbsent:[^false].
		
		^old mooseModel ~~ new mooseModel.
]

{ #category : #testing }
ORFileAnchor >> isModifiedIn: anOrionModel [
		|parent|
		parent := anOrionModel parentModel.
		parent isNil 
			ifTrue:[^false]
			ifFalse:[
				^(parent entityStorage atID: self mooseID ifAbsent:[nil]) isNil.
			]
]

{ #category : #testing }
ORFileAnchor >> isOrionEntity [
	^ true
]

{ #category : #testing }
ORFileAnchor >> isRemovedBetween: anOrionModel and: anotherOrionModel [
		
		^(anOrionModel entityStorage atID: self mooseID ifAbsent:[nil]) notNil
			and:[(anotherOrionModel entityStorage atID: self mooseID ifAbsent:[nil]) isNil].
]

{ #category : #testing }
ORFileAnchor >> isRemovedIn: anOrionModel [
		|parent|
		parent := anOrionModel parentModel.
		parent ifNil:[
			^(anOrionModel entityStorage atID: self mooseID ifAbsent:[nil]) isNil
		].
		^(parent entityStorage atID: self mooseID ifAbsent:[nil]) notNil
			and:[(anOrionModel entityStorage atID: self mooseID ifAbsent:[nil]) isNil].
]

{ #category : #accessing }
ORFileAnchor >> orionID [
	^ self mooseID
]

{ #category : #accessing }
ORFileAnchor >> orionModel [
	"Answers the model containing the current entity"
	^ self privateState model
]

{ #category : #accessing }
ORFileAnchor >> orionModel: aModel [
	"Answers the model containing the current entity"
	^ self mooseModel: aModel
]

{ #category : #accessing }
ORFileAnchor >> startColumn [
	^ self startColumnOR: self currentContext
]

{ #category : #accessing }
ORFileAnchor >> startColumnOR: aVersion [
	^ self privateStartColumn versionIn: aVersion
]

{ #category : #accessing }
ORFileAnchor >> startLine [
	^ self startLineOR: self currentContext
]

{ #category : #accessing }
ORFileAnchor >> startLineOR: aVersion [
	^ self privateStartLine versionIn: aVersion
]

{ #category : #accessing }
ORFileAnchor >> stateBetween: anOrionModel and: anotherOrionModel [

	(self isCreatedBetween: anOrionModel and: anotherOrionModel) ifTrue:[^#isCreated].
	(self isModifiedBetween: anOrionModel and: anotherOrionModel) ifTrue:[^#isModified].
	(self isRemovedBetween: anOrionModel and: anotherOrionModel) ifTrue:[^#isRemoved].
	^#notChanged
	
]

{ #category : #accessing }
ORFileAnchor >> stateIn: anOrionModel [

	(self isCreatedIn: anOrionModel) ifTrue:[^#isCreated].
	(self isModifiedIn: anOrionModel) ifTrue:[^#isModified].
	(self isRemovedIn: anOrionModel) ifTrue:[^#isRemoved].
	^#notChanged
	
]

{ #category : #accessing }
ORFileAnchor >> versionIn: anOrionModel [
	| upEntity |
	upEntity := anOrionModel entityStorage
		atID: self mooseID
		ifAbsent: [ "OREntityNotFoundInCurrentModel signal: self model: anOrionModel."
			^ nil	"Should NEVER happen... If it is happening, you are NOT in the right model and currentContext of the caller should have been set to the right model where the considered entity is existing. By set, I mean for at least the first entity where you begin the query; the currentContext is transmitted to the other entities  ---VB---" ].
	upEntity currentContext: anOrionModel.
	^ upEntity
]
