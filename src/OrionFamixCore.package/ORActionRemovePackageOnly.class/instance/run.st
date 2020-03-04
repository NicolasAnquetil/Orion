method execution
run
	| pack namespace|

	entity parentPackage ifNotNil: [
		pack := (self orionModel retrieveEntity: entity parentPackage).
		pack privateChildNamedEntities:  (pack privateChildNamedEntities orionCopy orionRemove: entity).
	].
	entity parentScope ifNotNil:[
		namespace := (self orionModel retrieveEntity: entity parentScope).
		namespace privateChildScopes:  (namespace privateChildScopes orionCopy orionRemove: entity).
	].

	self orionModel remove: entity.
	
