method execution - generated
run
	<generated: true>
	super run.
	entity := self orionModel retrieveEntity: entity.
	self runExtendedPropertiesForEntity: entity.
	self orionModel remove: entity