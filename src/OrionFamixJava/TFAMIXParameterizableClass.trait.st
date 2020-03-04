"
A TFAMIXParameterizableClass is a generated trait useful to Orion. All the methods are also generated from the instance variables of the corresponding famix class. The use links between the Orion traits follow the hierarchy of the Famix classes. 
"
Trait {
	#name : #TFAMIXParameterizableClass,
	#traits : 'TFAMIXClass',
	#classTraits : 'TFAMIXClass classTrait',
	#category : 'OrionFamixJava-Trait'
}

{ #category : #'as yet unclassified' }
TFAMIXParameterizableClass classSide >> isOrionClass [
	^ true
]

{ #category : #accessing }
TFAMIXParameterizableClass >> addAnnotationInstanceOfType: anAnnotationTypeName inModel: aModelVersion [
	^ anAnnotationTypeName
		ifNotNil: [ (ORActionAddAnnotationInstance new
				orionModel: aModelVersion;
				container: self;
				type: anAnnotationTypeName)
				manualRun;
				postRun ]
]

{ #category : #adding }
TFAMIXParameterizableClass >> addClassNamed: aString inModel: aModelVersion [
	^ self addClassNamed: aString isStub: false inModel: aModelVersion
]

{ #category : #adding }
TFAMIXParameterizableClass >> addClassNamed: aString isStub: aBoolean inModel: aModelVersion [
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
TFAMIXParameterizableClass >> addClassNamed: aString isStub: aBoolean withNamespace: aNamespace inModel: aModelVersion [
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
TFAMIXParameterizableClass >> addClassNamed: aString withNamespace: aNamespace inModel: aModelVersion [
	^aString
		ifNotNil: [ 
			(ORActionAddClass new
				orionModel: aModelVersion;
				parent: self;
				container: aNamespace;
				newName: aString) manualRun; postRun ]
]

{ #category : #adding }
TFAMIXParameterizableClass >> addInheritanceTo: superclass inModel: anORModel [
	^ (ORActionAddInheritance new
		orionModel: anORModel;
		from: self;
		to: superclass)
		manualRun;
		postRun
]

{ #category : #adding }
TFAMIXParameterizableClass >> addStubClassNamed: aString inModel: aModelVersion [
	^ self addClassNamed: aString isStub: true inModel: aModelVersion
]

{ #category : #accessing }
TFAMIXParameterizableClass >> annotationInstances [
	^ self annotationInstancesOR: self currentContext
]

{ #category : #accessing }
TFAMIXParameterizableClass >> annotationInstancesOR: aVersion [
	^ self privateAnnotationInstances versionIn: aVersion
]

{ #category : #accessing }
TFAMIXParameterizableClass >> attributes [
	^ self attributesOR: self currentContext
]

{ #category : #accessing }
TFAMIXParameterizableClass >> attributesOR: aVersion [
	^ self privateAttributes versionIn: aVersion
]

{ #category : #accessing }
TFAMIXParameterizableClass >> behavioursWithDeclaredType [
	^ self behavioursWithDeclaredTypeOR: self currentContext
]

{ #category : #accessing }
TFAMIXParameterizableClass >> behavioursWithDeclaredTypeOR: aVersion [
	^ self privateBehavioursWithDeclaredType versionIn: aVersion
]

{ #category : #accessing }
TFAMIXParameterizableClass >> comments [
	^ self commentsOR: self currentContext
]

{ #category : #accessing }
TFAMIXParameterizableClass >> commentsOR: aVersion [
	^ self privateComments versionIn: aVersion
]

{ #category : #accessing }
TFAMIXParameterizableClass >> container [
	^ self containerOR: self currentContext
]

{ #category : #accessing }
TFAMIXParameterizableClass >> containerOR: aVersion [
	^ self privateContainer versionIn: aVersion
]

{ #category : #accessing }
TFAMIXParameterizableClass >> currentContext [
	"Answers the model containing the current entity"
	^ self privateState currentContext
]

{ #category : #accessing }
TFAMIXParameterizableClass >> currentContext: aVersion [
	"Answers the model containing the current entity"
	^ self privateState currentContext: aVersion
]

{ #category : #accessing }
TFAMIXParameterizableClass >> declaredSourceLanguage [
	^ self declaredSourceLanguageOR: self currentContext
]

{ #category : #accessing }
TFAMIXParameterizableClass >> declaredSourceLanguageOR: aVersion [
	^ self privateDeclaredSourceLanguage versionIn: aVersion
]

{ #category : #'initialize-release-ok' }
TFAMIXParameterizableClass >> defaultStateClass [ 
	"Answer the default implementator of this element's state."
	^ORDefaultState
]

{ #category : #accessing }
TFAMIXParameterizableClass >> famixClass [
	"All Orion classes are direct subclasses of their Famix counterpart"
	^ super famixClass superclass
]

{ #category : #accessing }
TFAMIXParameterizableClass >> functions [
	^ self functionsOR: self currentContext
]

{ #category : #accessing }
TFAMIXParameterizableClass >> functionsOR: aVersion [
	^ self privateFunctions versionIn: aVersion
]

{ #category : #accessing }
TFAMIXParameterizableClass >> incomingReferences [
	^ self incomingReferencesOR: self currentContext
]

{ #category : #accessing }
TFAMIXParameterizableClass >> incomingReferencesOR: aVersion [
	^ self privateIncomingReferences versionIn: aVersion
]

{ #category : #testing }
TFAMIXParameterizableClass >> isCreatedBetween: anOrionModel and: anotherOrionModel [
		
		^(anOrionModel entityStorage atID: self mooseID ifAbsent:[nil]) isNil
			and:[(anotherOrionModel entityStorage atID: self mooseID ifAbsent:[nil]) notNil].
		
]

{ #category : #testing }
TFAMIXParameterizableClass >> isCreatedIn: anOrionModel [
		|parent|
		parent := anOrionModel parentModel.
		parent isNil 
			ifTrue:[^true]
			ifFalse:[
				^(parent entityStorage atID: self mooseID ifAbsent:[nil]) isNil.
			]
]

{ #category : #testing }
TFAMIXParameterizableClass >> isInterface [
	^ self isInterfaceOR: self currentContext
]

{ #category : #testing }
TFAMIXParameterizableClass >> isInterfaceOR: aVersion [
	^ self privateIsInterface versionIn: aVersion
]

{ #category : #testing }
TFAMIXParameterizableClass >> isModifiedBetween: anOrionModel and: anotherOrionModel [
		|old new|
		old := anOrionModel entityStorage atID: self mooseID ifAbsent:[^false].
		new := anotherOrionModel entityStorage atID: self mooseID ifAbsent:[^false].
		
		^old mooseModel ~~ new mooseModel.
]

{ #category : #testing }
TFAMIXParameterizableClass >> isModifiedIn: anOrionModel [
		|parent|
		parent := anOrionModel parentModel.
		parent isNil 
			ifTrue:[^false]
			ifFalse:[
				^(parent entityStorage atID: self mooseID ifAbsent:[nil]) isNil.
			]
]

{ #category : #testing }
TFAMIXParameterizableClass >> isOrionEntity [
	^ true
]

{ #category : #testing }
TFAMIXParameterizableClass >> isRemovedBetween: anOrionModel and: anotherOrionModel [
		
		^(anOrionModel entityStorage atID: self mooseID ifAbsent:[nil]) notNil
			and:[(anotherOrionModel entityStorage atID: self mooseID ifAbsent:[nil]) isNil].
]

{ #category : #testing }
TFAMIXParameterizableClass >> isRemovedIn: anOrionModel [
		|parent|
		parent := anOrionModel parentModel.
		parent ifNil:[
			^(anOrionModel entityStorage atID: self mooseID ifAbsent:[nil]) isNil
		].
		^(parent entityStorage atID: self mooseID ifAbsent:[nil]) notNil
			and:[(anOrionModel entityStorage atID: self mooseID ifAbsent:[nil]) isNil].
]

{ #category : #testing }
TFAMIXParameterizableClass >> isStub [
	^ self isStubOR: self currentContext
]

{ #category : #testing }
TFAMIXParameterizableClass >> isStubOR: aVersion [
	^ self privateIsStub versionIn: aVersion
]

{ #category : #accessing }
TFAMIXParameterizableClass >> methods [
	^ self methodsOR: self currentContext
]

{ #category : #accessing }
TFAMIXParameterizableClass >> methodsOR: aVersion [
	^ self privateMethods versionIn: aVersion
]

{ #category : #accessing }
TFAMIXParameterizableClass >> modifiers [
	^ self modifiersOR: self currentContext
]

{ #category : #accessing }
TFAMIXParameterizableClass >> modifiersOR: aVersion [
	^ self privateModifiers versionIn: aVersion
]

{ #category : #accessing }
TFAMIXParameterizableClass >> name [
	^ self nameOR: self currentContext
]

{ #category : #accessing }
TFAMIXParameterizableClass >> nameOR: aVersion [
	^ self privateName versionIn: aVersion
]

{ #category : #accessing }
TFAMIXParameterizableClass >> orionID [
	^ self mooseID
]

{ #category : #accessing }
TFAMIXParameterizableClass >> orionModel [
	"Answers the model containing the current entity"
	^ self privateState model
]

{ #category : #accessing }
TFAMIXParameterizableClass >> orionModel: aModel [
	"Answers the model containing the current entity"
	^ self mooseModel: aModel
]

{ #category : #accessing }
TFAMIXParameterizableClass >> outgoingReferences [
	^ self outgoingReferencesOR: self currentContext
]

{ #category : #accessing }
TFAMIXParameterizableClass >> outgoingReferencesOR: aVersion [
	^ self privateOutgoingReferences versionIn: aVersion
]

{ #category : #accessing }
TFAMIXParameterizableClass >> parameterizedTypes [
	^ self parameterizedTypesOR: self currentContext
]

{ #category : #accessing }
TFAMIXParameterizableClass >> parameterizedTypesOR: aVersion [
	^ self privateParameterizedTypes versionIn: aVersion
]

{ #category : #accessing }
TFAMIXParameterizableClass >> parentPackage [
	^ self parentPackageOR: self currentContext
]

{ #category : #accessing }
TFAMIXParameterizableClass >> parentPackageOR: aVersion [
	^ self privateParentPackage versionIn: aVersion
]

{ #category : #accessing }
TFAMIXParameterizableClass >> receivingInvocations [
	^ self receivingInvocationsOR: self currentContext
]

{ #category : #accessing }
TFAMIXParameterizableClass >> receivingInvocationsOR: aVersion [
	^ self privateReceivingInvocations versionIn: aVersion
]

{ #category : #accessing }
TFAMIXParameterizableClass >> sourceAnchor [
	^ self sourceAnchorOR: self currentContext
]

{ #category : #accessing }
TFAMIXParameterizableClass >> sourceAnchorOR: aVersion [
	^ self privateSourceAnchor versionIn: aVersion
]

{ #category : #accessing }
TFAMIXParameterizableClass >> stateBetween: anOrionModel and: anotherOrionModel [

	(self isCreatedBetween: anOrionModel and: anotherOrionModel) ifTrue:[^#isCreated].
	(self isModifiedBetween: anOrionModel and: anotherOrionModel) ifTrue:[^#isModified].
	(self isRemovedBetween: anOrionModel and: anotherOrionModel) ifTrue:[^#isRemoved].
	^#notChanged
	
]

{ #category : #accessing }
TFAMIXParameterizableClass >> stateIn: anOrionModel [

	(self isCreatedIn: anOrionModel) ifTrue:[^#isCreated].
	(self isModifiedIn: anOrionModel) ifTrue:[^#isModified].
	(self isRemovedIn: anOrionModel) ifTrue:[^#isRemoved].
	^#notChanged
	
]

{ #category : #accessing }
TFAMIXParameterizableClass >> structuresWithDeclaredType [
	^ self structuresWithDeclaredTypeOR: self currentContext
]

{ #category : #accessing }
TFAMIXParameterizableClass >> structuresWithDeclaredTypeOR: aVersion [
	^ self privateStructuresWithDeclaredType versionIn: aVersion
]

{ #category : #accessing }
TFAMIXParameterizableClass >> subInheritances [
	^ self subInheritancesOR: self currentContext
]

{ #category : #accessing }
TFAMIXParameterizableClass >> subInheritancesOR: aVersion [
	^ self privateSubInheritances versionIn: aVersion
]

{ #category : #accessing }
TFAMIXParameterizableClass >> superInheritances [
	^ self superInheritancesOR: self currentContext
]

{ #category : #accessing }
TFAMIXParameterizableClass >> superInheritancesOR: aVersion [
	^ self privateSuperInheritances versionIn: aVersion
]

{ #category : #accessing }
TFAMIXParameterizableClass >> types [
	^ self typesOR: self currentContext
]

{ #category : #accessing }
TFAMIXParameterizableClass >> typesOR: aVersion [
	^ self privateTypes versionIn: aVersion
]
