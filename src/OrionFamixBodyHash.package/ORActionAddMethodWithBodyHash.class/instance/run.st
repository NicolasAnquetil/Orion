method execution - generated
run
	self runOR: self orionModel.
	entity := self orionModel retrieveEntity: entity.
	entity bodyHash: self bodyHash orionCopy.
	^ entity