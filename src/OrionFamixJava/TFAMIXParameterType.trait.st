"
A TFAMIXParameterType is a generated trait useful to Orion. All the methods are also generated from the instance variables of the corresponding famix class. The use links between the Orion traits follow the hierarchy of the Famix classes. 
"
Trait {
	#name : #TFAMIXParameterType,
	#traits : 'TFAMIXType',
	#classTraits : 'TFAMIXType classTrait',
	#category : 'OrionFamixJava-Trait'
}

{ #category : #'as yet unclassified' }
TFAMIXParameterType classSide >> isOrionClass [
	^ true
]

{ #category : #accessing }
TFAMIXParameterType >> addAnnotationInstanceOfType: anAnnotationTypeName inModel: aModelVersion [
	^ anAnnotationTypeName
		ifNotNil: [ (ORActionAddAnnotationInstance new
				orionModel: aModelVersion;
				container: self;
				type: anAnnotationTypeName)
				manualRun;
				postRun ]
]

{ #category : #adding }
TFAMIXParameterType >> addClassNamed: aString inModel: aModelVersion [
	^ self addClassNamed: aString isStub: false inModel: aModelVersion
]

{ #category : #adding }
TFAMIXParameterType >> addClassNamed: aString isStub: aBoolean inModel: aModelVersion [
	^ aString
		ifNotNil: [ (ORActionAddClass new
				orionModel: aModelVersion;
				container: self;
				isStub: aBoolean;
				newName: aString)
				manualRun;
				postRun ]
]

{ #category : #adding }
TFAMIXParameterType >> addClassNamed: aString isStub: aBoolean withNamespace: aNamespace inModel: aModelVersion [
	^ aString
		ifNotNil: [ (ORActionAddClass new
				orionModel: aModelVersion;
				parent: self;
				isStub: aBoolean;
				container: aNamespace;
				newName: aString)
				manualRun;
				postRun ]
]

{ #category : #adding }
TFAMIXParameterType >> addClassNamed: aString withNamespace: aNamespace inModel: aModelVersion [
	^aString
		ifNotNil: [ 
			(ORActionAddClass new
				orionModel: aModelVersion;
				parent: self;
				container: aNamespace;
				newName: aString) manualRun; postRun ]
]

{ #category : #adding }
TFAMIXParameterType >> addInheritanceTo: superclass inModel: anORModel [
	^ (ORActionAddInheritance new
		orionModel: anORModel;
		from: self;
		to: superclass)
		manualRun;
		postRun
]

{ #category : #adding }
TFAMIXParameterType >> addStubClassNamed: aString inModel: aModelVersion [
	^ self addClassNamed: aString isStub: true inModel: aModelVersion
]

{ #category : #accessing }
TFAMIXParameterType >> annotationInstances [
	^ self annotationInstancesOR: self currentContext
]

{ #category : #accessing }
TFAMIXParameterType >> annotationInstancesOR: aVersion [
	^ self privateAnnotationInstances versionIn: aVersion
]

{ #category : #accessing }
TFAMIXParameterType >> attributes [
	^ self attributesOR: self currentContext
]

{ #category : #accessing }
TFAMIXParameterType >> attributesOR: aVersion [
	^ self privateAttributes versionIn: aVersion
]

{ #category : #accessing }
TFAMIXParameterType >> behavioursWithDeclaredType [
	^ self behavioursWithDeclaredTypeOR: self currentContext
]

{ #category : #accessing }
TFAMIXParameterType >> behavioursWithDeclaredTypeOR: aVersion [
	^ self privateBehavioursWithDeclaredType versionIn: aVersion
]

{ #category : #accessing }
TFAMIXParameterType >> comments [
	^ self commentsOR: self currentContext
]

{ #category : #accessing }
TFAMIXParameterType >> commentsOR: aVersion [
	^ self privateComments versionIn: aVersion
]

{ #category : #accessing }
TFAMIXParameterType >> container [
	^ self containerOR: self currentContext
]

{ #category : #accessing }
TFAMIXParameterType >> containerOR: aVersion [
	^ self privateContainer versionIn: aVersion
]

{ #category : #accessing }
TFAMIXParameterType >> currentContext [
	"Answers the model containing the current entity"
	^ self privateState currentContext
]

{ #category : #accessing }
TFAMIXParameterType >> currentContext: aVersion [
	"Answers the model containing the current entity"
	^ self privateState currentContext: aVersion
]

{ #category : #accessing }
TFAMIXParameterType >> declaredSourceLanguage [
	^ self declaredSourceLanguageOR: self currentContext
]

{ #category : #accessing }
TFAMIXParameterType >> declaredSourceLanguageOR: aVersion [
	^ self privateDeclaredSourceLanguage versionIn: aVersion
]

{ #category : #'initialize-release-ok' }
TFAMIXParameterType >> defaultStateClass [ 
	"Answer the default implementator of this element's state."
	^ORDefaultState
]

{ #category : #accessing }
TFAMIXParameterType >> famixClass [
	"All Orion classes are direct subclasses of their Famix counterpart"
	^ super famixClass superclass
]

{ #category : #accessing }
TFAMIXParameterType >> functions [
	^ self functionsOR: self currentContext
]

{ #category : #accessing }
TFAMIXParameterType >> functionsOR: aVersion [
	^ self privateFunctions versionIn: aVersion
]

{ #category : #accessing }
TFAMIXParameterType >> incomingReferences [
	^ self incomingReferencesOR: self currentContext
]

{ #category : #accessing }
TFAMIXParameterType >> incomingReferencesOR: aVersion [
	^ self privateIncomingReferences versionIn: aVersion
]

{ #category : #testing }
TFAMIXParameterType >> isCreatedBetween: anOrionModel and: anotherOrionModel [
		
		^(anOrionModel entityStorage atID: self mooseID ifAbsent:[nil]) isNil
			and:[(anotherOrionModel entityStorage atID: self mooseID ifAbsent:[nil]) notNil].
		
]

{ #category : #testing }
TFAMIXParameterType >> isCreatedIn: anOrionModel [
		|parent|
		parent := anOrionModel parentModel.
		parent isNil 
			ifTrue:[^true]
			ifFalse:[
				^(parent entityStorage atID: self mooseID ifAbsent:[nil]) isNil.
			]
]

{ #category : #testing }
TFAMIXParameterType >> isModifiedBetween: anOrionModel and: anotherOrionModel [
		|old new|
		old := anOrionModel entityStorage atID: self mooseID ifAbsent:[^false].
		new := anotherOrionModel entityStorage atID: self mooseID ifAbsent:[^false].
		
		^old mooseModel ~~ new mooseModel.
]

{ #category : #testing }
TFAMIXParameterType >> isModifiedIn: anOrionModel [
		|parent|
		parent := anOrionModel parentModel.
		parent isNil 
			ifTrue:[^false]
			ifFalse:[
				^(parent entityStorage atID: self mooseID ifAbsent:[nil]) isNil.
			]
]

{ #category : #testing }
TFAMIXParameterType >> isOrionEntity [
	^ true
]

{ #category : #testing }
TFAMIXParameterType >> isRemovedBetween: anOrionModel and: anotherOrionModel [
		
		^(anOrionModel entityStorage atID: self mooseID ifAbsent:[nil]) notNil
			and:[(anotherOrionModel entityStorage atID: self mooseID ifAbsent:[nil]) isNil].
]

{ #category : #testing }
TFAMIXParameterType >> isRemovedIn: anOrionModel [
		|parent|
		parent := anOrionModel parentModel.
		parent ifNil:[
			^(anOrionModel entityStorage atID: self mooseID ifAbsent:[nil]) isNil
		].
		^(parent entityStorage atID: self mooseID ifAbsent:[nil]) notNil
			and:[(anOrionModel entityStorage atID: self mooseID ifAbsent:[nil]) isNil].
]

{ #category : #testing }
TFAMIXParameterType >> isStub [
	^ self isStubOR: self currentContext
]

{ #category : #testing }
TFAMIXParameterType >> isStubOR: aVersion [
	^ self privateIsStub versionIn: aVersion
]

{ #category : #accessing }
TFAMIXParameterType >> methods [
	^ self methodsOR: self currentContext
]

{ #category : #accessing }
TFAMIXParameterType >> methodsOR: aVersion [
	^ self privateMethods versionIn: aVersion
]

{ #category : #accessing }
TFAMIXParameterType >> modifiers [
	^ self modifiersOR: self currentContext
]

{ #category : #accessing }
TFAMIXParameterType >> modifiersOR: aVersion [
	^ self privateModifiers versionIn: aVersion
]

{ #category : #accessing }
TFAMIXParameterType >> name [
	^ self nameOR: self currentContext
]

{ #category : #accessing }
TFAMIXParameterType >> nameOR: aVersion [
	^ self privateName versionIn: aVersion
]

{ #category : #accessing }
TFAMIXParameterType >> orionID [
	^ self mooseID
]

{ #category : #accessing }
TFAMIXParameterType >> orionModel [
	"Answers the model containing the current entity"
	^ self privateState model
]

{ #category : #accessing }
TFAMIXParameterType >> orionModel: aModel [
	"Answers the model containing the current entity"
	^ self mooseModel: aModel
]

{ #category : #accessing }
TFAMIXParameterType >> outgoingReferences [
	^ self outgoingReferencesOR: self currentContext
]

{ #category : #accessing }
TFAMIXParameterType >> outgoingReferencesOR: aVersion [
	^ self privateOutgoingReferences versionIn: aVersion
]

{ #category : #accessing }
TFAMIXParameterType >> parentPackage [
	^ self parentPackageOR: self currentContext
]

{ #category : #accessing }
TFAMIXParameterType >> parentPackageOR: aVersion [
	^ self privateParentPackage versionIn: aVersion
]

{ #category : #accessing }
TFAMIXParameterType >> receivingInvocations [
	^ self receivingInvocationsOR: self currentContext
]

{ #category : #accessing }
TFAMIXParameterType >> receivingInvocationsOR: aVersion [
	^ self privateReceivingInvocations versionIn: aVersion
]

{ #category : #accessing }
TFAMIXParameterType >> sourceAnchor [
	^ self sourceAnchorOR: self currentContext
]

{ #category : #accessing }
TFAMIXParameterType >> sourceAnchorOR: aVersion [
	^ self privateSourceAnchor versionIn: aVersion
]

{ #category : #accessing }
TFAMIXParameterType >> stateBetween: anOrionModel and: anotherOrionModel [

	(self isCreatedBetween: anOrionModel and: anotherOrionModel) ifTrue:[^#isCreated].
	(self isModifiedBetween: anOrionModel and: anotherOrionModel) ifTrue:[^#isModified].
	(self isRemovedBetween: anOrionModel and: anotherOrionModel) ifTrue:[^#isRemoved].
	^#notChanged
	
]

{ #category : #accessing }
TFAMIXParameterType >> stateIn: anOrionModel [

	(self isCreatedIn: anOrionModel) ifTrue:[^#isCreated].
	(self isModifiedIn: anOrionModel) ifTrue:[^#isModified].
	(self isRemovedIn: anOrionModel) ifTrue:[^#isRemoved].
	^#notChanged
	
]

{ #category : #accessing }
TFAMIXParameterType >> structuresWithDeclaredType [
	^ self structuresWithDeclaredTypeOR: self currentContext
]

{ #category : #accessing }
TFAMIXParameterType >> structuresWithDeclaredTypeOR: aVersion [
	^ self privateStructuresWithDeclaredType versionIn: aVersion
]

{ #category : #accessing }
TFAMIXParameterType >> subInheritances [
	^ self subInheritancesOR: self currentContext
]

{ #category : #accessing }
TFAMIXParameterType >> subInheritancesOR: aVersion [
	^ self privateSubInheritances versionIn: aVersion
]

{ #category : #accessing }
TFAMIXParameterType >> superInheritances [
	^ self superInheritancesOR: self currentContext
]

{ #category : #accessing }
TFAMIXParameterType >> superInheritancesOR: aVersion [
	^ self privateSuperInheritances versionIn: aVersion
]

{ #category : #accessing }
TFAMIXParameterType >> types [
	^ self typesOR: self currentContext
]

{ #category : #accessing }
TFAMIXParameterType >> typesOR: aVersion [
	^ self privateTypes versionIn: aVersion
]
