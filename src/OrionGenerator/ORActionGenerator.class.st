"
An ORActionGenerator is a tool to easily create the skeleton of ORActions.

You can use it by providing a collection of OREntities: 
	ORActionGenerator new createActionsForACollectionOfORClasses: { MyOREntityClass1 . MyOREntityClass2 }

Look at the class side method for actual usage.

ORActionGenerator createActionsForORClasses: ('OrionFamixCore' asPackage definedClasses reject: #isTrait).
"
Class {
	#name : #ORActionGenerator,
	#superclass : #ORAbstractGenerator,
	#category : 'OrionGenerator'
}

{ #category : #running }
ORActionGenerator class >> createActionsForORClasses: aCollectionOfClasses [
	^ ORActionGenerator new
		createActionsForACollectionOfORClasses: aCollectionOfClasses
]

{ #category : #running }
ORActionGenerator class >> runOnOrionExistingClasses [

	^ self
		createActionsForORClasses:
			((RPackage organizer packageNamed: 'OrionFamixCore')
				classesForClassTag: 'Class')
]

{ #category : #running }
ORActionGenerator class >> runOnOrionExistingJavaClasses [

	^ self
		createActionsForORClasses:
			((RPackage organizer packageNamed: 'OrionFamixJava')
				classesForClassTag: 'Class')
]

{ #category : #running }
ORActionGenerator class >> runOnOrionSQLClasses [
	^ self
		createActionsForORClasses:
			(((RPackage organizer packages select: [:p | #(#'OrionFamixSQLCore' #'OrionFamixSQLAssociations' #'OrionFamixSQL') includes: p name ]) flatCollect: [ :p | p 
				classesForClassTag: 'Class' ] ))

]

{ #category : #'creating method' }
ORActionGenerator >> addInstanceVariable: aString on: aClass [
	[ aClass addInstVarNamed: aString ]
		on: DuplicatedSlotName
		do: [ "Slot already existing, just break and continue" ]
]

{ #category : #'creating method' }
ORActionGenerator >> applyGenerationOfActionsOn: aListOfProperties onBlock: block [
	| props |
	props := aListOfProperties groupedBy: #package.
	props associationsDo: block
]

{ #category : #'creating method' }
ORActionGenerator >> catNameFor: aFamePackage defaultName: defaultCatName [
	^ aFamePackage
		ifNil: [ defaultCatName , ' - generated' ]
		ifNotNil: [ '*OrionFamix' , aFamePackage name ]
]

{ #category : #preparation }
ORActionGenerator >> createActionClassNameWithType: aTypeOfAction for: anOREntity [
	^ 'ORAction' , aTypeOfAction , anOREntity mooseDescription superclass name
]

{ #category : #'creating action class' }
ORActionGenerator >> createActionFor: anOREntity type: action [
	| aClass |
	aClass := (self obtainActionSuperClass: anOREntity actionType: action)
		subclass: (self createActionClassNameWithType: action for: anOREntity) asSymbol
		uses: {}
		instanceVariableNames: ''
		classVariableNames: ''
		poolDictionaries: ''
		category: (self createClassCategoryName: anOREntity superclass).
	self createCommentToAnORAction: aClass.
	self generateRequiredMethods: aClass for: anOREntity
]

{ #category : #'running- public' }
ORActionGenerator >> createActionForORClass: anORClass [
	(anORClass isOrionClass and: [ anORClass isRootEntity not ])
		ifTrue: [ #(#Add #Remove #Move #Rename)
				do: [ :action | 
					(self isAction: action validFor: anORClass)
						ifTrue: [ self createActionFor: anORClass type: action ] ] ]
]

{ #category : #'running- public' }
ORActionGenerator >> createActionsForACollectionOfORClasses: aCollectionOfOREntities [
	aCollectionOfOREntities do: [ :anEntity | self createActionForORClass: anEntity ]
]

{ #category : #'creating action class' }
ORActionGenerator >> createCommentToAnORAction: anORAction [
	anORAction
		comment:
			(String
				streamContents: [ :aStream | 
					aStream
						nextPutAll: 'A ';
						nextPutAll: anORAction name;
						nextPutAll:
								' is a generated class useful to Orion. It corresponds to an action that can be performed on a type of model element. See OrionGenerator in Moose/Orion on SmalltalkHub for more information.' ])
]

{ #category : #'creating method' }
ORActionGenerator >> createGetterFor: aMethodName on: aClass classified: aCat [
	aClass compileSilently: aMethodName , String cr , String tab , '^ ' , aMethodName classified: aCat
]

{ #category : #'creating method' }
ORActionGenerator >> createSetterFor: aString on: aClass classified: aCat [
	aClass compileSilently: ('<1s>: aValue<r><t><1s> := aValue' expandMacrosWith: aString) classified: aCat
]

{ #category : #'creating method' }
ORActionGenerator >> generate1To1SetterFrom: property [
	^self
		withSelectorAndOppositeSelectorOfProperty: property
		streamContents: [ :selector :oppositeSelector :stream | 
			stream tab; << 'self '; << selector; cr.
			stream tab; tab; << 'ifNotNil: [ | theNewEntity |'; cr.
			stream tab; tab; tab; << 'theNewEntity := self orionModel retrieveEntity: '; << 'self '; << selector; << '.'; cr.
			stream tab; tab; tab; << 'newEntity private'; << selector capitalized asMutator; << ' theNewEntity orionCopy.'; cr.
			stream tab; tab; tab; << 'theNewEntity private'; << oppositeSelector capitalized asMutator; << ' newEntity orionCopy ].'; cr ]
]

{ #category : #'creating method' }
ORActionGenerator >> generate1ToNSetterFrom: property [
	^ self
		withSelectorAndOppositeSelectorOfProperty: property
		streamContents: [ :selector :oppositeSelector :stream | 
			stream tab; << 'self '; << selector; cr.
			stream tab; tab; << 'ifNotNil: [ | theNewEntity |'; cr.
			stream tab; tab; tab; << 'theNewEntity := self orionModel retrieveEntity: '; << 'self '; << selector; << '.'; cr.
			stream tab; tab; tab; << 'newEntity private'; << selector capitalized asMutator; << ' theNewEntity orionCopy.'; cr.
			stream tab; tab; tab; << 'theNewEntity private'; << oppositeSelector capitalized asMutator; << ' (theNewEntity private'; << oppositeSelector capitalized; << ' orionCopy unsafeAdd: newEntity) ].'; cr ]
]

{ #category : #'creating method' }
ORActionGenerator >> generateGettersAndSettersFrom: aCollectionOfFameProperties on: aClass withPackage: aFamePackage [
	| selector |
	aCollectionOfFameProperties
		do: [ :e | 
			| cat |
			selector := e implementingSelector.
			self addInstanceVariable: selector on: aClass.
			cat := self catNameFor: aFamePackage defaultName: 'accessing'.
			self createGetterFor: selector on: aClass classified: cat.
			self createSetterFor: selector on: aClass classified: cat ]
]

{ #category : #'creating method' }
ORActionGenerator >> generateNTo1SetterFrom: property [
	^ self
		withSelectorAndOppositeSelectorOfProperty: property
		streamContents: [ :selector :oppositeSelector :stream | 
			stream tab; << 'self '; << selector; cr.
			stream tab; tab; << 'ifNotNil: [ | theNewEntities |'; cr.
			stream tab; tab; tab; << 'theNewEntities := OrderedCollection withAll: (self '; << selector; << ' collect: [:e | self orionModel retrieveEntity: e ]).'; cr.
			stream tab; tab; tab; << 'newEntity private'; << selector capitalized asMutator; << ' theNewEntities orionCopy.'; cr.
			stream tab; tab; tab; << 'theNewEntities do: [:e | e private'; << oppositeSelector capitalized asMutator; << ' newEntity ] ].'; cr ]
]

{ #category : #'creating method' }
ORActionGenerator >> generateNToNSetterFrom: property [
	^ self
		withSelectorAndOppositeSelectorOfProperty: property
		streamContents: [ :selector :oppositeSelector :stream | 
			stream tab; << 'self '; << selector; cr.
			stream tab; tab; << 'ifNotNil: [ | theNewEntity |'; cr.
			stream tab; tab; tab; << 'self '; << selector ; << ' do: [ :anEntity | ';cr.
			stream tab; tab; tab; << 'theNewEntity := self orionModel retrieveEntity: anEntity.'; cr.
			stream tab; tab; tab; << 'newEntity private'; << selector capitalized asMutator; << ' (newEntity private'; << selector capitalized; << ' orionCopy unsafeAdd: theNewEntity).'; cr.
			stream tab; tab; tab; << 'theNewEntity private'; << oppositeSelector capitalized asMutator; << ' (theNewEntity private'; << oppositeSelector capitalized; << ' orionCopy unsafeAdd: newEntity) ] ] .'; cr ]
]

{ #category : #'creating method' }
ORActionGenerator >> generateRequiredMethods: aClass for: anOREntity [
	aClass generateRequiredMethodsFor: anOREntity generator: self
]

{ #category : #'creating method' }
ORActionGenerator >> generateRequiredMethods: anAction forAMovedEntity: anOREntity [
	| stream containerAttributes |
	(anOREntity mooseDescription inheritsFrom: FAMIXNamedEntity mooseDescription)
		ifFalse: [ ^ self ].	
	stream := WriteStream on: ''.
	stream << 'run'; cr; tab; << '<generated: true>'; cr.
	stream tab; << '| theEntity |'; cr.
	stream tab; << 'theEntity := self orionModel retrieveEntity: entity.'; cr.
	containerAttributes := anOREntity mooseDescription allContainerAttributes.
	self
		generateGettersAndSettersFrom: containerAttributes
		on: anAction
		withPackage: anOREntity mooseDescription package.
	anOREntity mooseDescription allContainerAttributes
		do: [ :aContainerProp | 
			stream tab; << 'self '; << aContainerProp implementingSelector; << ' ifNotNil: ['; cr.
			stream tab; tab; << '| theNewContainer |'; cr.
			stream tab tab << 'entity ' << aContainerProp implementingSelector.
			stream cr tab tab tab << 'ifNotNil: [ | theOldContainer |'.
			stream cr; tab; tab; tab; tab; << 'theOldContainer := self orionModel retrieveEntity: entity '; 
					<< aContainerProp implementingSelector; << '.'; cr.
			stream tab; tab; tab; tab; << 'theOldContainer private'; << aContainerProp opposite implementingSelector capitalized asMutator; 
					<< ' (theOldContainer private'; << aContainerProp opposite implementingSelector capitalized; 
					<< ' orionCopy orionRemove: theEntity) ].'; cr.
			stream tab; tab; << 'theNewContainer := self orionModel retrieveEntity: self '; << aContainerProp implementingSelector; 
					<< '.'; cr.
			stream tab; tab; << 'theEntity private'; << aContainerProp implementingSelector capitalized asMutator; 
					<< ' theNewContainer.'; cr.
			stream tab; tab; << 'theNewContainer private'; << aContainerProp opposite implementingSelector capitalized asMutator; 
					<< ' (theNewContainer private'; << aContainerProp opposite implementingSelector capitalized; 
					<< ' orionCopy unsafeAdd: theEntity)'; cr.
			stream tab; << '].'; cr ].
	stream tab << 'theEntity resetMooseName.'.
	stream cr tab; << '^ theEntity'.
	anAction compileSilently: stream contents classified: 'method execution - generated'
]

{ #category : #'creating method' }
ORActionGenerator >> generateRequiredMethods: anAction forARemovedEntity: anOREntity [
	self
		applyGenerationOfActionsOn: anOREntity mooseDescription allComplexAttributesWithOpposite
		onBlock: [ :assoc | 
			self
				generateRequiredMethods: anAction
				forARemovedEntity: anOREntity
				withPackage: assoc key
				withProps: assoc value ]
]

{ #category : #'creating method' }
ORActionGenerator >> generateRequiredMethods: anAction forARemovedEntity: anOREntity withPackage: aFamePackage withProps: aCollectionOfProperties [
	| oneToNPropsToRemoveOnTheOtherSide childrenPropsToRemoveInCascade stream cat |
	"methodName"
	stream := WriteStream on: ''.
	oneToNPropsToRemoveOnTheOtherSide := self oneToNProperties: aCollectionOfProperties.
	childrenPropsToRemoveInCascade := aCollectionOfProperties select: [ :e | e isChildrenProperty or: [ e type isAssociation ] ].
	self writeMethodHeaderOn: stream withPackage: aFamePackage withDeclaredVariable: nil.
	aFamePackage
		ifNil: [ stream tab
				<< 'entity := self orionModel retrieveEntity: entity.';
				cr ].
	childrenPropsToRemoveInCascade
		do: [ :prop | 
			stream
				<<
					('<t>entity <1s> <2?do:ifNotNil>: [ :e | e deleteInAction: self ].<r>'
						expandMacrosWith: prop implementingSelector asString
						with: prop isMultivalued) ].
	oneToNPropsToRemoveOnTheOtherSide
		do: [ :prop | 
			stream
				<<
					('<t>entity <1s><r><t><t>ifNotNil: [ | theEntity |<r><t><t><t>theEntity := self orionModel retrieveEntity: entity <1s>.<r>'
						expandMacrosWith: prop implementingSelector asString).
			stream
				<<
					('<t><t><t>theEntity private<1s>: (theEntity private<1s> orionCopy orionRemove: entity) ].<r>'
						expandMacrosWith: prop opposite implementingSelector capitalized) ].
	aFamePackage
		ifNil: [ stream tab << 'self runExtendedPropertiesForEntity: entity.'.
			stream cr tab << 'self orionModel remove: entity' ].
	cat := self catNameFor: aFamePackage defaultName: 'method execution'.
	anAction compileSilently: stream contents classified: cat
]

{ #category : #'creating method' }
ORActionGenerator >> generateRequiredMethods: anAction forARenamedEntity: anOREntity [
	| stream |
	(anOREntity mooseDescription inheritsFrom: FAMIXNamedEntity mooseDescription)
		ifFalse: [ ^ self ].
	stream := WriteStream on: ''.
	stream << 'run'; cr.
	stream tab; << '<generated: true>'; cr.
	stream tab; << '| theEntity |'; cr.
	stream tab; << 'super run.'; cr.
	stream tab; << 'theEntity := (self orionModel retrieveEntity: entity).'; cr.
	stream tab; << 'theEntity name: newName.'; cr.
	stream tab; << 'entity := theEntity.'; cr.
	stream tab; << '^ entity'.
	anAction compileSilently: stream contents classified: 'method exectution - generated'
]

{ #category : #'creating method' }
ORActionGenerator >> generateRequiredMethods: anAction forAnAddEntity: anOREntity [
	self
		applyGenerationOfActionsOn: anOREntity mooseDescription allAttributes
		onBlock: [ :assoc | 
			self
				generateRequiredMethods: anAction
				forAnAddedEntity: anOREntity
				withPackage: assoc key
				withProps: assoc value ]
]

{ #category : #'creating method' }
ORActionGenerator >> generateRequiredMethods: anAction forAnAddedEntity: anOREntity withPackage: aFamePackage withProps: listOfProperties [
	| stringProperties stream multivalueLinkProperties propsWithSetters cat |
	"(aClass methodDict includesKey: #run)
		ifTrue: [ ^ self ]."
	
	propsWithSetters := aFamePackage ifNil: [ self selectPropertiesAmong: listOfProperties ] ifNotNil: [ self selectExtendedPropertiesAmong: listOfProperties ].
	self generateGettersAndSettersFrom: propsWithSetters on: anAction withPackage: aFamePackage.
	stringProperties := self settingOfPropertiesFrom: (propsWithSetters select: [ :e | e type isPrimitive ]).
	multivalueLinkProperties := self setLinksFrom: (propsWithSetters reject: [ :e | e type isPrimitive ]).
	stream := WriteStream on: ''.
	self writeMethodHeaderOn: stream withPackage: aFamePackage withDeclaredVariable: 'newEntity'.
	aFamePackage
		ifNil: [ stream tab; << 'newEntity := '; << anOREntity name; << ' new.'; cr.
			stream tab; << 'self orionModel add: newEntity.'; cr ].
	anOREntity hasUniqueMooseNameInModel
		ifTrue: [ stream << 'newEntity name: self newName.'; cr ].
	stream tab; << '"Set primitive not derived properties of the entity"'; cr.
	stringProperties do: [ :propertiesSettingString | stream << propertiesSettingString; cr ].
	stream tab; << '"Set complex not derived properties of the entity"'; cr.
	multivalueLinkProperties do: [ :propertiesSettingString | stream << propertiesSettingString ] separatedBy: [ stream cr ].
	anOREntity hasUniqueMooseNameInModel
		ifTrue: [ stream << 'newEntity resetMooseName.'; cr ].
	aFamePackage
		ifNil: [ stream tab; << 'self runExtendedPropertiesForEntity: newEntity.'; cr.
			stream tab; << 'entity := newEntity.'; cr; tab; << '^ entity' ].
	cat := self catNameFor: aFamePackage defaultName: 'method execution'.
	anAction compileSilently: stream contents classified: cat
]

{ #category : #preparation }
ORActionGenerator >> isAction: action validFor: anOREntity [
	action = #Move
		ifTrue: [ ^ (anOREntity inheritsFrom: FAMIXAssociation) not ].
	action = #Rename
		ifTrue: [ ^ anOREntity inheritsFrom: FAMIXNamedEntity ].
	^ true
]

{ #category : #preparation }
ORActionGenerator >> obtainActionSuperClass: anOREntity actionType: anActionType [
	^ anActionType = #Add
		ifTrue: [ (anOREntity inheritsFrom: FAMIXAssociation)
				ifTrue: [ ORActionAddLink ]
				ifFalse: [ ORActionAddEntity ] ]
		ifFalse: [ Smalltalk globals at: ('ORAction' , anActionType) asSymbol ]
]

{ #category : #'creating method' }
ORActionGenerator >> oneToNProperties: aCollectionOfProperties [
	^ aCollectionOfProperties
		select: [ :e | e isMultivalued not and: [ e opposite isMultivalued ] ]
]

{ #category : #'creating method' }
ORActionGenerator >> setLinksFrom: aFM3MetaDescription [
	^ aFM3MetaDescription
		collect: [ :property | 
			| result |
			property opposite
				ifNil: [ self halt.
					nil ]
				ifNotNil: [ (property isMultivalued not and: [ property opposite isMultivalued ])
						ifTrue: [ result := self generate1ToNSetterFrom: property ].
					(property isMultivalued and: [ property opposite isMultivalued ])
						ifTrue: [ result := self generateNToNSetterFrom: property ].
					(property isMultivalued and: [ property opposite isMultivalued not ])
						ifTrue: [ result := self generateNTo1SetterFrom: property ].
					(property isMultivalued not and: [ property opposite isMultivalued not ])
						ifTrue: [ result := self generate1To1SetterFrom: property ].
					result ] ]
		thenSelect: #isNotNil
]

{ #category : #'creating method' }
ORActionGenerator >> settingOfPropertiesFrom: listOfProperties [
	^ listOfProperties
		collect: [ :propertyNotDerived | 
			(propertyNotDerived isMultivalued
				ifTrue: [ '<t>self <1s> isEmptyOrNil ifFalse: [ <r><t><t>newEntity private<2s>: self <1s> orionCopy ].<r>' ]
				ifFalse: [ '<t>self <1s> ifNotNil: [ :e | <r><t><t>newEntity private<2s>: e orionCopy ].<r>' ])
				expandMacrosWith: propertyNotDerived implementingSelector
				with: propertyNotDerived implementingSelector capitalized ]
]

{ #category : #accessing }
ORActionGenerator >> typeOfGeneratedObject [
	^ 'Action'
]

{ #category : #helper }
ORActionGenerator >> withSelectorAndOppositeSelectorOfProperty: property streamContents: aBlock [
	| selector oppositeSelector |
	selector := property implementingSelector.
	oppositeSelector := property opposite implementingSelector.
	^ String streamContents: [ :stream | aBlock value: selector value: oppositeSelector value: stream ]
]

{ #category : #'creating method' }
ORActionGenerator >> writeMethodHeaderOn: stream withPackage: aFamePackage [
	aFamePackage
		ifNil: [ stream << 'run'; cr ]
		ifNotNil: [ stream << 'runOn'; << aFamePackage name; << 'Extension'; cr; tab; << '<toRun>'; cr ].
	stream tab; << '<generated: true>'; cr.
	aFamePackage ifNil: [ stream tab; << 'super run.'; cr ]
]

{ #category : #'creating method' }
ORActionGenerator >> writeMethodHeaderOn: stream withPackage: aFamePackage withDeclaredVariable: stringOfVariables [
	aFamePackage
		ifNil: [ stream << 'run'; cr ]
		ifNotNil: [ stream << 'runOn'; << aFamePackage name; << 'Extension: '; << (stringOfVariables ifNil: ['anEntity']); cr.
			stream tab; << '<toRun>'; cr ].
	stream tab; << '<generated: true>'; cr.
	(aFamePackage isNil and: [ stringOfVariables isNotNil ])
		ifTrue: [ stream tab; << '| '; << stringOfVariables; << ' |'; cr ].
	aFamePackage ifNil: [ stream tab; << 'super run.'; cr ]
]
