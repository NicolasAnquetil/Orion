creating method
generateRequiredMethods: anAction forAnAddedEntity: anOREntity withPackage: aFamePackage withProps: listOfProperties
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