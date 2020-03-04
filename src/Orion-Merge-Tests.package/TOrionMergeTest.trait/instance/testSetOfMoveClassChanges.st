tests-set
testSetOfMoveClassChanges
	| fmxEntity |
	"moving A3 into P2"
	(self modelMerger targetModel entityNamed: 'Smalltalk::A3diff') parentPackage: (self modelMerger targetModel entityNamed: 'Moose-TestResources-ModelDiff-P2').
	fmxEntity := FAMIXMethod new
		name: 'b2';
		signature: 'b2()';
		parentType: (self modelMerger targetModel entityNamed: 'Smalltalk::B3diff').
	self modelMerger targetModel add: fmxEntity.
	self diff.
	self modelMerger orionVersionedModel: self modelMerger baseModel createNewChildVersion.
	self assert: self modelMerger result setOfMoveClassChanges notNil.
	self assert: self modelMerger result setOfMoveClassChanges size equals: 1.
	self assert: (self modelMerger result setOfMoveClassChanges collect: [ :e | e entity mooseName = 'Smalltalk::A3diff' ]) notNil