"
A MooseModelMerge enables to create a versioned OrionModel from a diff between two models.

Instance Variables
	actions:		<Object>
	orionVersionedModel:		<Object>
	snapshot:		<Object>

actions
	- collection of ORActions

orionVersionedModel
	- versioned OrionModel

snapshot
	- snapshot associated to the base and target models

"
Class {
	#name : #OrionMerge,
	#superclass : #FamixDiffAbstractPostOperator,
	#instVars : [
		'orionVersionedModel',
		'actions'
	],
	#category : 'Orion-Merge'
}

{ #category : #accessing }
OrionMerge >> actions [
	^ orionVersionedModel changes
]

{ #category : #adding }
OrionMerge >> addReferenceFrom: aFamixMethod to: aFamixClass [
	^ self orionVersionedModel addReferenceFrom: aFamixMethod to: aFamixClass
]

{ #category : #adding }
OrionMerge >> addReferenceFrom: aFamixMethod toStub: aFamixStubClass [
	^ self orionVersionedModel addReferenceFrom: aFamixMethod toStub: aFamixStubClass
]

{ #category : #adding }
OrionMerge >> addStubClass: aFamixStubClass [
	^ self orionVersionedModel addStubClass: aFamixStubClass
]

{ #category : #adding }
OrionMerge >> addStubNamespace: aFamixStubNamespace [
	^ self orionVersionedModel addStubNamespace: aFamixStubNamespace
]

{ #category : #'private-run' }
OrionMerge >> createAddAccess [
	"create the corresponding ORActions from the set of changes. Each type of change is managed separately"

	self result setOfAddAccessChanges
		do: [ :chg | 
			(self orionVersionedModel entityNamed: chg entity from mooseName)
				addAccessTo: (self orionVersionedModel entityNamed: chg entity to mooseName)
				inModel: self orionVersionedModel ]
]

{ #category : #'private-run' }
OrionMerge >> createAddAnnotationInstance [
	"create the corresponding ORActions from the set of changes. Each type of change is managed separately"

	self result setOfAddAnnotationInstanceChanges
		do: [ :chg | 
			(self orionVersionedModel entityNamed: chg entity belongsTo mooseName)
				addAnnotationInstanceOfType: chg entityName
				inModel: self orionVersionedModel ]
]

{ #category : #'private-run-migrated' }
OrionMerge >> createAddAnnotationType [
	self result setOfAddAnnotationTypeChanges
		do: [ :chg | 
			(chg entity belongsTo
				ifNotNil: [ self orionVersionedModel entityNamed: chg entity belongsTo mooseName ]
				ifNil: [ self orionVersionedModel ])
				addAnnotationTypeNamed: chg entityName
				inModel: self orionVersionedModel ]
]

{ #category : #'private-run-migrated' }
OrionMerge >> createAddAttribute [
	"create the corresponding ORActions from the set of changes. Each type of change is managed separately"

	self result setOfAddAttributeChanges
		do: [ :chg | 
			(chg entity belongsTo isInnerClass or: [ chg entity belongsTo isAnonymousClass ])
				ifFalse: [ 
					(self orionVersionedModel entityNamed: chg entity belongsTo mooseName)
						addAttributeNamed: chg entityName
						inModel: self orionVersionedModel ] ]
]

{ #category : #'private-run-migrated' }
OrionMerge >> createAddInheritance [
	"create the corresponding ORActions from the set of changes. Each type of change is managed separately"

	self result setOfAddInheritanceChanges
		do: [ :chg | 
			chg entity to isStub
				ifTrue: [ self orionVersionedModel addInheritanceFrom: chg entity from toStub: chg entity to ]
				ifFalse: [ self orionVersionedModel addInheritanceFrom: chg entity from to: chg entity to ] ]
]

{ #category : #'private-run-migrated' }
OrionMerge >> createAddInnerClass [
	"create the corresponding ORActions from the set of changes. Each type of change is managed separately"

	self changes
		do: [ :chg | 
			(chg isAddition and: [ chg isForType and: [ chg entity isInnerClass or: [ chg entity isAnonymousClass ] ]])
				ifTrue: [ 
					chg entity container
						ifNotNil: [ 
							chg entity container isType ifTrue: [ (self orionVersionedModel entityNamed: chg entity container mooseName)
								addClassNamed: chg entityName
								inModel: self orionVersionedModel ].
							chg entity container isMethod ifTrue: [ (self orionVersionedModel entityNamed: (chg entity container name, '()'))
								addClassNamed: chg entityName
								inModel: self orionVersionedModel ] ] ] ]
]

{ #category : #'private-run' }
OrionMerge >> createAddInvocation [
	"create the corresponding ORActions from the set of changes. Each type of change is managed separately"

	self result  setOfAddInvocationChanges
		do: [ :chg | |cand|
			(chg entity candidates isEmpty)
				ifFalse: [ 
					cand := OrderedCollection new.
					(chg entity candidates) do: [:e | cand add: (self orionVersionedModel entityNamed: (e mooseName))].
					(self orionVersionedModel entityNamed: chg entity from mooseName)
						addInvocationTo: (cand "retrouver les versions orion de ces éléments" ) 
						inModel: self orionVersionedModel ]
				ifTrue: [(self orionVersionedModel entityNamed: chg entity from mooseName)
						addInvocationTo: (self orionVersionedModel entityNamed: chg entity to mooseName) 
						receiver: (self orionVersionedModel entityNamed: chg entity receiver mooseName) 
						withSignature: chg entity signature 
						inModel: self orionVersionedModel   ] ]
]

{ #category : #'private-run-migrated' }
OrionMerge >> createAddMethod [
	"create the corresponding ORActions from the set of changes. Each type of change is managed separately"

	self result setOfAddMethodChanges
		do: [ :chg | 
			(chg entity belongsTo isInnerClass or: [ chg entity belongsTo isAnonymousClass ])
				ifFalse: [ 
					(self orionVersionedModel entityNamed: chg entity belongsTo mooseName)
						addMethodNamed: chg entityName
						withSignature: chg entity signature
						inModel: self orionVersionedModel ] ]
]

{ #category : #'private-run-migrated' }
OrionMerge >> createAddMethodOfInnerClass [
	"create the corresponding ORActions from the set of changes. Each type of change is managed separately"

	self result setOfAddMethodChanges
		do: [ :chg | 
			(chg entity belongsTo isInnerClass or: [ chg entity belongsTo isAnonymousClass ])
				ifTrue: [ 
					(self orionVersionedModel entityNamed: chg entity belongsTo mooseName)
						addMethodNamed: chg entityName
						withSignature: chg entity signature
						inModel: self orionVersionedModel ] ]
]

{ #category : #'private-run' }
OrionMerge >> createAddReference [
	"create the corresponding ORActions from the set of changes. Each type of change is managed separately"

	self result setOfAddReferenceChanges
		do: [ :chg | 
			chg entity to isStub
				ifTrue: [ self orionVersionedModel addReferenceFrom: chg entity from toStub: chg entity to ]
				ifFalse: [ self orionVersionedModel addReferenceFrom: chg entity from to: chg entity to ] ]
]

{ #category : #'private-run-migrated' }
OrionMerge >> createAddScopingEntity [
	"create the corresponding ORActions from the set of changes. Each type of change is managed separately"

	(self sortAddScopingEntityChanges: self result setOfAddScopingEntityChanges) do: [ :chg | 
		chg entity isPackage
			ifTrue: [ self orionVersionedModel addPackageNamed: chg entityName].
		chg entity isNamespace
			ifTrue: [ self orionVersionedModel addNamespaceNamed: chg entity name inORNamespace: (self orionVersionedModel entityNamed: chg entity parentScope mooseName) ] ]
]

{ #category : #'private-run-migrated' }
OrionMerge >> createAddType [
	"create the corresponding ORActions from the set of changes. Each type of change is managed separately"

	"create class when it's not an inner class or anonymous class"

	"self changes
		do: [ :chg | 
			(chg isAddition and:[ chg isForType and: [ chg entity isInnerClass not and: [ chg entity isAnonymousClass not ] ]])
				ifTrue: [ "

	| entity descr changeAction |
	self result setOfAddClassChanges
		do: [ :chg | 
			entity := chg entity.
			descr := entity mooseDescription.
			changeAction := ('ORActionAdd' , descr name) asClass new.
			changeAction orionModel: self orionVersionedModel.
			descr allAttributesNotDerived do: [ :e | self setProperty: e from: entity to: changeAction ].
			changeAction manualRun; postRun ]
]

{ #category : #'private-run' }
OrionMerge >> createMoveAttribute [
	"create the corresponding ORActions from the set of changes. Each type of change is managed separately"
	self result setOfMoveAttributeChanges do: [ :chg | chg entity moveTo: 
		(self orionVersionedModel entityNamed:( chg targetEntity belongsTo mooseName) ) inModel: self orionVersionedModel ]
]

{ #category : #'private-run' }
OrionMerge >> createMoveClass [
	"create the corresponding ORActions from the set of changes. Each type of change is managed separately"
	"distinction is done between parentPackage and belongsTo (that correspond to the container in ST en Java)"
	self result setOfMoveClassChanges do: [ :chg | chg targetEntity parentPackage ifNil: [ chg entity moveTo: 
		(self orionVersionedModel entityNamed: (chg targetEntity belongsTo mooseName)) inModel: self orionVersionedModel ] ifNotNil: [chg entity moveTo: 
		(self orionVersionedModel entityNamed: (chg targetEntity parentPackage mooseName)) inModel: self orionVersionedModel] ]
]

{ #category : #'private-run' }
OrionMerge >> createMoveMethod [
	"create the corresponding ORActions from the set of changes. Each type of change is managed separately"

	self result setOfMoveMethodChanges
		do: [ :chg | 
			chg entity belongsTo mooseName = chg targetEntity belongsTo mooseName
				ifFalse: [ 
					chg entity
						moveTo: (self orionVersionedModel entityNamed: chg targetEntity belongsTo mooseName)
						inModel: self orionVersionedModel ].
			chg entity packageScope mooseName = chg targetEntity packageScope mooseName
				ifFalse: [ 
					chg entity
						updatePackage: (self orionVersionedModel entityNamed: chg targetEntity packageScope mooseName)
						inModel: self orionVersionedModel]  ].
				
]

{ #category : #'private-run' }
OrionMerge >> createMoveNamespace [
	"create the corresponding ORActions from the set of changes. Each type of change is managed separately"

	"distinction is done between parentPackage and belongsTo (that correspond to the container in ST en Java)"

	self result setOfMoveNamespaceChanges
		do: [ :chg | 
			chg targetEntity parentScope
				ifNotNil: [ 
					chg entity
						moveTo: (self orionVersionedModel entityNamed: chg targetEntity parentScope mooseName)
						inModel: self orionVersionedModel ] ]
]

{ #category : #'private-run' }
OrionMerge >> createRemove [
	"create the corresponding ORActions from the set of changes. Each type of change is managed separately"

	| coll |
	coll := OrderedCollection new.

	"The order in which the changes are added in the collection is relevant"
	self flag: 'All the modification are not repercuted in the orion model. E.g the LocalVariales'.
	coll addAll: self result setOfRemoveAccessChanges.
	coll addAll: self result setOfRemoveReferenceChanges.
	coll addAll: self result setOfRemoveAnnotationInstanceChanges.
	coll addAll: self result setOfRemoveAnnotationTypeChanges.
	coll addAll: self result setOfRemoveAttributeChanges.
	coll addAll: self result setOfRemoveMethodChanges.
	coll addAll: self result setOfRemoveClassChanges.
	coll addAll: self result setOfRemovePackageChanges.
	coll do: [ :chg | chg entity deleteInModel: self orionVersionedModel ]
]

{ #category : #'private-run' }
OrionMerge >> createRemoveAccess [
	"create the corresponding ORActions from the set of changes. Each type of change is managed separately"
	self result  setOfRemoveAccessChanges do: [ :chg |
		(self orionVersionedModel entityNamed: chg entity mooseName) 
								deleteInModel: self orionVersionedModel.
								
		]
	
]

{ #category : #'private-run' }
OrionMerge >> createRemoveAnnotationInstance [
	self result setOfRemoveAnnotationInstanceChanges 
		do: [ :chg | chg entity deleteInModel: self orionVersionedModel ]
]

{ #category : #'private-run' }
OrionMerge >> createRemoveAnnotationType [
	self result setOfRemoveAnnotationTypeChanges
		do: [ :chg | chg entity deleteInModel: self orionVersionedModel ]
]

{ #category : #'private-run' }
OrionMerge >> createRemoveAttribute [
	"create the corresponding ORActions from the set of changes. Each type of change is managed separately"
	self result setOfRemoveAttributeChanges do: [ :chg |
		chg entity deleteInModel: self orionVersionedModel.]
	
]

{ #category : #'private-run' }
OrionMerge >> createRemoveInvocation [
	"create the corresponding ORActions from the set of changes. Each type of change is managed separately"
	self result setOfRemoveInvocationChanges do: [ :chg |
		(self orionVersionedModel entityNamed: chg entity mooseName) 
								deleteInModel: self orionVersionedModel.
								
		]
	
]

{ #category : #'private-run' }
OrionMerge >> createRemoveMethod [
	"create the corresponding ORActions from the set of changes. Each type of change is managed separately"
	self result setOfRemoveMethodChanges do: [ :chg |
		chg entity deleteInModel: self orionVersionedModel.]
	
]

{ #category : #'private-run' }
OrionMerge >> createRemoveReference [
	"create the corresponding ORActions from the set of changes. Each type of change is managed separately"
	self result setOfRemoveReferenceChanges do: [ :chg |
		(self orionVersionedModel entityNamed: chg entity mooseName) 
								deleteInModel: self orionVersionedModel.
								
		]
	
]

{ #category : #'private-run' }
OrionMerge >> createRename [
	"create the corresponding ORActions from the set of changes. Each type of change is managed separately"

	self result setOfRenameChanges do: [ :chg | chg entity rename: chg targetEntity name inModel: self orionVersionedModel ]
]

{ #category : #'private-run' }
OrionMerge >> createRenameAttribute [
	"create the corresponding ORActions from the set of changes. Each type of change is managed separately"
	self result setOfRenameAttributeChanges do: [ :chg | chg entity rename:  
		(chg targetEntity name) inModel: self orionVersionedModel ]
]

{ #category : #'private-run' }
OrionMerge >> createRenameClass [
	"create the corresponding ORActions from the set of changes. Each type of change is managed separately"
	self result setOfRenameClassChanges do: [ :chg | chg entity rename:  
		(chg targetEntity name) inModel: self orionVersionedModel ]
]

{ #category : #'private-run' }
OrionMerge >> createRenameMethod [
	"create the corresponding ORActions from the set of changes. Each type of change is managed separately"
	self result setOfRenameMethodChanges do: [ :chg | chg entity rename:  
		(chg targetEntity name) inModel: self orionVersionedModel ]
]

{ #category : #'private-run' }
OrionMerge >> createRenamePackage [
	"create the corresponding ORActions from the set of changes. Each type of change is managed separately"
	self result setOfRenamePackageChanges do: [ :chg | chg entity rename:  
		(chg targetEntity name) inModel: self orionVersionedModel ]
]

{ #category : #run }
OrionMerge >> createVersion [
	"create the new version of the OrionModel by successively calling all message creating ORActions"

	orionVersionedModel := self baseModel createNewChildVersion.
	self createAddScopingEntity.
	self createAddType.
	self createAddMethod.
	self createRename.
	self createAddAnnotationType.
	self createAddAnnotationInstance.
	self createAddInheritance.
	self createAddAccess.
	self createAddInvocation.
	self createAddAttribute.
	self createAddReference.
	self createMoveClass.
	self createMoveMethod.
	self createRemove
]

{ #category : #initialize }
OrionMerge >> initialize [
	actions := OrderedCollection new
]

{ #category : #accessing }
OrionMerge >> orionVersionedModel [
	^ orionVersionedModel
]

{ #category : #accessing }
OrionMerge >> orionVersionedModel: anObject [
	orionVersionedModel := anObject
]

{ #category : #accessing }
OrionMerge >> run [
	self createVersion.
]

{ #category : #deprecated }
OrionMerge >> snapshot [
	self
		deprecated: 'Use famixDiff instead'
		on: '17 November 2016'
		in: 'Pharo-6.0-60294-'
		transformWith: '`@receiver snapshot' -> '`@receiver orchestrator'.
	^ self orchestrator
]

{ #category : #deprecated }
OrionMerge >> snapshot: anObject [
	self
		deprecated: 'Use famixDiff: instead'
		on: '17 November 2016'
		in: 'Pharo-6.0-60294-'
		transformWith: '`@receiver snapshot: `@arg' -> '`@receiver famixDiff: `@arg'.
	^ self famixDiff: anObject
]

{ #category : #categorizing }
OrionMerge >> sortAddScopingEntityChanges: aCollection [
	"select the FamixChanges of the dictionnary according to their type and the type of the entity on which they occur"

	^ aCollection sort: [ :a :b | a mooseName < b mooseName ].
]
