"
Please comment me using the following template inspired by Class Responsibility Collaborator (CRC) design:
 
For the Class part:  State a one line summary. For example, ""I represent a paragraph of text"".

For the Responsibility part: Three sentences about my main responsibilities - what I do, what I know.

For the Collaborators Part: State my main collaborators and one line about how I interact with them. 

Public API and Key Messages

- message one   
- message two 
- (for bonus points) how to create instances.

   One simple example is simply gorgeous.
 
Internal Representation and Key Implementation Points.


    Implementation Points
"
Trait {
	#name : #TOrionMergeTest,
	#category : 'Orion-Merge-Tests'
}

{ #category : #'tests-create' }
TOrionMergeTest >> testAddAllFromStModel [

	self model1: MooseModel new.
	self model1 name: 'baseEmpty'.
	self modelMerger: (FXDiff baseModel: self model1 convertToOrion targetModel: self model2 diffTransformers: {OrionMergeWithVisitor}).
	self modelMerger run.
	self assert: self modelMerger baseModel system orionModels size equals: 2
]

{ #category : #'tests-create' }
TOrionMergeTest >> testAddAndDiffAllFromStModel [
	<expectedFailure>
	| modelDiff res |
	self model1: MooseModel new.
	self model1 name: 'baseEmpty'.
	self modelMerger: (FXDiff baseModel: self model1 convertToOrion targetModel: self model2 diffTransformers: {OrionMergeWithVisitor}).
	self modelMerger run.
	self assert: self modelMerger baseModel system orionModels size equals: 2.
	modelDiff := FXDiff baseModel: self modelMerger baseModel system orionModels second targetModel: self model2 diffTransformers: {}.
	res := modelDiff run result.
	self assert: res isEmpty.
	
]

{ #category : #'as yet unclassified' }
TOrionMergeTest >> testCreateAddAccess [
	| var2 access |
	var2 := self modelMerger targetModel entityNamed: 'Smalltalk::A3diff.att1'.
	access := FAMIXAccess new
		variable: var2;
		accessor: (self modelMerger targetModel entityNamed: 'Smalltalk::A3diff.b3()').
	self modelMerger targetModel add: access.
	self assert: (self modelMerger baseModel entityNamed: 'Smalltalk::A3diff.att1') incomingAccesses isEmpty.
	"self modelMerger run.
	self modelMerger orionVersionedModel: self modelMerger baseModel createNewChildVersion.
	self mooseModelMerge createAddAccess."
	self diff.
	self assert: (self modelMerger baseModel entityNamed: 'Smalltalk::A3diff.att1') incomingAccesses size equals: 0.
	self
		assert: (self modelMerger orionVersionedModel entityNamed: 'Smalltalk::A3diff.att1') incomingAccesses first accessor
		equals: (self modelMerger orionVersionedModel entityNamed: 'Smalltalk::A3diff.b3()')
]

{ #category : #'tests-create' }
TOrionMergeTest >> testCreateAddAnnotation [
	| method annotationType |
	method := self modelMerger targetModel entityNamed: 'Smalltalk::A3diff.c3()'.
	annotationType := FAMIXAnnotationType named: 'newAnnotationType'.
	self modelMerger targetModel add: annotationType.
	self modelMerger targetModel
		add:
			(FAMIXAnnotationInstance new
				annotatedEntity: method;
				annotationType: annotationType;
				yourself).
	self diff.
	self assert: (self modelMerger baseModel entityNamed: 'Smalltalk::A3diff.c3()') annotationInstances size equals: 0.
	self assert: (self modelMerger orionVersionedModel entityNamed: 'Smalltalk::A3diff.c3()') annotationInstances size equals: 1
]

{ #category : #'tests-create' }
TOrionMergeTest >> testCreateAddAttribute [
	| diff |
	(self modelMerger targetModel entityNamed: 'Smalltalk::A3diff') addAttributeNamed: 'attAdded' inModel: self modelMerger targetModel.
	diff := self diff.
	self assert: (self modelMerger baseModel entityNamed: 'Smalltalk::A3diff.attAdded') isNil.
	self assert: (self modelMerger orionVersionedModel entityNamed: 'Smalltalk::A3diff.attAdded') isNotNil.
]

{ #category : #'tests-create' }
TOrionMergeTest >> testCreateAddInvocation [
	| meth |
	meth := self modelMerger targetModel
		entityNamed: 'Smalltalk::A3diff.b3()'.
	FAMIXInvocation new
		sender: meth;
		receiver: (self modelMerger targetModel entityNamed: 'Smalltalk::B3diff');
		candidates:
			(self modelMerger targetModel entityNamed: 'Smalltalk::B3diff.c3()')
				asOrderedCollection.
	self diff.
	self
		assert:
			(self modelMerger baseModel entityNamed: 'Smalltalk::A3diff.b3()')
				outgoingInvocations size
		equals: 1.
	self
		assert:
			(self modelMerger orionVersionedModel
				entityNamed: 'Smalltalk::A3diff.b3()') outgoingInvocations size
		equals: 3
]

{ #category : #'tests-create' }
TOrionMergeTest >> testCreateAddMethod [
	| meth |
	meth := FAMIXMethod new
		name: 'toto';
		yourself.
	self modelMerger targetModel add: meth.
	(self modelMerger targetModel entityNamed: 'Smalltalk::A3diff') addMethod: meth.
	self diff.
	self assert: (self modelMerger baseModel entityNamed: 'Smalltalk::A3diff.toto') isNil.
	self assert: (self modelMerger orionVersionedModel entityNamed: 'Smalltalk::A3diff.toto') notNil.
]

{ #category : #'tests-create' }
TOrionMergeTest >> testCreateAddReference [
	| meth |
	meth := self modelMerger targetModel
		entityNamed: 'Smalltalk::A3diff.b3()'.
	FAMIXReference new
		source: meth;
		target: (self modelMerger targetModel entityNamed: 'Smalltalk::B2diff').
	self diff.
	self
		assert:
			(self modelMerger baseModel entityNamed: 'Smalltalk::A3diff.b3()')
				outgoingReferences size
		equals: 1.
	self
		assert:
			(self modelMerger orionVersionedModel
				entityNamed: 'Smalltalk::A3diff.b3()') outgoingReferences size
		equals: 2
]

{ #category : #'tests-create' }
TOrionMergeTest >> testCreateAddScopingEntity [
	self diff.
	self
		assert:
			(self modelMerger baseModel
				entityNamed: 'Moose-TestResources-ModelDiff-P2') isNil.
	self
		assert:
			(self modelMerger orionVersionedModel
				entityNamed: 'Moose-TestResources-ModelDiff-P2') notNil
]

{ #category : #'tests-create' }
TOrionMergeTest >> testCreateAddType [
	self diff.
	self
		assert: (self modelMerger baseModel entityNamed: 'Smalltalk::A2diff') isNil.
	self
		assert:
			(self modelMerger orionVersionedModel entityNamed: 'Smalltalk::A2diff')
				notNil
]

{ #category : #'tests-create' }
TOrionMergeTest >> testCreateMoveAttribute [
	| att |
	"In order to determine that an attribute has moved it needs to get at least 3 accesses to it"
	"creation of the attribute and the 3 accesses in the source model"
	att := FAMIXAttribute new
		name: 'attAdded';
		yourself.
	self modelMerger targetModel add: att.
	(self modelMerger targetModel entityNamed: 'Smalltalk::A3diff') addAttribute: att.
	FAMIXAccess new
		variable: att;
		accessor: (self modelMerger targetModel entityNamed: 'Smalltalk::A3diff.b3()').
	FAMIXAccess new
		variable: att;
		accessor: (self modelMerger targetModel entityNamed: 'Smalltalk::A3diff.c3()').
	FAMIXAccess new
		variable: att;
		accessor: (self modelMerger targetModel entityNamed: 'Smalltalk::B3diff.c3()').

	"creation of the attribute and the 3 accesses in the target model"
	(self modelMerger baseModel entityNamed: 'Smalltalk::A4diff') addAttributeNamed: 'attAdded' inModel: self modelMerger baseModel.
	(self modelMerger baseModel entityNamed: 'Smalltalk::A3diff.b3()') addAccessTo: (self modelMerger baseModel entityNamed: 'Smalltalk::A4diff.attAdded') inModel: self modelMerger baseModel.
	(self modelMerger baseModel entityNamed: 'Smalltalk::A3diff.c3()') addAccessTo: (self modelMerger baseModel entityNamed: 'Smalltalk::A4diff.attAdded') inModel: self modelMerger baseModel.
	(self modelMerger baseModel entityNamed: 'Smalltalk::B3diff.c3()') addAccessTo: (self modelMerger baseModel entityNamed: 'Smalltalk::A4diff.attAdded') inModel: self modelMerger baseModel.
	self diff.
	self assert: (self modelMerger baseModel entityNamed: 'Smalltalk::A4diff.attAdded') notNil.
	self assert: (self modelMerger baseModel entityNamed: 'Smalltalk::A3diff.attAdded') isNil.
	self assert: (self modelMerger orionVersionedModel entityNamed: 'Smalltalk::A3diff.attAdded') notNil.
	self assert: (self modelMerger baseModel entityNamed: 'Smalltalk::A4diff.attAdded') belongsTo mooseName equals: 'Smalltalk::A4diff'.
	self assert: (self modelMerger orionVersionedModel entityNamed: 'Smalltalk::A3diff.attAdded') belongsTo mooseName equals: 'Smalltalk::A3diff'.
	self assert: self modelMerger orionVersionedModel changes size equals: 1
]

{ #category : #'tests-create' }
TOrionMergeTest >> testCreateMoveClass [
	"moving A3 into P2"

	(self modelMerger targetModel entityNamed: 'Smalltalk::A3diff')
		parentPackage:
			(self modelMerger targetModel
				entityNamed: 'Moose-TestResources-ModelDiff-P2').
	self diff.
	self
		assert: (self modelMerger baseModel entityNamed: 'Smalltalk::A3diff') notNil.
	self
		assert:
			(self modelMerger baseModel entityNamed: 'Smalltalk::A3diff')
				parentPackage name
		equals: 'Moose-TestResources-ModelDiff-P3'.
	self
		assert:
			(self modelMerger orionVersionedModel entityNamed: 'Smalltalk::A3diff')
				notNil.
	self
		assert:
			(self modelMerger orionVersionedModel entityNamed: 'Smalltalk::A3diff')
				parentPackage name
		equals: 'Moose-TestResources-ModelDiff-P2'
]

{ #category : #'tests-create' }
TOrionMergeTest >> testCreateMoveExtendedMethod [
	| orAction meth extendedMeth |
	(self modelMerger baseModel entityNamed: 'Smalltalk::A3diff') addMethodNamed: 'extendedMeth' inModel: self modelMerger baseModel.
	extendedMeth := self modelMerger baseModel entityNamed: 'Smalltalk::A3diff.extendedMeth'.
	orAction := ORActionMoveMethod new
		orionModel: self modelMerger baseModel;
		entity: extendedMeth;
		parentPackage: (self modelMerger baseModel entityNamed: #'Moose-TestResources-ModelDiff-P4').
	orAction run.
	self assert: extendedMeth isNotNil.
	self assert: extendedMeth parentPackage mooseName equals: 'Moose-TestResources-ModelDiff-P4'.
	extendedMeth addAccessToVarNamed: 'Smalltalk::A3diff.att1' inModel: self modelMerger baseModel.
	extendedMeth addAccessToVarNamed: 'Smalltalk::A3diff.att2' inModel: self modelMerger baseModel.
	extendedMeth addAccessToVarNamed: 'Smalltalk::B3diff.att1' inModel: self modelMerger baseModel.
	extendedMeth addAccessToVarNamed: 'Smalltalk::B3diff.att2' inModel: self modelMerger baseModel.
	(self modelMerger targetModel entityNamed: 'Smalltalk::A3diff') addMethodNamed: 'extendedMeth' inModel: self modelMerger targetModel.
	meth := self modelMerger targetModel entityNamed: 'Smalltalk::A3diff.extendedMeth'.
	meth addAccessToVarNamed: 'Smalltalk::A3diff.att1' inModel: self modelMerger targetModel.
	meth addAccessToVarNamed: 'Smalltalk::A3diff.att2' inModel: self modelMerger targetModel.
	meth addAccessToVarNamed: 'Smalltalk::B3diff.att1' inModel: self modelMerger targetModel.
	meth addAccessToVarNamed: 'Smalltalk::B3diff.att2' inModel: self modelMerger targetModel.
	meth parentPackage: (self modelMerger targetModel entityNamed: 'Moose-TestResources-ModelDiff-P2').
	"	Halt now."
	self diff.
	"self modelMerger orionVersionedModel: self modelMerger baseModel createNewChildVersion.
	self mooseModelMerge createAddScopingEntity.
	self mooseModelMerge createAddType.
	self mooseModelMerge createAddMethod.
	self mooseModelMerge createMoveMethod."
	self assert: (self modelMerger orionVersionedModel entityNamed: 'Smalltalk::A3diff.extendedMeth()') notNil.
	self
		assert: (self modelMerger orionVersionedModel entityNamed: 'Smalltalk::A3diff.extendedMeth()') parentPackage mooseName
		equals: 'Moose-TestResources-ModelDiff-P2'
]

{ #category : #'tests-create' }
TOrionMergeTest >> testCreateMoveMethod [

	(self modelMerger targetModel entityNamed: 'Smalltalk::A3diff.c3()') parentType: (self modelMerger  targetModel entityNamed: 'Smalltalk::C3diff').

	self modelMerger orionVersionedModel: (self modelMerger baseModel createNewChildVersion).
	self diff.
	"self mooseModelMerge createMoveMethod."
	
	
	self assert: (self modelMerger baseModel entityNamed: 'Smalltalk::A3diff.c3()') isNotNil.
	self assert: (self modelMerger orionVersionedModel entityNamed: 'Smalltalk::C3diff.c3') isNotNil.
	self assert: (self modelMerger baseModel entityNamed: 'Smalltalk::A3diff.c3()') belongsTo mooseName equals:  'Smalltalk::A3diff'.
	self assert: (self modelMerger orionVersionedModel entityNamed: 'Smalltalk::C3diff.c3()') belongsTo mooseName equals:  'Smalltalk::C3diff'.
	self assert: self modelMerger orionVersionedModel changes size equals: 1.

	

	
]

{ #category : #'tests-create' }
TOrionMergeTest >> testCreateRemove [
	
	self diff.
	"self modelMerger orionVersionedModel: (self modelMerger baseModel createNewChildVersion).
	self mooseModelMerge createRemove."
	
	self assert: (self modelMerger baseModel entityNamed: 'Smalltalk::A4diff.b3()') isNotNil.
	self assert: (self modelMerger orionVersionedModel entityNamed: 'Smalltalk::A4diff.b3()') isNil.
	self assert: (self modelMerger baseModel entityNamed: 'Smalltalk::A4diff') isNotNil.
	self assert: (self modelMerger orionVersionedModel entityNamed: 'Smalltalk::A4diff') isNil.

	
]

{ #category : #'tests-create' }
TOrionMergeTest >> testCreateRemoveAccess [
	| var1 |
	var1 := self modelMerger baseModel entityNamed: 'Smalltalk::A3diff.att1'.
	ORActionAddAccess new
		orionModel: self modelMerger baseModel;
		accessor: (self modelMerger baseModel entityNamed: 'Smalltalk::A3diff.b3()');
		variable: var1;
		run.
		self diff.
	self assert: (self modelMerger baseModel entityNamed: 'Smalltalk::A3diff.att1') incomingAccesses notEmpty.
	self assert: (self modelMerger orionVersionedModel entityNamed: 'Smalltalk::A3diff.att1') incomingAccesses isEmpty
]

{ #category : #'tests-create' }
TOrionMergeTest >> testCreateRemoveAnnotation [
	| method annotationType annotationsInstancesBaseModel |
	method := self modelMerger baseModel
		entityNamed: 'Smalltalk::A3diff.c3()'.
	annotationType := (ORActionAddAnnotationType new
		orionModel: self modelMerger baseModel;
		container: method;
		name: 'newAnnotationType') run.
	(ORActionAddAnnotationInstance new
		orionModel: self modelMerger baseModel;
		annotatedEntity: method;
		annotationType: 'newAnnotationType') run.
		self diff.
	annotationsInstancesBaseModel := (self modelMerger baseModel
		entityNamed: 'Smalltalk::A3diff.c3()') annotationInstances.
	self assert: annotationsInstancesBaseModel size equals: 1.
	self
		assert: annotationsInstancesBaseModel first annotatedEntity isNotNil.
	self
		assert: annotationsInstancesBaseModel first annotatedEntity name
		equals: 'c3'.
	self
		assert: annotationsInstancesBaseModel first annotationType name
		equals: 'newAnnotationType'.
	self
		assert:
			(self modelMerger orionVersionedModel
				entityNamed: 'Smalltalk::A3diff.c3()') annotationInstances isEmpty
]

{ #category : #'tests-create' }
TOrionMergeTest >> testCreateRemoveAttribute [
	(self modelMerger baseModel entityNamed: 'Smalltalk::A4diff') addAttributeNamed: 'toto' inModel: self modelMerger baseModel.
	self diff.
	self assert: (self modelMerger baseModel entityNamed: 'Smalltalk::A4diff.toto') isNotNil.
	self assert: (self modelMerger orionVersionedModel entityNamed: 'Smalltalk::A4diff.toto') isNil.

]

{ #category : #'tests-create' }
TOrionMergeTest >> testCreateRemoveInvocation [
	| var1 cand |
	var1 := self modelMerger baseModel
		entityNamed: 'Smalltalk::A3diff.b3()'.
	cand := {(self modelMerger baseModel
		entityNamed: 'Smalltalk::A3diff.c3()').
	(self modelMerger baseModel entityNamed: 'Smalltalk::B3diff.c3()')}
		asOrderedCollection.
	ORActionAddInvocation new
		orionModel: self modelMerger baseModel;
		sender: var1;
		candidates: cand;
		run.
	self diff.
	self
		assert:
			(self modelMerger baseModel entityNamed: 'Smalltalk::A3diff.b3()')
				outgoingInvocations isNotEmpty.
	self
		assert:
			(self modelMerger orionVersionedModel
				entityNamed: 'Smalltalk::A3diff.b3()') outgoingInvocations isEmpty
]

{ #category : #'tests-create' }
TOrionMergeTest >> testCreateRemoveMethod [
	self diff.
	self assert: (self modelMerger baseModel entityNamed: 'Smalltalk::A4diff.b3()') isNotNil.
	self assert: (self modelMerger orionVersionedModel entityNamed: 'Smalltalk::A4diff.b3()') isNil
]

{ #category : #'tests-create' }
TOrionMergeTest >> testCreateRemoveReference [
	| var1 |
	var1 := self modelMerger baseModel entityNamed: 'Smalltalk::A3diff.b3()'.
	ORActionAddReference new
		orionModel: self modelMerger baseModel;
		source: var1;
		target: (self modelMerger baseModel entityNamed: 'Smalltalk::A4diff');
		run.
	self diff.
	self modelMerger orionVersionedModel: self modelMerger baseModel createNewChildVersion.
	"self mooseModelMerge createAddScopingEntity.
	self mooseModelMerge createAddType.
	self mooseModelMerge createAddMethod.
	self mooseModelMerge createRemoveReference."
	self
		assert:
			((self modelMerger baseModel entityNamed: 'Smalltalk::A3diff.b3()') outgoingReferences select: [ :ref | ref target mooseID = (self modelMerger baseModel entityNamed: 'Smalltalk::A4diff') mooseID ])
				isNotEmpty.
	self
		assert:
			((self modelMerger orionVersionedModel entityNamed: 'Smalltalk::A3diff.b3()') outgoingReferences
				select: [ :ref | ref target mooseID = (self modelMerger orionVersionedModel entityNamed: 'Smalltalk::A4diff') mooseID ]) isEmpty
]

{ #category : #'tests-expected failures' }
TOrionMergeTest >> testCreateRename [
	(self modelMerger targetModel entityNamed: 'Smalltalk::B3diff') name: 'X3diff'.
	(self modelMerger targetModel entityNamed: 'Smalltalk::A3diff.c3()') name: 'd3()'.
	self diff.
	self assert: (self modelMerger baseModel entityNamed: 'Smalltalk::A3diff.c3()') notNil.
	self assert: (self modelMerger orionVersionedModel entityNamed: 'Smalltalk::A3diff.c3()') name equals: 'd3()'.
	self assert: (self modelMerger baseModel entityNamed: 'Smalltalk::B3diff') notNil.
	self assert: (self modelMerger orionVersionedModel entityNamed: 'Smalltalk::X3diff') notNil.

]

{ #category : #'tests-create' }
TOrionMergeTest >> testCreateRenameAttribute [
	(self modelMerger baseModel entityNamed: 'Smalltalk::A3diff.b3()') addAccessToVarNamed: 'Smalltalk::A3diff.att1' inModel: self modelMerger baseModel.
	(self modelMerger baseModel entityNamed: 'Smalltalk::A3diff.c3()') addAccessToVarNamed: 'Smalltalk::A3diff.att1' inModel: self modelMerger baseModel.
	(self modelMerger baseModel entityNamed: 'Smalltalk::B3diff.c3()') addAccessToVarNamed: 'Smalltalk::A3diff.att1' inModel: self modelMerger baseModel.
	(self modelMerger targetModel entityNamed: 'Smalltalk::A3diff.b3()') addAccessToVarNamed: 'Smalltalk::A3diff.att1' inModel: self modelMerger targetModel.
	(self modelMerger targetModel entityNamed: 'Smalltalk::A3diff.c3()') addAccessToVarNamed: 'Smalltalk::A3diff.att1' inModel: self modelMerger targetModel.
	(self modelMerger targetModel entityNamed: 'Smalltalk::B3diff.c3()') addAccessToVarNamed: 'Smalltalk::A3diff.att1' inModel: self modelMerger targetModel.
	(self modelMerger targetModel entityNamed: 'Smalltalk::A3diff.att1') name: 'toto'.
	self diff.
	"self modelMerger orionVersionedModel: self modelMerger baseModel createNewChildVersion.
	self mooseModelMerge createRenameAttribute."
	self assert: (self modelMerger baseModel entityNamed: 'Smalltalk::A3diff.att1') isNotNil.
	self assert: (self modelMerger orionVersionedModel entityNamed: 'Smalltalk::A3diff.toto') isNotNil.
]

{ #category : #'tests-create' }
TOrionMergeTest >> testCreateRenameClass [
	(self modelMerger targetModel entityNamed: 'Smalltalk::A3diff') name: 'X3diff'.
	self diff.
	self assert: (self modelMerger baseModel entityNamed: 'Smalltalk::A3diff') notNil.
	self assert: (self modelMerger orionVersionedModel entityNamed: 'Smalltalk::X3diff') isNotNil.

]

{ #category : #'tests-expected failures' }
TOrionMergeTest >> testCreateRenameMethod [
	<expectedFailure>
	(self modelMerger targetModel entityNamed: 'Smalltalk::A3diff.c3()') name: 'd3()'.
	self diff.
	self assert: (self modelMerger baseModel entityNamed: 'Smalltalk::A3diff.c3()') isNotNil.
	self assert: (self modelMerger orionVersionedModel entityNamed: 'Smalltalk::A3diff.c3()') name equals: 'd3()'.
]

{ #category : #'tests-expected failures' }
TOrionMergeTest >> testCreateRenamePackage [
	(self modelMerger targetModel entityNamed: 'Moose-TestResources-ModelDiff-P3') name: 'totoPackage'.
	self diff.
	self assert: (self modelMerger baseModel entityNamed: 'Moose-TestResources-ModelDiff-P3') isNotNil.
	self assert: (self modelMerger orionVersionedModel entityNamed: 'Moose-TestResources-ModelDiff-P3') isNotNil.
	self assert: (self modelMerger orionVersionedModel entityNamed: 'totoPackage') isNotNil.
]

{ #category : #'tests-create' }
TOrionMergeTest >> testCreateVersion [

	self diff.
	
	self assert: self modelMerger orionVersionedModel notNil.
	
	
	
]

{ #category : #'tests-set' }
TOrionMergeTest >> testInitialize [
	self assert: self modelMerger notNil.
	self assert: self modelMerger class equals: FXDiff.
	self assert: self modelMerger notNil.
	self assert: self modelMerger diffComputer class equals: FamixDiff.
	ORSystem root isNotEmpty
		ifTrue: [ ORSystem root last orionModels first = self modelMerger baseModel
				ifTrue: [ ORSystem root remove: ORSystem root last ifAbsent: [  ] ] ]
]

{ #category : #'tests-set' }
TOrionMergeTest >> testSetOfAddAccessChanges [
	| var2 |
	var2 := self modelMerger targetModel entityNamed: 'Smalltalk::A3diff.att1'.
	FAMIXAccess new
		variable: var2;
		accessor: (self modelMerger targetModel entityNamed: 'Smalltalk::A3diff.b3()').
	self diff.
	self modelMerger orionVersionedModel: self modelMerger baseModel createNewChildVersion.
	self assert: self modelMerger result setOfAddAccessChanges isNotNil.
	self
		assert: self modelMerger result setOfAddAccessChanges size
		equals: (self diff assocChanges count: [ :e | e isAddition and: [ e entity isAccess ] ])
]

{ #category : #'tests-set' }
TOrionMergeTest >> testSetOfAddAnnotationInstanceChanges [
	| method annotationType |
	method := self modelMerger targetModel entityNamed: 'Smalltalk::A3diff.c3()'.
	annotationType := FAMIXAnnotationType named: 'newAnnotationType'.
	self modelMerger targetModel add: annotationType.
	self modelMerger targetModel
		add:
			(FAMIXAnnotationInstance new
				annotatedEntity: method;
				annotationType: annotationType;
				yourself).
	self diff.
	self modelMerger orionVersionedModel: self modelMerger baseModel createNewChildVersion.
	self assert: self modelMerger result setOfAddAnnotationInstanceChanges isNotNil.
	self assert: self modelMerger result setOfAddAnnotationInstanceChanges size equals: (self diff entityChanges count: [ :e | e isAddition and: [ e entity isAnnotationInstance ] ])
]

{ #category : #'tests-set' }
TOrionMergeTest >> testSetOfAddAnnotationTypeChanges [
	| var2 |
	self modelMerger targetModel add: (FAMIXAnnotationType named: 'newAnnotationType').
	self diff.
	self modelMerger orionVersionedModel: self modelMerger baseModel createNewChildVersion.
	self assert: self modelMerger result setOfAddAnnotationTypeChanges isNotNil.
	self
		assert: self modelMerger result setOfAddAnnotationTypeChanges size
		equals: (self diff entityChanges count: [ :e | e isAddition and: [ e entity isAnnotationType ] ])
]

{ #category : #'tests-set' }
TOrionMergeTest >> testSetOfAddAttributeChanges [
	| att |
	att := FAMIXAttribute new
		name: 'attAdded';
		yourself.
	self modelMerger targetModel add: att.
	(self modelMerger targetModel entityNamed: 'Smalltalk::A3diff') addAttribute: att.
	self diff.
	self modelMerger orionVersionedModel: self modelMerger baseModel createNewChildVersion.
	self assert: self modelMerger result setOfAddAttributeChanges isNotNil.
	self assert: self modelMerger result setOfAddAttributeChanges size equals: (self diff count: [ :e | e isAddition and: [ e entity isAttribute ] ])
]

{ #category : #'tests-set' }
TOrionMergeTest >> testSetOfAddClassChanges [
	self diff.
	self modelMerger orionVersionedModel: self modelMerger baseModel createNewChildVersion.
	self assert: self modelMerger result setOfAddClassChanges isNotNil.
	self assert: self modelMerger result setOfAddClassChanges size equals: (self diff  count: [ :e | e isAddition and: [ e entity isType ] ])
]

{ #category : #'tests-set' }
TOrionMergeTest >> testSetOfAddInvocationChanges [
	| meth |
	meth := self modelMerger targetModel entityNamed: 'Smalltalk::A3diff.b3()'.
	FAMIXInvocation new
		sender: meth;
		receiver: (self modelMerger targetModel entityNamed: 'Smalltalk::B3diff');
		signature: 'c3'.
	self diff.
	self modelMerger orionVersionedModel: self modelMerger baseModel createNewChildVersion.
	self assert: self modelMerger result setOfAddInvocationChanges isNotNil.
	self
		assert: self modelMerger result setOfAddInvocationChanges size
		equals: (self diff assocChanges count: [ :e | e isAddition and: [ e entity isInvocation ] ])
]

{ #category : #'tests-set' }
TOrionMergeTest >> testSetOfAddMethodChanges [
	| meth |
	meth := FAMIXMethod new name: 'toto'  ; yourself.
	self modelMerger targetModel add: meth.
	(self modelMerger targetModel entityNamed: 'Smalltalk::A3diff') addMethod: meth.
	self diff.
	self modelMerger orionVersionedModel: (self modelMerger baseModel createNewChildVersion).

	
	self assert: (self modelMerger result setOfAddMethodChanges) notNil.
	self assert: self modelMerger result setOfAddMethodChanges size equals: 1.

	
]

{ #category : #'tests-set' }
TOrionMergeTest >> testSetOfAddReferenceChanges [
	
	| meth  |

	meth := self modelMerger targetModel entityNamed: 'Smalltalk::A3diff.b3()'.
	FAMIXReference new source: meth ; target: (self modelMerger targetModel entityNamed: 'Smalltalk::B3diff').
	self diff.
	self modelMerger orionVersionedModel: (self modelMerger baseModel createNewChildVersion).

	self assert: (self modelMerger result setOfAddReferenceChanges) notNil.
	self assert: self modelMerger result setOfAddReferenceChanges size equals:  (self diff assocChanges count: [ :e | e isAddition and: [ e entity isReference ] ]).


	
]

{ #category : #'tests-set' }
TOrionMergeTest >> testSetOfMoveAttributeChanges [
	| att |
	"In order to determine that an attribute has moved it needs to get at least 3 accesses to it"
	"creation of the attribute and the 3 accesses in the source model"
	att := FAMIXAttribute new
		name: 'attAdded';
		yourself.
	self modelMerger targetModel add: att.
	(self modelMerger targetModel entityNamed: 'Smalltalk::A3diff') addAttribute: att.
	FAMIXAccess new
		variable: att;
		accessor: (self modelMerger targetModel entityNamed: 'Smalltalk::A3diff.b3()').
	FAMIXAccess new
		variable: att;
		accessor: (self modelMerger targetModel entityNamed: 'Smalltalk::A3diff.c3()').
	FAMIXAccess new
		variable: att;
		accessor: (self modelMerger targetModel entityNamed: 'Smalltalk::B3diff.c3()').

	"creation of the attribute and the 3 accesses in the target model"
	(self modelMerger baseModel entityNamed: 'Smalltalk::A4diff') addAttributeNamed: 'attAdded' inModel: self modelMerger baseModel.
	(self modelMerger baseModel entityNamed: 'Smalltalk::A3diff.b3()') addAccessTo: (self modelMerger baseModel entityNamed: 'Smalltalk::A4diff.attAdded') inModel: self modelMerger baseModel.
	(self modelMerger baseModel entityNamed: 'Smalltalk::A3diff.c3()') addAccessTo: (self modelMerger baseModel entityNamed: 'Smalltalk::A4diff.attAdded') inModel: self modelMerger baseModel.
	(self modelMerger baseModel entityNamed: 'Smalltalk::B3diff.c3()') addAccessTo: (self modelMerger baseModel entityNamed: 'Smalltalk::A4diff.attAdded') inModel: self modelMerger baseModel.
	self diff.
	self modelMerger orionVersionedModel: self modelMerger baseModel createNewChildVersion.
	self assert: self modelMerger result setOfMoveAttributeChanges notNil.
	self assert: self modelMerger result setOfMoveAttributeChanges size equals: 1.
	self assert: (self modelMerger result setOfMoveAttributeChanges collect: [ :e | e entity mooseName = 'Smalltalk::A3diff.attAdded' ]) notNil
]

{ #category : #'tests-set' }
TOrionMergeTest >> testSetOfMoveClassChanges [
	| fmxEntity |
	"moving A3 into P2"
	(self modelMerger targetModel entityNamed: 'Smalltalk::A3diff') parentPackage: (self modelMerger targetModel entityNamed: 'Moose-TestResources-ModelDiff-P2').
	fmxEntity := FAMIXMethod new
		name: 'b2';
		signature: 'b2()';
		parentType: (self modelMerger targetModel entityNamed: 'Smalltalk::B3diff').
	self modelMerger targetModel add: fmxEntity.
	self diff.
	self modelMerger orionVersionedModel: self modelMerger baseModel createNewChildVersion.
	self assert: self modelMerger result setOfMoveClassChanges notNil.
	self assert: self modelMerger result setOfMoveClassChanges size equals: 1.
	self assert: (self modelMerger result setOfMoveClassChanges collect: [ :e | e entity mooseName = 'Smalltalk::A3diff' ]) notNil
]

{ #category : #'tests-set' }
TOrionMergeTest >> testSetOfMoveMethodChanges [
	(self modelMerger targetModel entityNamed: 'Smalltalk::A3diff.c3()')
		parentType: (self modelMerger targetModel entityNamed: 'Smalltalk::A2diff').
	self diff.
	self modelMerger orionVersionedModel: self modelMerger baseModel createNewChildVersion.
	self assert: self modelMerger result setOfMoveMethodChanges notNil.
	self
		assert: self modelMerger result setOfMoveMethodChanges size
		equals: (self diff count: [ :e | e isMove and: [ e entity isBehaviouralEntity ] ]).
	self assert: (self modelMerger result setOfMoveMethodChanges collect: [ :e | e entity mooseName = 'Smalltalk::A3diff.c3()' ]) isNotEmpty
]

{ #category : #'tests-set' }
TOrionMergeTest >> testSetOfRemoveAccessChanges [
	| var1 |
	var1 := self modelMerger baseModel entityNamed: 'Smalltalk::A3diff.att1'.
	ORActionAddAccess new
		orionModel: self modelMerger baseModel;
		accessor: (self modelMerger baseModel entityNamed: 'Smalltalk::A3diff.b3()');
		variable: var1;
		run.
	self diff.
	self modelMerger orionVersionedModel: self modelMerger baseModel createNewChildVersion.
	self assert: self modelMerger result setOfRemoveAccessChanges notNil.
	self
		assert: self modelMerger result setOfRemoveAccessChanges size
		equals: (self diff assocChanges count: [ :e | e isRemoval and: [ e entity isAccess ] ])
]

{ #category : #'tests-set' }
TOrionMergeTest >> testSetOfRemoveAttributeChanges [
	(self modelMerger baseModel entityNamed: 'Smalltalk::A4diff') addAttributeNamed: 'toto' inModel: self modelMerger baseModel.
	self diff.
	self modelMerger orionVersionedModel: self modelMerger baseModel createNewChildVersion.
	self assert: (self modelMerger result anySatisfy: [ :c | c isRemoval and: [ c entity name = 'toto' ] ]).
	self assert: self modelMerger result setOfRemoveAttributeChanges isNotNil.
	self assert: self modelMerger result setOfRemoveAttributeChanges size equals: (self diff count: [ :e | e isRemoval and: [ e entity isAttribute ] ])
]

{ #category : #'tests-set' }
TOrionMergeTest >> testSetOfRemoveChanges [
	self diff.
	self modelMerger orionVersionedModel: self modelMerger baseModel createNewChildVersion.
	self assert: self modelMerger result setOfRemoveChanges isNotNil.
	self assert: self modelMerger result setOfRemoveChanges size equals: (self diff count: [ :e | e isRemoval ])
]

{ #category : #'tests-set' }
TOrionMergeTest >> testSetOfRemoveMethodChanges [
	self diff.
	self modelMerger orionVersionedModel: self modelMerger baseModel createNewChildVersion.
	self assert: (self modelMerger result anySatisfy: [ :c | c isRemoval and: [ c entity name = 'b3' ] ]).
	self assert: self modelMerger result setOfRemoveMethodChanges isNotNil.
	self assert: self modelMerger result setOfRemoveMethodChanges size equals: 1
]

{ #category : #'tests-set' }
TOrionMergeTest >> testSetOfRemoveReferenceChanges [
	| var1 |
	var1 := self modelMerger baseModel entityNamed: 'Smalltalk::A3diff.b3()'.
	ORActionAddReference new
		orionModel: self modelMerger baseModel;
		source: var1;
		target: (self modelMerger baseModel entityNamed: 'Smalltalk::A4diff');
		run.
	self diff.
	self modelMerger orionVersionedModel: self modelMerger baseModel createNewChildVersion.
	self assert: self modelMerger result setOfRemoveReferenceChanges isNotNil.
	self assert: self modelMerger result setOfRemoveReferenceChanges size equals: (self diff assocChanges count: [ :e | e isRemoval and: [ e entity isReference ] ])
]

{ #category : #'tests-set' }
TOrionMergeTest >> testSetOfRenameAttributeChanges [

	| var1 var2  |
	var1 := self modelMerger baseModel entityNamed: 'Smalltalk::A3diff.att1'.
	ORActionAddAccess new 		
			orionModel: self modelMerger baseModel; 
			accessor: (self modelMerger baseModel entityNamed: 'Smalltalk::A3diff.b2()') ; 
			variable: var1; 
			run.
	ORActionAddAccess new 		
			orionModel: self modelMerger baseModel; 
			accessor: (self modelMerger baseModel entityNamed: 'Smalltalk::A3diff.c3()') ; 
			variable: var1; 
			run.
	ORActionAddAccess new 		
			orionModel: self modelMerger baseModel; 
			accessor: (self modelMerger baseModel entityNamed: 'Smalltalk::B3diff.c3()') ; 
			variable: var1; 
			run.

	var2 := self modelMerger targetModel entityNamed: 'Smalltalk::A3diff.att1'.
	FAMIXAccess new variable: var2 ; accessor: (self modelMerger targetModel entityNamed: 'Smalltalk::A3diff.b2()').
	FAMIXAccess new variable: var2 ; accessor: (self modelMerger targetModel entityNamed: 'Smalltalk::A3diff.c3()').
	FAMIXAccess new variable: var2 ; accessor: (self modelMerger targetModel entityNamed: 'Smalltalk::B3diff.c3()').
	var2 name: 'toto'.
	
	self diff.
	self modelMerger orionVersionedModel: (self modelMerger baseModel createNewChildVersion).

	self assert: (self modelMerger result setOfRenameAttributeChanges) notNil.
	self assert: self modelMerger result setOfRenameAttributeChanges size equals: 1.
	self assert: (self modelMerger result setOfRenameAttributeChanges collect: [ :e | e entity name = 'att1' ] ) isNotEmpty.
	self assert:  (self modelMerger result setOfRenameAttributeChanges collect: [ :e | e entity name = 'toto' ] ) isNotEmpty.

	
]

{ #category : #'tests-set' }
TOrionMergeTest >> testSetOfRenameClassChanges [
	(self modelMerger targetModel entityNamed: 'Smalltalk::A3diff') name: 'X3diff'.
	self diff.
	self modelMerger orionVersionedModel: self modelMerger baseModel createNewChildVersion.
	self assert: self modelMerger result setOfRenameClassChanges isNotNil.
	self assert: self modelMerger result setOfRenameClassChanges size equals: 1.
	self assert: (self modelMerger result setOfRenameClassChanges collect: [ :e | e entity mooseName = 'Smalltalk::A3diff' ]) isNotNil
]

{ #category : #'tests-expected failures' }
TOrionMergeTest >> testSetOfRenameMethodChanges [
	(self modelMerger targetModel entityNamed: 'Smalltalk::A3diff.c3()') name: 'd3()'.
	self diff.
	self modelMerger orionVersionedModel: self modelMerger baseModel createNewChildVersion.
	self assert: self modelMerger result setOfRenameMethodChanges notNil.
	self assert: self modelMerger result setOfRenameMethodChanges size equals: (self diff count: [ :e | e isRemoval and: [ e entity isMethod ] ]).
	self assert: (self modelMerger result setOfRenameMethodChanges collect: [ :e | e entity name = 'c3' ]) isNotNil.
	self assert: (self modelMerger result setOfRenameMethodChanges collect: [ :e | e targetEntity name = 'd3()' ]) isNotNil
]

{ #category : #'tests-expected failures' }
TOrionMergeTest >> testSetOfRenamePackageChanges [
	<expectedFailure>
	(self modelMerger targetModel entityNamed: 'Moose-TestResources-ModelDiff-P3') name: 'totoPackage'.
	self diff.
	self modelMerger orionVersionedModel: self modelMerger baseModel createNewChildVersion.
	self assert: self modelMerger result setOfRenamePackageChanges isNotNil.
	self assert: self modelMerger result setOfRenamePackageChanges size equals: (self diff count: [ :e | e isRemoval and: [ e entity isPackage ] ]).
	self assert: (self modelMerger result setOfRenamePackageChanges collect: [ :e | e entity name = 'Moose-TestResources-ModelDiff-P3' ]) isNotNil.
	self assert: (self modelMerger result setOfRenamePackageChanges collect: [ :e | e targetEntity name = 'totoPackage' ]) isNotNil
]
