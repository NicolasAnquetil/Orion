method execution
run
	| oldEntity |
	oldEntity := entity.
	super run.
	entity ifNil: [ OREntityNotFoundInCurrentModel signal: oldEntity model: self orionModel ]