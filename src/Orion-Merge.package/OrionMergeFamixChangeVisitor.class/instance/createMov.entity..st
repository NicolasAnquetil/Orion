generic actions
createMov: descr entity: aFamixMoveChange
	| changeAction entity |
	entity := aFamixMoveChange entity.
	changeAction := ('ORActionMove' , descr superclass name) asClass new.
	changeAction orionModel: self orionVersionedModel.
	descr allContainerAttributes do: [ :e | self setProperty: e from: entity to: changeAction ].
	changeAction entity: entity.
	changeAction
		manualRun;
		postRun