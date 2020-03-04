creating method
generateNTo1SetterFrom: property
	^ self
		withSelectorAndOppositeSelectorOfProperty: property
		streamContents: [ :selector :oppositeSelector :stream | 
			stream tab; << 'self '; << selector; cr.
			stream tab; tab; << 'ifNotNil: [ | theNewEntities |'; cr.
			stream tab; tab; tab; << 'theNewEntities := OrderedCollection withAll: (self '; << selector; << ' collect: [:e | self orionModel retrieveEntity: e ]).'; cr.
			stream tab; tab; tab; << 'newEntity private'; << selector capitalized asMutator; << ' theNewEntities orionCopy.'; cr.
			stream tab; tab; tab; << 'theNewEntities do: [:e | e private'; << oppositeSelector capitalized asMutator; << ' newEntity ] ].'; cr ]