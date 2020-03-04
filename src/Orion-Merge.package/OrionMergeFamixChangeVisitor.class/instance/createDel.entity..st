generic actions
createDel: descr entity: aFamixRemovalChange
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