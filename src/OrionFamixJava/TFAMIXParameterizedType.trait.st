"
A TFAMIXParameterizedType is a generated trait useful to Orion. All the methods are also generated from the instance variables of the corresponding famix class. The use links between the Orion traits follow the hierarchy of the Famix classes. 
"
Trait {
	#name : #TFAMIXParameterizedType,
	#traits : 'TFAMIXType',
	#classTraits : 'TFAMIXType classTrait',
	#category : 'OrionFamixJava-Trait'
}

{ #category : #'as yet unclassified' }
TFAMIXParameterizedType classSide >> isOrionClass [
	^ true
]

{ #category : #accessing }
TFAMIXParameterizedType >> addAnnotationInstanceOfType: anAnnotationTypeName inModel: aModelVersion [
	^ anAnnotationTypeName
		ifNotNil: [ (ORActionAddAnnotationInstance new
				orionModel: aModelVersion;
				container: self;
				type: anAnnotationTypeName)
				manualRun;
				postRun ]
]

{ #category : #adding }
TFAMIXParameterizedType >> addClassNamed: aString inModel: aModelVersion [
	^ self addClassNamed: aString isStub: false inModel: aModelVersion
]

{ #category : #adding }
TFAMIXParameterizedType >> addClassNamed: aString isStub: aBoolean inModel: aModelVersion [
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
TFAMIXParameterizedType >> addClassNamed: aString isStub: aBoolean withNamespace: aNamespace inModel: aModelVersion [
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
TFAMIXParameterizedType >> addClassNamed: aString withNamespace: aNamespace inModel: aModelVersion [
	^aString
		ifNotNil: [ 
			(ORActionAddClass new
				orionModel: aModelVersion;
				parent: self;
				container: aNamespace;
				newName: aString) manualRun; postRun ]
]

{ #category : #adding }
TFAMIXParameterizedType >> addInheritanceTo: superclass inModel: anORModel [
	^ (ORActionAddInheritance new
		orionModel: anORModel;
		from: self;
		to: superclass)
		manualRun;
		postRun
]

{ #category : #adding }
TFAMIXParameterizedType >> addStubClassNamed: aString inModel: aModelVersion [
	^ self addClassNamed: aString isStub: true inModel: aModelVersion
]

{ #category : #accessing }
TFAMIXParameterizedType >> annotationInstances [
	^ self annotationInstancesOR: self currentContext
]

{ #category : #accessing }
TFAMIXParameterizedType >> annotationInstancesOR: aVersion [
	^ self privateAnnotationInstances versionIn: aVersion
]

{ #category : #accessing }
TFAMIXParameterizedType >> arguments [
	^ self argumentsOR: self currentContext
]

{ #category : #accessing }
TFAMIXParameterizedType >> argumentsOR: aVersion [
	^ self privateArguments versionIn: aVersion
]

{ #category : #accessing }
TFAMIXParameterizedType >> attributes [
	^ self attributesOR: self currentContext
]

{ #category : #accessing }
TFAMIXParameterizedType >> attributesOR: aVersion [
	^ self privateAttributes versionIn: aVersion
]

{ #category : #accessing }
TFAMIXParameterizedType >> behavioursWithDeclaredType [
	^ self behavioursWithDeclaredTypeOR: self currentContext
]

{ #category : #accessing }
TFAMIXParameterizedType >> behavioursWithDeclaredTypeOR: aVersion [
	^ self privateBehavioursWithDeclaredType versionIn: aVersion
]

{ #category : #accessing }
TFAMIXParameterizedType >> comments [
	^ self commentsOR: self currentContext
]

{ #category : #accessing }
TFAMIXParameterizedType >> commentsOR: aVersion [
	^ self privateComments versionIn: aVersion
]

{ #category : #accessing }
TFAMIXParameterizedType >> container [
	^ self containerOR: self currentContext
]

{ #category : #accessing }
TFAMIXParameterizedType >> containerOR: aVersion [
	^ self privateContainer versionIn: aVersion
]

{ #category : #accessing }
TFAMIXParameterizedType >> currentContext [
	"Answers the model containing the current entity"
	^ self privateState currentContext
]

{ #category : #accessing }
TFAMIXParameterizedType >> currentContext: aVersion [
	"Answers the model containing the current entity"
	^ self privateState currentContext: aVersion
]

{ #category : #accessing }
TFAMIXParameterizedType >> declaredSourceLanguage [
	^ self declaredSourceLanguageOR: self currentContext
]

{ #category : #accessing }
TFAMIXParameterizedType >> declaredSourceLanguageOR: aVersion [
	^ self privateDeclaredSourceLanguage versionIn: aVersion
]

{ #category : #'initialize-release-ok' }
TFAMIXParameterizedType >> defaultStateClass [ 
	"Answer the default implementator of this element's state."
	^ORDefaultState
]

{ #category : #accessing }
TFAMIXParameterizedType >> famixClass [
	"All Orion classes are direct subclasses of their Famix counterpart"
	^ super famixClass superclass
]

{ #category : #accessing }
TFAMIXParameterizedType >> functions [
	^ self functionsOR: self currentContext
]

{ #category : #accessing }
TFAMIXParameterizedType >> functionsOR: aVersion [
	^ self privateFunctions versionIn: aVersion
]

{ #category : #accessing }
TFAMIXParameterizedType >> incomingReferences [
	^ self incomingReferencesOR: self currentContext
]

{ #category : #accessing }
TFAMIXParameterizedType >> incomingReferencesOR: aVersion [
	^ self privateIncomingReferences versionIn: aVersion
]

{ #category : #testing }
TFAMIXParameterizedType >> isCreatedBetween: anOrionModel and: anotherOrionModel [
		
		^(anOrionModel entityStorage atID: self mooseID ifAbsent:[nil]) isNil
			and:[(anotherOrionModel entityStorage atID: self mooseID ifAbsent:[nil]) notNil].
		
]

{ #category : #testing }
TFAMIXParameterizedType >> isCreatedIn: anOrionModel [
		|parent|
		parent := anOrionModel parentModel.
		parent isNil 
			ifTrue:[^true]
			ifFalse:[
				^(parent entityStorage atID: self mooseID ifAbsent:[nil]) isNil.
			]
]

{ #category : #testing }
TFAMIXParameterizedType >> isModifiedBetween: anOrionModel and: anotherOrionModel [
		|old new|
		old := anOrionModel entityStorage atID: self mooseID ifAbsent:[^false].
		new := anotherOrionModel entityStorage atID: self mooseID ifAbsent:[^false].
		
		^old mooseModel ~~ new mooseModel.
]

{ #category : #testing }
TFAMIXParameterizedType >> isModifiedIn: anOrionModel [
		|parent|
		parent := anOrionModel parentModel.
		parent isNil 
			ifTrue:[^false]
			ifFalse:[
				^(parent entityStorage atID: self mooseID ifAbsent:[nil]) isNil.
			]
]

{ #category : #testing }
TFAMIXParameterizedType >> isOrionEntity [
	^ true
]

{ #category : #testing }
TFAMIXParameterizedType >> isRemovedBetween: anOrionModel and: anotherOrionModel [
		
		^(anOrionModel entityStorage atID: self mooseID ifAbsent:[nil]) notNil
			and:[(anotherOrionModel entityStorage atID: self mooseID ifAbsent:[nil]) isNil].
]

{ #category : #testing }
TFAMIXParameterizedType >> isRemovedIn: anOrionModel [
		|parent|
		parent := anOrionModel parentModel.
		parent ifNil:[
			^(anOrionModel entityStorage atID: self mooseID ifAbsent:[nil]) isNil
		].
		^(parent entityStorage atID: self mooseID ifAbsent:[nil]) notNil
			and:[(anOrionModel entityStorage atID: self mooseID ifAbsent:[nil]) isNil].
]

{ #category : #testing }
TFAMIXParameterizedType >> isStub [
	^ self isStubOR: self currentContext
]

{ #category : #testing }
TFAMIXParameterizedType >> isStubOR: aVersion [
	^ self privateIsStub versionIn: aVersion
]

{ #category : #accessing }
TFAMIXParameterizedType >> methods [
	^ self methodsOR: self currentContext
]

{ #category : #accessing }
TFAMIXParameterizedType >> methodsOR: aVersion [
	^ self privateMethods versionIn: aVersion
]

{ #category : #accessing }
TFAMIXParameterizedType >> modifiers [
	^ self modifiersOR: self currentContext
]

{ #category : #accessing }
TFAMIXParameterizedType >> modifiersOR: aVersion [
	^ self privateModifiers versionIn: aVersion
]

{ #category : #accessing }
TFAMIXParameterizedType >> name [
	^ self nameOR: self currentContext
]

{ #category : #accessing }
TFAMIXParameterizedType >> nameOR: aVersion [
	^ self privateName versionIn: aVersion
]

{ #category : #accessing }
TFAMIXParameterizedType >> orionID [
	^ self mooseID
]

{ #category : #accessing }
TFAMIXParameterizedType >> orionModel [
	"Answers the model containing the current entity"
	^ self privateState model
]

{ #category : #accessing }
TFAMIXParameterizedType >> orionModel: aModel [
	"Answers the model containing the current entity"
	^ self mooseModel: aModel
]

{ #category : #accessing }
TFAMIXParameterizedType >> outgoingReferences [
	^ self outgoingReferencesOR: self currentContext
]

{ #category : #accessing }
TFAMIXParameterizedType >> outgoingReferencesOR: aVersion [
	^ self privateOutgoingReferences versionIn: aVersion
]

{ #category : #accessing }
TFAMIXParameterizedType >> parameterizableClass [
	^ self parameterizableClassOR: self currentContext
]

{ #category : #accessing }
TFAMIXParameterizedType >> parameterizableClassOR: aVersion [
	^ self privateParameterizableClass versionIn: aVersion
]

{ #category : #accessing }
TFAMIXParameterizedType >> parentPackage [
	^ self parentPackageOR: self currentContext
]

{ #category : #accessing }
TFAMIXParameterizedType >> parentPackageOR: aVersion [
	^ self privateParentPackage versionIn: aVersion
]

{ #category : #accessing }
TFAMIXParameterizedType >> receivingInvocations [
	^ self receivingInvocationsOR: self currentContext
]

{ #category : #accessing }
TFAMIXParameterizedType >> receivingInvocationsOR: aVersion [
	^ self privateReceivingInvocations versionIn: aVersion
]

{ #category : #accessing }
TFAMIXParameterizedType >> sourceAnchor [
	^ self sourceAnchorOR: self currentContext
]

{ #category : #accessing }
TFAMIXParameterizedType >> sourceAnchorOR: aVersion [
	^ self privateSourceAnchor versionIn: aVersion
]

{ #category : #accessing }
TFAMIXParameterizedType >> stateBetween: anOrionModel and: anotherOrionModel [

	(self isCreatedBetween: anOrionModel and: anotherOrionModel) ifTrue:[^#isCreated].
	(self isModifiedBetween: anOrionModel and: anotherOrionModel) ifTrue:[^#isModified].
	(self isRemovedBetween: anOrionModel and: anotherOrionModel) ifTrue:[^#isRemoved].
	^#notChanged
	
]

{ #category : #accessing }
TFAMIXParameterizedType >> stateIn: anOrionModel [

	(self isCreatedIn: anOrionModel) ifTrue:[^#isCreated].
	(self isModifiedIn: anOrionModel) ifTrue:[^#isModified].
	(self isRemovedIn: anOrionModel) ifTrue:[^#isRemoved].
	^#notChanged
	
]

{ #category : #accessing }
TFAMIXParameterizedType >> structuresWithDeclaredType [
	^ self structuresWithDeclaredTypeOR: self currentContext
]

{ #category : #accessing }
TFAMIXParameterizedType >> structuresWithDeclaredTypeOR: aVersion [
	^ self privateStructuresWithDeclaredType versionIn: aVersion
]

{ #category : #accessing }
TFAMIXParameterizedType >> subInheritances [
	^ self subInheritancesOR: self currentContext
]

{ #category : #accessing }
TFAMIXParameterizedType >> subInheritancesOR: aVersion [
	^ self privateSubInheritances versionIn: aVersion
]

{ #category : #accessing }
TFAMIXParameterizedType >> superInheritances [
	^ self superInheritancesOR: self currentContext
]

{ #category : #accessing }
TFAMIXParameterizedType >> superInheritancesOR: aVersion [
	^ self privateSuperInheritances versionIn: aVersion
]

{ #category : #accessing }
TFAMIXParameterizedType >> types [
	^ self typesOR: self currentContext
]

{ #category : #accessing }
TFAMIXParameterizedType >> typesOR: aVersion [
	^ self privateTypes versionIn: aVersion
]
