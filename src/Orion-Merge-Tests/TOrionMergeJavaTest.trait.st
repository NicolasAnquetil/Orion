"
trait to see with test is failling
"
Trait {
	#name : #TOrionMergeJavaTest,
	#category : 'Orion-Merge-Tests'
}

{ #category : #tests }
TOrionMergeJavaTest >> test [
	"comment stating purpose of message"

	self assert: self modelMerger baseModel notEmpty
]

{ #category : #tests }
TOrionMergeJavaTest >> testAddContainedStubNamespace [
	"The parent namespace is a stub and does not already exist in the model"

	| ns nsc |
	ns := FAMIXNamespace new
		name: 'Namespace2';
		isStub: true; 
		yourself.
	self modelMerger targetModel add: ns.
	nsc := FAMIXNamespace new
		name: 'NamespaceCont2';
		isStub: true;
		parentScope: ns;
		yourself.
	self modelMerger targetModel add: nsc.
	self modelMerger run.
	self modelMerger orionVersionedModel: self modelMerger baseModel createNewChildVersion.
	self modelMerger orionVersionedModel addStubNamespace: nsc.
	self assert: (self modelMerger baseModel entityNamed: 'Namespace2') isNil.
	self assert: (self modelMerger orionVersionedModel entityNamed: 'Namespace2') isNotNil.
	self assert: (self modelMerger orionVersionedModel entityNamed: 'Namespace2') isStub.
	self assert: (self modelMerger baseModel entityNamed: 'Namespace2::NamespaceCont2') isNil.
	self
		assert: (self modelMerger orionVersionedModel entityNamed: 'Namespace2::NamespaceCont2') notNil.
	self
		assert: (self modelMerger orionVersionedModel entityNamed: 'Namespace2::NamespaceCont2') parentScope
		equals: (self modelMerger orionVersionedModel entityNamed: 'Namespace2')
]

{ #category : #tests }
TOrionMergeJavaTest >> testAddContainedStubNamespace2 [
	"The parent namespace is not a stub and already exist in the model"

	| ns |
	ns := FAMIXNamespace new
		name: 'Namespace2';
		isStub: true;
		parentScope: (self modelMerger targetModel entityNamed: 'NamespaceTest') yourself.
	self modelMerger targetModel add: ns.
	self modelMerger run.
	self modelMerger orionVersionedModel: self modelMerger baseModel createNewChildVersion.
	self modelMerger orionVersionedModel addStubNamespace: ns.
	self assert: (self modelMerger baseModel entityNamed: 'NamespaceTest::Namespace2') isNil.
	self assert: (self modelMerger orionVersionedModel entityNamed: 'NamespaceTest::Namespace2') notNil.
	self
		assert: (self modelMerger orionVersionedModel entityNamed: 'NamespaceTest::Namespace2') parentScope
		equals: (self modelMerger orionVersionedModel entityNamed: 'NamespaceTest')
]

{ #category : #tests }
TOrionMergeJavaTest >> testAddContainedStubNamespace3 [
	"The parent namespace is a stub and already exists in the model"

	| ns |
	ns := FAMIXNamespace new
		name: 'Namespace2';
		isStub: true;
		parentScope: (self modelMerger targetModel entityNamed: 'java') yourself.
	self modelMerger targetModel add: ns.
	self modelMerger run.
	self modelMerger orionVersionedModel: self modelMerger baseModel createNewChildVersion.
	self modelMerger orionVersionedModel addStubNamespace: ns.
	self assert: (self modelMerger baseModel entityNamed: 'java::Namespace2') isNil.
	self assert: (self modelMerger orionVersionedModel entityNamed: 'java::Namespace2') notNil.
	self
		assert: (self modelMerger orionVersionedModel entityNamed: 'java::Namespace2') parentScope
		equals: (self modelMerger orionVersionedModel entityNamed: 'java')
]

{ #category : #tests }
TOrionMergeJavaTest >> testAddInheritance [
	| c1 c2 inh |
	c1 := self modelMerger targetModel entityNamed: 'NamespaceTest::Class1'.
	c2 := self modelMerger targetModel entityNamed: 'NamespaceTest::ContainedNamespace::Class2'.
	inh := FAMIXInheritance new
		superclass: c1;
		subclass: c2;
		yourself.
	self modelMerger targetModel add: inh.
	self modelMerger run.
	self modelMerger orionVersionedModel: self modelMerger baseModel createNewChildVersion.
	self mooseModelMerge createAddInheritance.
	self modelMerger orionVersionedModel
		addInheritanceFrom: self modelMerger result setOfAddInheritanceChanges first entity from
		to: self modelMerger result setOfAddInheritanceChanges first entity to.
	self
		assert:
			(self modelMerger orionVersionedModel entityNamed: 'NamespaceTest::ContainedNamespace::Class2')
				superInheritances notEmpty.
	self
		assert:
			(self modelMerger orionVersionedModel entityNamed: 'NamespaceTest::Class1') subInheritances notEmpty
]

{ #category : #tests }
TOrionMergeJavaTest >> testAddReference [
	| cl meth ref changedReference |
	cl := self modelMerger targetModel entityNamed: 'NamespaceTest::ContainedNamespace::Class2'.
	meth := self modelMerger targetModel entityNamed: 'NamespaceTest::Class1.supersimple()'.
	ref := FAMIXReference new
		source: meth;
		target: cl;
		yourself.
	self modelMerger targetModel add: ref.
	self modelMerger run.
	self modelMerger orionVersionedModel: self modelMerger baseModel createNewChildVersion.
	changedReference := self modelMerger result setOfAddReferenceChanges first entity.
	self
		assert:
			(self modelMerger orionVersionedModel entityNamed: 'NamespaceTest::Class1.supersimple()')
				outgoingReferences isEmpty.
	self modelMerger orionVersionedModel addReferenceFrom: changedReference from to: changedReference to.
	self
		assert:
			(self modelMerger orionVersionedModel entityNamed: 'NamespaceTest::Class1.supersimple()')
				outgoingReferences isNotEmpty.
	self
		assert:
			(self modelMerger orionVersionedModel entityNamed: 'NamespaceTest::Class1.supersimple()')
				outgoingReferences first to
		equals: (self modelMerger orionVersionedModel entityNamed: 'NamespaceTest::ContainedNamespace::Class2')
]

{ #category : #tests }
TOrionMergeJavaTest >> testAddReference2 [
	| cl meth ref |
	cl := self modelMerger targetModel entityNamed: 'NamespaceTest::ContainedNamespace::Class2'.
	meth := FAMIXMethod new
		signature: 'methAdded()';
		name: 'methAdded';
		parentType: (self modelMerger targetModel entityNamed: 'NamespaceTest::Class1');
		yourself.
	self modelMerger targetModel add: meth.
	ref := FAMIXReference new
		source: meth;
		target: cl;
		yourself.
	self modelMerger targetModel add: ref.
	self modelMerger run.
	self modelMerger orionVersionedModel: self modelMerger baseModel createNewChildVersion.
	self mooseModelMerge createAddMethod.
	self
		assert:
			(self modelMerger orionVersionedModel entityNamed: 'NamespaceTest::Class1.methAdded()')
				outgoingReferences isEmpty.
	self modelMerger orionVersionedModel
		addReferenceFrom: self modelMerger result setOfAddReferenceChanges first entity from
		to: self modelMerger result setOfAddReferenceChanges first entity to.
	self
		assert:
			(self modelMerger orionVersionedModel entityNamed: 'NamespaceTest::Class1.methAdded()')
				outgoingReferences notEmpty.
	self
		assert:
			(self modelMerger orionVersionedModel entityNamed: 'NamespaceTest::Class1.methAdded()')
				outgoingReferences first to
		equals: (self modelMerger orionVersionedModel entityNamed: 'NamespaceTest::ContainedNamespace::Class2')
]

{ #category : #tests }
TOrionMergeJavaTest >> testAddReferenceFromMethOfAnonymousClass [
	| cl meth |
	cl := FAMIXClass new
		name: 'AnonymousClass';
		container: (self modelMerger targetModel entityNamed: 'NamespaceTest::Class1.supersimple()');
		yourself.
	self modelMerger targetModel add: cl.
	meth := FAMIXMethod new
		signature: 'methInAnonymousClass';
		name: 'methInAnonymousClass';
		parentType: (self modelMerger targetModel entityNamed: 'NamespaceTest::Class1.supersimple()::AnonymousClass');
		yourself.
	self modelMerger targetModel add: meth.
	self modelMerger run.
	self modelMerger orionVersionedModel: self modelMerger baseModel createNewChildVersion.
	self modelMerger orionVersionedModel
		addReferenceFrom: meth
		to: (self modelMerger targetModel entityNamed: 'NamespaceTest::Class1').
	self
		assert:
			(self modelMerger orionVersionedModel entityNamed: 'NamespaceTest::Class1') incomingReferences isEmpty
]

{ #category : #tests }
TOrionMergeJavaTest >> testAddReferenceFromMethOfInnerClass [
	| cl meth |
	cl := FAMIXClass new
		name: 'InnerClass';
		container: (self modelMerger targetModel entityNamed: 'NamespaceTest::Class1');
		yourself.
	self modelMerger targetModel add: cl.
	meth := FAMIXMethod new
		signature: 'methInInnerClass';
		name: 'methInInnerClass';
		parentType: (self modelMerger targetModel entityNamed: 'NamespaceTest::Class1::InnerClass');
		yourself.
	self modelMerger targetModel add: meth.
	self modelMerger run.
	self modelMerger orionVersionedModel: self modelMerger baseModel createNewChildVersion.
	self mooseModelMerge createAddMethod.
	self modelMerger orionVersionedModel
		addReferenceFrom: meth
		to: (self modelMerger targetModel entityNamed: 'NamespaceTest::Class1').
	self
		assert: (self modelMerger targetModel entityNamed: 'NamespaceTest::Class1') incomingReferences isEmpty
]

{ #category : #tests }
TOrionMergeJavaTest >> testAddReferenceToStubClass [
	| cl |
	cl := FAMIXClass new
		name: 'ClassTest';
		isStub: true;
		container: (self modelMerger targetModel entityNamed: 'NamespaceTest');
		yourself.
	self modelMerger targetModel add: cl.
	self modelMerger run.
	self modelMerger orionVersionedModel: self modelMerger baseModel createNewChildVersion.
	self
		assert:
			(self modelMerger orionVersionedModel entityNamed: 'NamespaceTest::Class1.supersimple()')
				outgoingReferences isEmpty.
	self modelMerger orionVersionedModel
		addReferenceFrom: (self modelMerger targetModel entityNamed: 'NamespaceTest::Class1.supersimple()')
		toStub: cl.
	self
		assert:
			(self modelMerger orionVersionedModel entityNamed: 'NamespaceTest::Class1.supersimple()')
				outgoingReferences notEmpty
]

{ #category : #tests }
TOrionMergeJavaTest >> testAddStubClass [
	| cl stubClass |
	cl := FAMIXClass new
		name: 'ClassTest';
		isStub: true;
		container: (self modelMerger targetModel entityNamed: 'NamespaceTest');
		yourself.
	self modelMerger targetModel add: cl.
	self modelMerger run.
	self modelMerger orionVersionedModel: self modelMerger baseModel createNewChildVersion.
	self modelMerger orionVersionedModel addStubClass: cl.
	self assert: (self modelMerger baseModel entityNamed: 'NamespaceTest::ClassTest') isNil.
	stubClass := self modelMerger orionVersionedModel entityNamed: 'NamespaceTest::ClassTest'.
	self assert: stubClass isNotNil.
	self assert: stubClass isStub.
	self
		assert: stubClass container
		equals: (self modelMerger orionVersionedModel entityNamed: 'NamespaceTest')
]

{ #category : #tests }
TOrionMergeJavaTest >> testAddStubClassInExistingStubNS [
	| cl |
	cl := FAMIXClass new
		name: 'ClassTest';
		isStub: true;
		container: (self modelMerger targetModel entityNamed: 'java');
		yourself.
	self modelMerger targetModel add: cl.
	self modelMerger run.
	self modelMerger orionVersionedModel: self modelMerger baseModel createNewChildVersion.
	self modelMerger orionVersionedModel addStubClass: cl.
	self assert: (self modelMerger baseModel entityNamed: 'java::ClassTest') isNil.
	self assert: (self modelMerger orionVersionedModel entityNamed: 'java::ClassTest') notNil.
	self
		assert: (self modelMerger orionVersionedModel entityNamed: 'java::ClassTest') container
		equals: (self modelMerger orionVersionedModel entityNamed: 'java')
]

{ #category : #tests }
TOrionMergeJavaTest >> testAddStubClassInNonExistingStubNS [
	| cl ns |
	ns := FAMIXNamespace new
		name: 'Namespace2';
		isStub: true;
		yourself.
	self modelMerger targetModel add: ns.
	cl := FAMIXClass new
		name: 'ClassTest';
		isStub: true;
		container: ns;
		yourself.
	self modelMerger targetModel add: cl.
	self modelMerger run.
	self modelMerger orionVersionedModel: self modelMerger baseModel createNewChildVersion.
	self modelMerger orionVersionedModel addStubClass: cl.
	self assert: (self modelMerger baseModel entityNamed: 'Namespace2') isNil.
	self assert: (self modelMerger baseModel entityNamed: 'Namespace2::ClassTest') isNil.
	self assert: (self modelMerger orionVersionedModel entityNamed: 'Namespace2') notNil.
	self assert: (self modelMerger orionVersionedModel entityNamed: 'Namespace2::ClassTest') notNil.
	self
		assert: (self modelMerger orionVersionedModel entityNamed: 'Namespace2::ClassTest') container
		equals: (self modelMerger orionVersionedModel entityNamed: 'Namespace2')
]

{ #category : #tests }
TOrionMergeJavaTest >> testAddStubNamespace [
	| ns stubNamespace |
	ns := FAMIXNamespace new
		name: 'Namespace2';
		isStub: true;
		yourself.
	self modelMerger targetModel add: ns.
	self modelMerger run.
	self modelMerger orionVersionedModel: self modelMerger baseModel createNewChildVersion.
	self modelMerger orionVersionedModel addStubNamespace: ns.
	self assert: (self modelMerger baseModel entityNamed: 'Namespace2') isNil.
	stubNamespace := self modelMerger orionVersionedModel entityNamed: 'Namespace2'.
	self assert: stubNamespace isNotNil.
	self assert: stubNamespace isStub
]

{ #category : #tests }
TOrionMergeJavaTest >> testCreateAddNamespace [
	self modelMerger targetModel add: (FAMIXNamespace new name: 'Namespace2').
	self assert: self modelMerger baseModel notEmpty.
	self modelMerger run.
	self modelMerger orionVersionedModel: self modelMerger baseModel createNewChildVersion.
	self mooseModelMerge createAddScopingEntity.
	self assert: (self modelMerger baseModel entityNamed: 'Namespace2') isNil.
	self assert: (self modelMerger orionVersionedModel entityNamed: 'Namespace2') notNil
]

{ #category : #tests }
TOrionMergeJavaTest >> testCreateMoveNamespace [
	(self modelMerger targetModel entityNamed: 'NamespaceTest::ContainedNamespace')
		parentScope: (self modelMerger targetModel entityNamed: 'java').
	self modelMerger run.
	self modelMerger orionVersionedModel: self modelMerger baseModel createNewChildVersion.
	self mooseModelMerge createMoveNamespace.
	self
		assert: (self modelMerger baseModel entityNamed: 'NamespaceTest::ContainedNamespace') parentScope name
		equals: 'NamespaceTest'.
	self
		assert: (self modelMerger orionVersionedModel entityNamed: 'java::ContainedNamespace') parentScope name
		equals: 'java'
]

{ #category : #tests }
TOrionMergeJavaTest >> testSetOfAddNamespace [
	self modelMerger targetModel add: (FAMIXNamespace new name: 'Namespace2').
	self assert: self modelMerger baseModel isNotEmpty.
	self modelMerger run.
	self assert: self modelMerger result setOfAddScopingEntityChanges isNotNil.
	self assert: self modelMerger result setOfAddScopingEntityChanges size equals: 1
]

{ #category : #tests }
TOrionMergeJavaTest >> testSetOfMoveNamespaceChanges [
	(self modelMerger targetModel entityNamed: 'NamespaceTest::ContainedNamespace')
		parentScope: (self modelMerger targetModel entityNamed: 'java').
	self modelMerger run.
	self modelMerger orionVersionedModel: self modelMerger baseModel createNewChildVersion.
	self assert: self modelMerger result setOfMoveNamespaceChanges notNil.
	self assert: self modelMerger result setOfMoveNamespaceChanges size equals: 1
]
