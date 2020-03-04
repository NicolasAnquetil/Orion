creating method
generateNToNSetterFrom: property
	^ self
		withSelectorAndOppositeSelectorOfProperty: property
		streamContents: [ :selector :oppositeSelector :stream | 
			stream tab; << 'self '; << selector; cr.
			stream tab; tab; << 'ifNotNil: [ | theNewEntity |'; cr.
			stream tab; tab; tab; << 'self '; << selector ; << ' do: [ :anEntity | ';cr.
			stream tab; tab; tab; << 'theNewEntity := self orionModel retrieveEntity: anEntity.'; cr.
			stream tab; tab; tab; << 'newEntity private'; << selector capitalized asMutator; << ' (newEntity private'; << selector capitalized; << ' orionCopy unsafeAdd: theNewEntity).'; cr.
			stream tab; tab; tab; << 'theNewEntity private'; << oppositeSelector capitalized asMutator; << ' (theNewEntity private'; << oppositeSelector capitalized; << ' orionCopy unsafeAdd: newEntity) ] ] .'; cr ]