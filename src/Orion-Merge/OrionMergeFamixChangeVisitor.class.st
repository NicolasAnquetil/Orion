Class {
	#name : #OrionMergeFamixChangeVisitor,
	#superclass : #FamixChangeVisitor,
	#instVars : [
		'famixAddVisitor',
		'orionVersionedModel'
	],
	#category : 'Orion-Merge'
}

{ #category : #'generic actions' }
OrionMergeFamixChangeVisitor >> createAdd: descr entity: aFamixAddChange [
	| entity changeAction className |
	entity := aFamixAddChange entity.
	descr implementingClass isOrionClass ifTrue: [ className := descr superclass name ] ifFalse: [ className := descr name ].
	changeAction := ('ORActionAdd' , className) asClass new.
	changeAction orionModel: self orionVersionedModel.
	descr allAttributesNotDerived
		collect: [ :e | e -> (self setProperty: e from: entity to: changeAction) ].
	changeAction
		manualRun;
		postRun
]

{ #category : #deprecated }
OrionMergeFamixChangeVisitor >> createAddAnnotationInstance: aFamixAddChange [
	(self orionVersionedModel entityNamed: aFamixAddChange entity belongsTo mooseName)
		addAnnotationInstanceOfType: aFamixAddChange entityName
		inModel: self orionVersionedModel
]

{ #category : #deprecated }
OrionMergeFamixChangeVisitor >> createAddAnnotationType: aFamixAddChange [
	(aFamixAddChange entity belongsTo
		ifNotNil: [ self orionVersionedModel entityNamed: aFamixAddChange entity belongsTo mooseName ]
		ifNil: [ self orionVersionedModel ])
		addAnnotationTypeNamed: aFamixAddChange entityName
		inModel: self orionVersionedModel
]

{ #category : #deprecated }
OrionMergeFamixChangeVisitor >> createAddAnnotationTypeAttribute: aFamixAddChange [
	self createAddAttribute: aFamixAddChange
]

{ #category : #deprecated }
OrionMergeFamixChangeVisitor >> createAddAttribute: aFamixAddChange [
	(self orionVersionedModel entityNamed: aFamixAddChange entity belongsTo mooseName)
		addAttributeNamed: aFamixAddChange entityName
		inModel: self orionVersionedModel
]

{ #category : #deprecated }
OrionMergeFamixChangeVisitor >> createAddClass: aFamixAddChange [
	| entity descr changeAction |
	entity := aFamixAddChange entity.
	descr := entity mooseDescription.
	changeAction := ('ORActionAdd' , descr name) asClass new.
	changeAction orionModel: self orionVersionedModel.
	descr allAttributesNotDerived do: [ :e | self setProperty: e from: entity to: changeAction ].
	changeAction manualRun; "	OLD VERSION : aFamixAddChange entity parentPackage
		ifNotNil: [ (self orionVersionedModel entityNamed: aFamixAddChange entity parentPackage mooseName)
				addClassNamed: aFamixAddChange entityName
				isStub: aFamixAddChange entity isStub
				inModel: self orionVersionedModel ]
		ifNil: [ (self orionVersionedModel entityNamed: aFamixAddChange entity container mooseName)
				addClassNamed: aFamixAddChange entityName
				isStub: aFamixAddChange entity isStub
				inModel: self orionVersionedModel ]"
			postRun
]

{ #category : #deprecated }
OrionMergeFamixChangeVisitor >> createAddEnum: aFamixAddChange [
		^ self createAddType: aFamixAddChange
]

{ #category : #deprecated }
OrionMergeFamixChangeVisitor >> createAddEnumValue: aFamixAddChange [ 
	self flag: 'Not yet implemented!'
]

{ #category : #deprecated }
OrionMergeFamixChangeVisitor >> createAddInheritance: aFamixAddChange [
	aFamixAddChange entity to isStub
		ifTrue: [ self orionVersionedModel addInheritanceFrom: aFamixAddChange entity from toStub: aFamixAddChange entity to ]
		ifFalse: [ self orionVersionedModel addInheritanceFrom: aFamixAddChange entity from to: aFamixAddChange entity to ]
]

{ #category : #deprecated }
OrionMergeFamixChangeVisitor >> createAddLocalVariable: aFamixAddChange [ 
	self flag: 'Not yet implemented!'
]

{ #category : #deprecated }
OrionMergeFamixChangeVisitor >> createAddMethod: aFamixAddChange [
	(self orionVersionedModel entityNamed: aFamixAddChange entity belongsTo mooseName)
		addMethodNamed: aFamixAddChange entityName
		withSignature: aFamixAddChange entity signature
		inModel: self orionVersionedModel
]

{ #category : #deprecated }
OrionMergeFamixChangeVisitor >> createAddNamespace: aFamixAddChange [
	self orionVersionedModel
		addNamespaceNamed: aFamixAddChange entity name
		inORNamespace: (self orionVersionedModel entityNamed: aFamixAddChange entity parentScope mooseName)
]

{ #category : #deprecated }
OrionMergeFamixChangeVisitor >> createAddParameter: aFamixAddChange [ 
	self flag: 'Not yet implemented!'.
]

{ #category : #deprecated }
OrionMergeFamixChangeVisitor >> createAddParameterType: aFamixAddChange [
	self flag: 'Not yet implemented!'
]

{ #category : #deprecated }
OrionMergeFamixChangeVisitor >> createAddParameterizableClass: aFamixAddChange [
		^ self createAddType: aFamixAddChange
]

{ #category : #deprecated }
OrionMergeFamixChangeVisitor >> createAddParameterizedType: aFamixAddChange [
		^ self createAddType: aFamixAddChange
]

{ #category : #deprecated }
OrionMergeFamixChangeVisitor >> createAddPrimitiveType: aFamixAddChange [
	self flag: #'Not Implemted yet!'
]

{ #category : #deprecated }
OrionMergeFamixChangeVisitor >> createAddType: aFamixAddChange [
	aFamixAddChange entity parentPackage
		ifNotNil: [ (self orionVersionedModel entityNamed: aFamixAddChange entity parentPackage mooseName)
				addClassNamed: aFamixAddChange entityName
				isStub: aFamixAddChange entity isStub
				inModel: self orionVersionedModel ]
		ifNil: [ (self orionVersionedModel entityNamed: aFamixAddChange entity container mooseName)
				addClassNamed: aFamixAddChange entityName
				isStub: aFamixAddChange entity isStub
				inModel: self orionVersionedModel ]
]

{ #category : #'generic actions' }
OrionMergeFamixChangeVisitor >> createDel: descr entity: aFamixRemovalChange [
	| entity changeAction |
	entity := aFamixRemovalChange entity.

	"(self orionVersionedModel includes: entity) ifFalse: [ ^ self ]."
	(entity orionModels includes: self orionVersionedModel)
		ifFalse: [ ^ self ].
	changeAction := ('ORActionRemove' , descr superclass name) asClass
		new.
	changeAction orionModel: self orionVersionedModel.
	descr allAttributesNotDerived
		do: [ :e | self setProperty: e from: entity to: changeAction ].
	changeAction entity: entity.
	[ changeAction
		manualRun;
		postRun ]
		on: OREntityNotFoundInCurrentModel
		do: [ :e | e resume ]
]

{ #category : #'generic actions' }
OrionMergeFamixChangeVisitor >> createMov: descr entity: aFamixMoveChange [
	| changeAction entity |
	entity := aFamixMoveChange entity.
	changeAction := ('ORActionMove' , descr superclass name) asClass new.
	changeAction orionModel: self orionVersionedModel.
	descr allContainerAttributes do: [ :e | self setProperty: e from: entity to: changeAction ].
	changeAction entity: entity.
	changeAction
		manualRun;
		postRun
]

{ #category : #'generic actions' }
OrionMergeFamixChangeVisitor >> createRen: descr entity: aFamixRenameChange [
	| changeAction |
	changeAction := ('ORActionRename' , descr superclass name) asClass new.
	changeAction orionModel: self orionVersionedModel.
	changeAction newName: aFamixRenameChange targetEntity name.
	changeAction entity: aFamixRenameChange entity.
	changeAction
		manualRun;
		postRun
]

{ #category : #private }
OrionMergeFamixChangeVisitor >> findEntityInOrionModel: entity [
	entity mooseName = #noname
		ifTrue: [ 
			"Retrieve the parent and then the entity"
			| fm3Description parent |
			fm3Description := (entity mooseDescription allContainerAttributes) first.
			parent := self orionVersionedModel entityNamed: (entity perform: fm3Description implementingSelector) mooseName withType: (entity perform: fm3Description implementingSelector) class.
			(parent notNil and: [ fm3Description opposite isMultivalued not ]) ifTrue: [ ^ parent perform: fm3Description opposite implementingSelector ]].
	^ self orionVersionedModel entityNamed: entity mooseName withType: (self orionClassOf: entity class)
]

{ #category : #initialization }
OrionMergeFamixChangeVisitor >> initialize [
	famixAddVisitor := OrionMergeFamixVisitor
		new
		changeVisitor: self;
		yourself
]

{ #category : #private }
OrionMergeFamixChangeVisitor >> orionClassOf: aClass [
	"Fix for Orion: if the entities are sorted by type, the famix type should be the rule. If a package is defined, it is a real class of the model, else it is another kind of class (type Orion)"

	^ (aClass mooseDescription isNil or: [ aClass mooseDescription subclasses isEmptyOrNil ])
		ifTrue: [ aClass ]
		ifFalse: [ self
				orionClassOf: (aClass mooseDescription subclasses detect: [ :e | e implementingClass isOrionClass ] ifNone: [ ^ aClass ]) implementingClass ]
]

{ #category : #accessing }
OrionMergeFamixChangeVisitor >> orionVersionedModel [
	^ orionVersionedModel
]

{ #category : #accessing }
OrionMergeFamixChangeVisitor >> orionVersionedModel: anORModel [
	orionVersionedModel := anORModel
]

{ #category : #initialization }
OrionMergeFamixChangeVisitor >> setProperty: aFM3PropertyDescription from: aMooseEntity to: anActionClass [
	| selector fromEntityResult result |
	selector := aFM3PropertyDescription implementingSelector.
	fromEntityResult := [ aMooseEntity perform: selector ]
		on: OREntityNotFoundInCurrentModel
		do: [ ^ self ].
	fromEntityResult ifNil: [ ^ self ].
	result := fromEntityResult.
	aFM3PropertyDescription type isPrimitive
		ifFalse: [ aFM3PropertyDescription isMultivalued
				ifTrue: [ result := fromEntityResult
						collect: [ :e | self findEntityInOrionModel: e ]
						thenSelect: [ :e | e isNotNil ] ]
				ifFalse: [ result := self findEntityInOrionModel: fromEntityResult ] ].
	[ anActionClass perform: selector asMutator with: result ]
		on: MessageNotUnderstood
		do: [ :e | "Transcript logCr: e printString" ].
	^ result
]

{ #category : #visiting }
OrionMergeFamixChangeVisitor >> visitAddChange: aFamixAddChange [
	famixAddVisitor currentEntity: aFamixAddChange.
	aFamixAddChange entity accept: famixAddVisitor
]

{ #category : #'generic actions' }
OrionMergeFamixChangeVisitor >> visitBodyChange: aBodyChange [
	| changeAction |
	changeAction := ORActionAddMethodWithBodyHash new.
	changeAction orionModel: self orionVersionedModel.
	changeAction entity: aBodyChange entity.
	changeAction bodyHash: aBodyChange targetEntity bodyHash.
	changeAction
		manualRun;
		postRun
]

{ #category : #visiting }
OrionMergeFamixChangeVisitor >> visitChange: aFamixAddChange [ 
	self shouldBeImplemented.
]

{ #category : #visiting }
OrionMergeFamixChangeVisitor >> visitMoveChange: aMoveChange [
	famixAddVisitor currentEntity: aMoveChange.
	aMoveChange entity accept: famixAddVisitor
]

{ #category : #visiting }
OrionMergeFamixChangeVisitor >> visitRemovalChange: aFamixAddChange [
	famixAddVisitor currentEntity: aFamixAddChange.
	aFamixAddChange entity accept: famixAddVisitor
]

{ #category : #visiting }
OrionMergeFamixChangeVisitor >> visitRenameChange: aRenameChange [ 
	famixAddVisitor currentEntity: aRenameChange.
	aRenameChange entity accept: famixAddVisitor
]

{ #category : #visiting }
OrionMergeFamixChangeVisitor >> visitVersionChange: aVersionChange [
	"Do nothing -> no change -> no change"

	
]
