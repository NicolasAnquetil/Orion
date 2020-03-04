generic actions
createAdd: descr entity: aFamixAddChange
	| entity changeAction className |
	entity := aFamixAddChange entity.
	descr implementingClass isOrionClass ifTrue: [ className := descr superclass name ] ifFalse: [ className := descr name ].
	changeAction := ('ORActionAdd' , className) asClass new.
	changeAction orionModel: self orionVersionedModel.
	descr allAttributesNotDerived
		collect: [ :e | e -> (self setProperty: e from: entity to: changeAction) ].
	changeAction
		manualRun;
		postRun