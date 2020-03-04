tests
testSetOfAddNamespace
	self modelMerger targetModel add: (FAMIXNamespace new name: 'Namespace2').
	self assert: self modelMerger baseModel isNotEmpty.
	self modelMerger run.
	self assert: self modelMerger result setOfAddScopingEntityChanges isNotNil.
	self assert: self modelMerger result setOfAddScopingEntityChanges size equals: 1