method execution - generated
run
	<generated: true>
	| newEntity |
	super run.
	newEntity := ORAnnotationInstanceAttribute new.
	self orionModel add: newEntity.
	"Set primitive not derived properties of the entity"
	self value ifNotNil: [ :e | 
		newEntity privateValue: e orionCopy ].

	"Set complex not derived properties of the entity"
	self comments
		ifNotNil: [ | theNewEntities |
			theNewEntities := OrderedCollection withAll: (self comments collect: [:e | self orionModel retrieveEntity: e ]).
			newEntity privateComments: theNewEntities orionCopy.
			theNewEntities do: [:e | e privateContainer: newEntity ] ].

	self parentAnnotationInstance
		ifNotNil: [ | theNewEntity |
			theNewEntity := self orionModel retrieveEntity: self parentAnnotationInstance.
			newEntity privateParentAnnotationInstance: theNewEntity orionCopy.
			theNewEntity privateAttributes: (theNewEntity privateAttributes orionCopy unsafeAdd: newEntity) ].

	self annotationTypeAttribute
		ifNotNil: [ | theNewEntity |
			theNewEntity := self orionModel retrieveEntity: self annotationTypeAttribute.
			newEntity privateAnnotationTypeAttribute: theNewEntity orionCopy.
			theNewEntity privateAnnotationAttributeInstances: (theNewEntity privateAnnotationAttributeInstances orionCopy unsafeAdd: newEntity) ].

	self declaredSourceLanguage
		ifNotNil: [ | theNewEntity |
			theNewEntity := self orionModel retrieveEntity: self declaredSourceLanguage.
			newEntity privateDeclaredSourceLanguage: theNewEntity orionCopy.
			theNewEntity privateSourcedEntities: (theNewEntity privateSourcedEntities orionCopy unsafeAdd: newEntity) ].

	self sourceAnchor
		ifNotNil: [ | theNewEntity |
			theNewEntity := self orionModel retrieveEntity: self sourceAnchor.
			newEntity privateSourceAnchor: theNewEntity orionCopy.
			theNewEntity privateElement: newEntity orionCopy ].
	self runExtendedPropertiesForEntity: newEntity.
	entity := newEntity.
	^ entity