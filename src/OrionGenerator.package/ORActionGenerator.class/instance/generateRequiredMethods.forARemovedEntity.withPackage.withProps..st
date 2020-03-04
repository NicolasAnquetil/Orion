creating method
generateRequiredMethods: anAction forARemovedEntity: anOREntity withPackage: aFamePackage withProps: aCollectionOfProperties
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