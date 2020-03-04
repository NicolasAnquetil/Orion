"
A TFAMIXEnum is a generated trait useful to Orion. All the methods are also generated from the instance variables of the corresponding famix class. The use links between the Orion traits follow the hierarchy of the Famix classes. 
"
Trait {
	#name : #TFAMIXEnum,
	#traits : 'TFAMIXType',
	#classTraits : 'TFAMIXType classTrait',
	#category : 'OrionFamixJava-Trait'
}

{ #category : #'as yet unclassified' }
TFAMIXEnum classSide >> isOrionClass [
	^ true
]

{ #category : #accessing }
TFAMIXEnum >> addAnnotationInstanceOfType: anAnnotationTypeName inModel: aModelVersion [
	^ anAnnotationTypeName
		ifNotNil: [ (ORActionAddAnnotationInstance new
				orionModel: aModelVersion;
				container: self;
				type: anAnnotationTypeName)
				manualRun;
				postRun ]
]

{ #category : #adding }
TFAMIXEnum >> addClassNamed: aString inModel: aModelVersion [
	^ self addClassNamed: aString isStub: false inModel: aModelVersion
]

{ #category : #adding }
TFAMIXEnum >> addClassNamed: aString isStub: aBoolean inModel: aModelVersion [
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
TFAMIXEnum >> addClassNamed: aString isStub: aBoolean withNamespace: aNamespace inModel: aModelVersion [
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
TFAMIXEnum >> addClassNamed: aString withNamespace: aNamespace inModel: aModelVersion [
	^aString
		ifNotNil: [ 
			(ORActionAddClass new
				orionModel: aModelVersion;
				parent: self;
				container: aNamespace;
				newName: aString) manualRun; postRun ]
]

{ #category : #adding }
TFAMIXEnum >> addInheritanceTo: superclass inModel: anORModel [
	^ (ORActionAddInheritance new
		orionModel: anORModel;
		from: self;
		to: superclass)
		manualRun;
		postRun
]

{ #category : #adding }
TFAMIXEnum >> addStubClassNamed: aString inModel: aModelVersion [
	^ self addClassNamed: aString isStub: true inModel: aModelVersion
]

{ #category : #accessing }
TFAMIXEnum >> annotationInstances [
	^ self annotationInstancesOR: self currentContext
]

{ #category : #accessing }
TFAMIXEnum >> annotationInstancesOR: aVersion [
	^ self privateAnnotationInstances versionIn: aVersion
]

{ #category : #accessing }
TFAMIXEnum >> attributes [
	^ self attributesOR: self currentContext
]

{ #category : #accessing }
TFAMIXEnum >> attributesOR: aVersion [
	^ self privateAttributes versionIn: aVersion
]

{ #category : #accessing }
TFAMIXEnum >> behavioursWithDeclaredType [
	^ self behavioursWithDeclaredTypeOR: self currentContext
]

{ #category : #accessing }
TFAMIXEnum >> behavioursWithDeclaredTypeOR: aVersion [
	^ self privateBehavioursWithDeclaredType versionIn: aVersion
]

{ #category : #accessing }
TFAMIXEnum >> comments [
	^ self commentsOR: self currentContext
]

{ #category : #accessing }
TFAMIXEnum >> commentsOR: aVersion [
	^ self privateComments versionIn: aVersion
]

{ #category : #accessing }
TFAMIXEnum >> container [
	^ self containerOR: self currentContext
]

{ #category : #accessing }
TFAMIXEnum >> containerOR: aVersion [
	^ self privateContainer versionIn: aVersion
]

{ #category : #accessing }
TFAMIXEnum >> currentContext [
	"Answers the model containing the current entity"
	^ self privateState currentContext
]

{ #category : #accessing }
TFAMIXEnum >> currentContext: aVersion [
	"Answers the model containing the current entity"
	^ self privateState currentContext: aVersion
]

{ #category : #accessing }
TFAMIXEnum >> declaredSourceLanguage [
	^ self declaredSourceLanguageOR: self currentContext
]

{ #category : #accessing }
TFAMIXEnum >> declaredSourceLanguageOR: aVersion [
	^ self privateDeclaredSourceLanguage versionIn: aVersion
]

{ #category : #'initialize-release-ok' }
TFAMIXEnum >> defaultStateClass [ 
	"Answer the default implementator of this element's state."
	^ORDefaultState
]

{ #category : #accessing }
TFAMIXEnum >> famixClass [
	"All Orion classes are direct subclasses of their Famix counterpart"
	^ super famixClass superclass
]

{ #category : #accessing }
TFAMIXEnum >> functions [
	^ self functionsOR: self currentContext
]

{ #category : #accessing }
TFAMIXEnum >> functionsOR: aVersion [
	^ self privateFunctions versionIn: aVersion
]

{ #category : #accessing }
TFAMIXEnum >> incomingReferences [
	^ self incomingReferencesOR: self currentContext
]

{ #category : #accessing }
TFAMIXEnum >> incomingReferencesOR: aVersion [
	^ self privateIncomingReferences versionIn: aVersion
]

{ #category : #testing }
TFAMIXEnum >> isCreatedBetween: anOrionModel and: anotherOrionModel [
		
		^(anOrionModel entityStorage atID: self mooseID ifAbsent:[nil]) isNil
			and:[(anotherOrionModel entityStorage atID: self mooseID ifAbsent:[nil]) notNil].
		
]

{ #category : #testing }
TFAMIXEnum >> isCreatedIn: anOrionModel [
		|parent|
		parent := anOrionModel parentModel.
		parent isNil 
			ifTrue:[^true]
			ifFalse:[
				^(parent entityStorage atID: self mooseID ifAbsent:[nil]) isNil.
			]
]

{ #category : #testing }
TFAMIXEnum >> isModifiedBetween: anOrionModel and: anotherOrionModel [
		|old new|
		old := anOrionModel entityStorage atID: self mooseID ifAbsent:[^false].
		new := anotherOrionModel entityStorage atID: self mooseID ifAbsent:[^false].
		
		^old mooseModel ~~ new mooseModel.
]

{ #category : #testing }
TFAMIXEnum >> isModifiedIn: anOrionModel [
		|parent|
		parent := anOrionModel parentModel.
		parent isNil 
			ifTrue:[^false]
			ifFalse:[
				^(parent entityStorage atID: self mooseID ifAbsent:[nil]) isNil.
			]
]

{ #category : #testing }
TFAMIXEnum >> isOrionEntity [
	^ true
]

{ #category : #testing }
TFAMIXEnum >> isRemovedBetween: anOrionModel and: anotherOrionModel [
		
		^(anOrionModel entityStorage atID: self mooseID ifAbsent:[nil]) notNil
			and:[(anotherOrionModel entityStorage atID: self mooseID ifAbsent:[nil]) isNil].
]

{ #category : #testing }
TFAMIXEnum >> isRemovedIn: anOrionModel [
		|parent|
		parent := anOrionModel parentModel.
		parent ifNil:[
			^(anOrionModel entityStorage atID: self mooseID ifAbsent:[nil]) isNil
		].
		^(parent entityStorage atID: self mooseID ifAbsent:[nil]) notNil
			and:[(anOrionModel entityStorage atID: self mooseID ifAbsent:[nil]) isNil].
]

{ #category : #testing }
TFAMIXEnum >> isStub [
	^ self isStubOR: self currentContext
]

{ #category : #testing }
TFAMIXEnum >> isStubOR: aVersion [
	^ self privateIsStub versionIn: aVersion
]

{ #category : #accessing }
TFAMIXEnum >> methods [
	^ self methodsOR: self currentContext
]

{ #category : #accessing }
TFAMIXEnum >> methodsOR: aVersion [
	^ self privateMethods versionIn: aVersion
]

{ #category : #accessing }
TFAMIXEnum >> modifiers [
	^ self modifiersOR: self currentContext
]

{ #category : #accessing }
TFAMIXEnum >> modifiersOR: aVersion [
	^ self privateModifiers versionIn: aVersion
]

{ #category : #accessing }
TFAMIXEnum >> name [
	^ self nameOR: self currentContext
]

{ #category : #accessing }
TFAMIXEnum >> nameOR: aVersion [
	^ self privateName versionIn: aVersion
]

{ #category : #accessing }
TFAMIXEnum >> orionID [
	^ self mooseID
]

{ #category : #accessing }
TFAMIXEnum >> orionModel [
	"Answers the model containing the current entity"
	^ self privateState model
]

{ #category : #accessing }
TFAMIXEnum >> orionModel: aModel [
	"Answers the model containing the current entity"
	^ self mooseModel: aModel
]

{ #category : #accessing }
TFAMIXEnum >> outgoingReferences [
	^ self outgoingReferencesOR: self currentContext
]

{ #category : #accessing }
TFAMIXEnum >> outgoingReferencesOR: aVersion [
	^ self privateOutgoingReferences versionIn: aVersion
]

{ #category : #accessing }
TFAMIXEnum >> parentPackage [
	^ self parentPackageOR: self currentContext
]

{ #category : #accessing }
TFAMIXEnum >> parentPackageOR: aVersion [
	^ self privateParentPackage versionIn: aVersion
]

{ #category : #accessing }
TFAMIXEnum >> receivingInvocations [
	^ self receivingInvocationsOR: self currentContext
]

{ #category : #accessing }
TFAMIXEnum >> receivingInvocationsOR: aVersion [
	^ self privateReceivingInvocations versionIn: aVersion
]

{ #category : #accessing }
TFAMIXEnum >> sourceAnchor [
	^ self sourceAnchorOR: self currentContext
]

{ #category : #accessing }
TFAMIXEnum >> sourceAnchorOR: aVersion [
	^ self privateSourceAnchor versionIn: aVersion
]

{ #category : #accessing }
TFAMIXEnum >> stateBetween: anOrionModel and: anotherOrionModel [

	(self isCreatedBetween: anOrionModel and: anotherOrionModel) ifTrue:[^#isCreated].
	(self isModifiedBetween: anOrionModel and: anotherOrionModel) ifTrue:[^#isModified].
	(self isRemovedBetween: anOrionModel and: anotherOrionModel) ifTrue:[^#isRemoved].
	^#notChanged
	
]

{ #category : #accessing }
TFAMIXEnum >> stateIn: anOrionModel [

	(self isCreatedIn: anOrionModel) ifTrue:[^#isCreated].
	(self isModifiedIn: anOrionModel) ifTrue:[^#isModified].
	(self isRemovedIn: anOrionModel) ifTrue:[^#isRemoved].
	^#notChanged
	
]

{ #category : #accessing }
TFAMIXEnum >> structuresWithDeclaredType [
	^ self structuresWithDeclaredTypeOR: self currentContext
]

{ #category : #accessing }
TFAMIXEnum >> structuresWithDeclaredTypeOR: aVersion [
	^ self privateStructuresWithDeclaredType versionIn: aVersion
]

{ #category : #accessing }
TFAMIXEnum >> subInheritances [
	^ self subInheritancesOR: self currentContext
]

{ #category : #accessing }
TFAMIXEnum >> subInheritancesOR: aVersion [
	^ self privateSubInheritances versionIn: aVersion
]

{ #category : #accessing }
TFAMIXEnum >> superInheritances [
	^ self superInheritancesOR: self currentContext
]

{ #category : #accessing }
TFAMIXEnum >> superInheritancesOR: aVersion [
	^ self privateSuperInheritances versionIn: aVersion
]

{ #category : #accessing }
TFAMIXEnum >> types [
	^ self typesOR: self currentContext
]

{ #category : #accessing }
TFAMIXEnum >> typesOR: aVersion [
	^ self privateTypes versionIn: aVersion
]

{ #category : #accessing }
TFAMIXEnum >> values [
	^ self valuesOR: self currentContext
]

{ #category : #accessing }
TFAMIXEnum >> valuesOR: aVersion [
	^ self privateValues versionIn: aVersion
]
