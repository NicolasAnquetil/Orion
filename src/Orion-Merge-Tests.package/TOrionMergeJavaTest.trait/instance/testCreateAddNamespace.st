tests
testCreateAddNamespace
	self modelMerger targetModel add: (FAMIXNamespace new name: 'Namespace2').
	self assert: self modelMerger baseModel notEmpty.
	self modelMerger run.
	self modelMerger orionVersionedModel: self modelMerger baseModel createNewChildVersion.
	self mooseModelMerge createAddScopingEntity.
	self assert: (self modelMerger baseModel entityNamed: 'Namespace2') isNil.
	self assert: (self modelMerger orionVersionedModel entityNamed: 'Namespace2') notNil