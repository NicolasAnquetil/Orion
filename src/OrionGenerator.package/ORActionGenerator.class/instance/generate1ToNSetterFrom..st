creating method
generate1ToNSetterFrom: property
	^ self
		withSelectorAndOppositeSelectorOfProperty: property
		streamContents: [ :selector :oppositeSelector :stream | 
			stream tab; << 'self '; << selector; cr.
			stream tab; tab; << 'ifNotNil: [ | theNewEntity |'; cr.
			stream tab; tab; tab; << 'theNewEntity := self orionModel retrieveEntity: '; << 'self '; << selector; << '.'; cr.
			stream tab; tab; tab; << 'newEntity private'; << selector capitalized asMutator; << ' theNewEntity orionCopy.'; cr.
			stream tab; tab; tab; << 'theNewEntity private'; << oppositeSelector capitalized asMutator; << ' (theNewEntity private'; << oppositeSelector capitalized; << ' orionCopy unsafeAdd: newEntity) ].'; cr ]