"
A TFAMIXPharoAnchor is a generated trait useful to Orion. All the methods are also generated from the instance variables of the corresponding famix class. The use links between the Orion traits follow the hierarchy of the Famix classes. 
"
Trait {
	#name : #TFAMIXPharoAnchor,
	#traits : 'TFAMIXSourceAnchor',
	#classTraits : 'TFAMIXSourceAnchor classTrait',
	#category : 'OrionFamixSourceAnchor-Trait'
}

{ #category : #'as yet unclassified' }
TFAMIXPharoAnchor classSide >> isOrionClass [
	^ true
]

{ #category : #accessing }
TFAMIXPharoAnchor >> currentContext [
	"Answers the model containing the current entity"
	^ self privateState currentContext
]

{ #category : #accessing }
TFAMIXPharoAnchor >> currentContext: aVersion [
	"Answers the model containing the current entity"
	^ self privateState currentContext: aVersion
]

{ #category : #'initialize-release' }
TFAMIXPharoAnchor >> defaultStateClass [ 
	"Answer the default implementator of this element's state."
	^ORDefaultState
]

{ #category : #accessing }
TFAMIXPharoAnchor >> element [
	^ self elementOR: self currentContext
]

{ #category : #accessing }
TFAMIXPharoAnchor >> elementOR: aVersion [
	^ self privateElement versionIn: aVersion
]

{ #category : #testing }
TFAMIXPharoAnchor >> isCreatedBetween: anOrionModel and: anotherOrionModel [
		
		^(anOrionModel entityStorage atID: self mooseID ifAbsent:[nil]) isNil
			and:[(anotherOrionModel entityStorage atID: self mooseID ifAbsent:[nil]) notNil].
		
]

{ #category : #testing }
TFAMIXPharoAnchor >> isCreatedIn: anOrionModel [
		|parent|
		parent := anOrionModel parentModel.
		parent isNil 
			ifTrue:[^true]
			ifFalse:[
				^(parent entityStorage atID: self mooseID ifAbsent:[nil]) isNil.
			]
]

{ #category : #testing }
TFAMIXPharoAnchor >> isModifiedBetween: anOrionModel and: anotherOrionModel [
		|old new|
		old := anOrionModel entityStorage atID: self mooseID ifAbsent:[^false].
		new := anotherOrionModel entityStorage atID: self mooseID ifAbsent:[^false].
		
		^old mooseModel ~~ new mooseModel.
]

{ #category : #testing }
TFAMIXPharoAnchor >> isModifiedIn: anOrionModel [
		|parent|
		parent := anOrionModel parentModel.
		parent isNil 
			ifTrue:[^false]
			ifFalse:[
				^(parent entityStorage atID: self mooseID ifAbsent:[nil]) isNil.
			]
]

{ #category : #testing }
TFAMIXPharoAnchor >> isOrionEntity [
	^ true
]

{ #category : #testing }
TFAMIXPharoAnchor >> isRemovedBetween: anOrionModel and: anotherOrionModel [
		
		^(anOrionModel entityStorage atID: self mooseID ifAbsent:[nil]) notNil
			and:[(anotherOrionModel entityStorage atID: self mooseID ifAbsent:[nil]) isNil].
]

{ #category : #testing }
TFAMIXPharoAnchor >> isRemovedIn: anOrionModel [
		|parent|
		parent := anOrionModel parentModel.
		parent ifNil:[
			^(anOrionModel entityStorage atID: self mooseID ifAbsent:[nil]) isNil
		].
		^(parent entityStorage atID: self mooseID ifAbsent:[nil]) notNil
			and:[(anOrionModel entityStorage atID: self mooseID ifAbsent:[nil]) isNil].
]

{ #category : #accessing }
TFAMIXPharoAnchor >> orionID [
	^ self mooseID
]

{ #category : #accessing }
TFAMIXPharoAnchor >> orionModel [
	"Answers the model containing the current entity"
	^ self privateState model
]

{ #category : #accessing }
TFAMIXPharoAnchor >> orionModel: aModel [
	"Answers the model containing the current entity"
	^ self mooseModel: aModel
]

{ #category : #accessing }
TFAMIXPharoAnchor >> stateBetween: anOrionModel and: anotherOrionModel [

	(self isCreatedBetween: anOrionModel and: anotherOrionModel) ifTrue:[^#isCreated].
	(self isModifiedBetween: anOrionModel and: anotherOrionModel) ifTrue:[^#isModified].
	(self isRemovedBetween: anOrionModel and: anotherOrionModel) ifTrue:[^#isRemoved].
	^#notChanged
	
]

{ #category : #accessing }
TFAMIXPharoAnchor >> stateIn: anOrionModel [

	(self isCreatedIn: anOrionModel) ifTrue:[^#isCreated].
	(self isModifiedIn: anOrionModel) ifTrue:[^#isModified].
	(self isRemovedIn: anOrionModel) ifTrue:[^#isRemoved].
	^#notChanged
	
]

{ #category : #accessing }
TFAMIXPharoAnchor >> versionIn: anOrionModel [
	| upEntity |
	upEntity := anOrionModel entityStorage
		atID: self mooseID
		ifAbsent: [ "OREntityNotFoundInCurrentModel signal: self model: anOrionModel."
			^ nil	"Should NEVER happen... If it is happening, you are NOT in the right model and currentContext of the caller should have been set to the right model where the considered entity is existing. By set, I mean for at least the first entity where you begin the query; the currentContext is transmitted to the other entities  ---VB---" ].
	upEntity currentContext: anOrionModel.
	^ upEntity
]
