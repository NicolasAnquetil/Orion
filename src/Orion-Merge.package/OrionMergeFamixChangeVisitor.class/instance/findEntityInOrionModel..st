private
findEntityInOrionModel: entity
	entity mooseName = #noname
		ifTrue: [ 
			"Retrieve the parent and then the entity"
			| fm3Description parent |
			fm3Description := (entity mooseDescription allContainerAttributes) first.
			parent := self orionVersionedModel entityNamed: (entity perform: fm3Description implementingSelector) mooseName withType: (entity perform: fm3Description implementingSelector) class.
			(parent notNil and: [ fm3Description opposite isMultivalued not ]) ifTrue: [ ^ parent perform: fm3Description opposite implementingSelector ]].
	^ self orionVersionedModel entityNamed: entity mooseName withType: (self orionClassOf: entity class)