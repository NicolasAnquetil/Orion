"
A TFAMIXIndexedFileAnchor is a generated trait useful to Orion. All the methods are also generated from the instance variables of the corresponding famix class. The use links between the Orion traits follow the hierarchy of the Famix classes. 
"
Trait {
	#name : #TFAMIXIndexedFileAnchor,
	#traits : 'TFAMIXAbstractFileAnchor',
	#classTraits : 'TFAMIXAbstractFileAnchor classTrait',
	#category : 'OrionFamixSourceAnchor-Trait'
}

{ #category : #'as yet unclassified' }
TFAMIXIndexedFileAnchor classSide >> isOrionClass [
	^ true
]

{ #category : #accessing }
TFAMIXIndexedFileAnchor >> currentContext [
	"Answers the model containing the current entity"
	^ self privateState currentContext
]

{ #category : #accessing }
TFAMIXIndexedFileAnchor >> currentContext: aVersion [
	"Answers the model containing the current entity"
	^ self privateState currentContext: aVersion
]

{ #category : #'initialize-release' }
TFAMIXIndexedFileAnchor >> defaultStateClass [ 
	"Answer the default implementator of this element's state."
	^ORDefaultState
]

{ #category : #accessing }
TFAMIXIndexedFileAnchor >> element [
	^ self elementOR: self currentContext
]

{ #category : #accessing }
TFAMIXIndexedFileAnchor >> elementOR: aVersion [
	^ self privateElement versionIn: aVersion
]

{ #category : #accessing }
TFAMIXIndexedFileAnchor >> endPos [
	^ self endPosOR: self currentContext
]

{ #category : #accessing }
TFAMIXIndexedFileAnchor >> endPosOR: aVersion [
	^ self privateEndPos versionIn: aVersion
]

{ #category : #accessing }
TFAMIXIndexedFileAnchor >> fileName [
	^ self fileNameOR: self currentContext
]

{ #category : #accessing }
TFAMIXIndexedFileAnchor >> fileNameOR: aVersion [
	^ self privateFileName versionIn: aVersion
]

{ #category : #testing }
TFAMIXIndexedFileAnchor >> isCreatedBetween: anOrionModel and: anotherOrionModel [
		
		^(anOrionModel entityStorage atID: self mooseID ifAbsent:[nil]) isNil
			and:[(anotherOrionModel entityStorage atID: self mooseID ifAbsent:[nil]) notNil].
		
]

{ #category : #testing }
TFAMIXIndexedFileAnchor >> isCreatedIn: anOrionModel [
		|parent|
		parent := anOrionModel parentModel.
		parent isNil 
			ifTrue:[^true]
			ifFalse:[
				^(parent entityStorage atID: self mooseID ifAbsent:[nil]) isNil.
			]
]

{ #category : #testing }
TFAMIXIndexedFileAnchor >> isModifiedBetween: anOrionModel and: anotherOrionModel [
		|old new|
		old := anOrionModel entityStorage atID: self mooseID ifAbsent:[^false].
		new := anotherOrionModel entityStorage atID: self mooseID ifAbsent:[^false].
		
		^old mooseModel ~~ new mooseModel.
]

{ #category : #testing }
TFAMIXIndexedFileAnchor >> isModifiedIn: anOrionModel [
		|parent|
		parent := anOrionModel parentModel.
		parent isNil 
			ifTrue:[^false]
			ifFalse:[
				^(parent entityStorage atID: self mooseID ifAbsent:[nil]) isNil.
			]
]

{ #category : #testing }
TFAMIXIndexedFileAnchor >> isOrionEntity [
	^ true
]

{ #category : #testing }
TFAMIXIndexedFileAnchor >> isRemovedBetween: anOrionModel and: anotherOrionModel [
		
		^(anOrionModel entityStorage atID: self mooseID ifAbsent:[nil]) notNil
			and:[(anotherOrionModel entityStorage atID: self mooseID ifAbsent:[nil]) isNil].
]

{ #category : #testing }
TFAMIXIndexedFileAnchor >> isRemovedIn: anOrionModel [
		|parent|
		parent := anOrionModel parentModel.
		parent ifNil:[
			^(anOrionModel entityStorage atID: self mooseID ifAbsent:[nil]) isNil
		].
		^(parent entityStorage atID: self mooseID ifAbsent:[nil]) notNil
			and:[(anOrionModel entityStorage atID: self mooseID ifAbsent:[nil]) isNil].
]

{ #category : #accessing }
TFAMIXIndexedFileAnchor >> orionID [
	^ self mooseID
]

{ #category : #accessing }
TFAMIXIndexedFileAnchor >> orionModel [
	"Answers the model containing the current entity"
	^ self privateState model
]

{ #category : #accessing }
TFAMIXIndexedFileAnchor >> orionModel: aModel [
	"Answers the model containing the current entity"
	^ self mooseModel: aModel
]

{ #category : #accessing }
TFAMIXIndexedFileAnchor >> startPos [
	^ self startPosOR: self currentContext
]

{ #category : #accessing }
TFAMIXIndexedFileAnchor >> startPosOR: aVersion [
	^ self privateStartPos versionIn: aVersion
]

{ #category : #accessing }
TFAMIXIndexedFileAnchor >> stateBetween: anOrionModel and: anotherOrionModel [

	(self isCreatedBetween: anOrionModel and: anotherOrionModel) ifTrue:[^#isCreated].
	(self isModifiedBetween: anOrionModel and: anotherOrionModel) ifTrue:[^#isModified].
	(self isRemovedBetween: anOrionModel and: anotherOrionModel) ifTrue:[^#isRemoved].
	^#notChanged
	
]

{ #category : #accessing }
TFAMIXIndexedFileAnchor >> stateIn: anOrionModel [

	(self isCreatedIn: anOrionModel) ifTrue:[^#isCreated].
	(self isModifiedIn: anOrionModel) ifTrue:[^#isModified].
	(self isRemovedIn: anOrionModel) ifTrue:[^#isRemoved].
	^#notChanged
	
]

{ #category : #accessing }
TFAMIXIndexedFileAnchor >> versionIn: anOrionModel [
	| upEntity |
	upEntity := anOrionModel entityStorage
		atID: self mooseID
		ifAbsent: [ "OREntityNotFoundInCurrentModel signal: self model: anOrionModel."
			^ nil	"Should NEVER happen... If it is happening, you are NOT in the right model and currentContext of the caller should have been set to the right model where the considered entity is existing. By set, I mean for at least the first entity where you begin the query; the currentContext is transmitted to the other entities  ---VB---" ].
	upEntity currentContext: anOrionModel.
	^ upEntity
]
