tests-set
testSetOfMoveAttributeChanges
	| att |
	"In order to determine that an attribute has moved it needs to get at least 3 accesses to it"
	"creation of the attribute and the 3 accesses in the source model"
	att := FAMIXAttribute new
		name: 'attAdded';
		yourself.
	self modelMerger targetModel add: att.
	(self modelMerger targetModel entityNamed: 'Smalltalk::A3diff') addAttribute: att.
	FAMIXAccess new
		variable: att;
		accessor: (self modelMerger targetModel entityNamed: 'Smalltalk::A3diff.b3()').
	FAMIXAccess new
		variable: att;
		accessor: (self modelMerger targetModel entityNamed: 'Smalltalk::A3diff.c3()').
	FAMIXAccess new
		variable: att;
		accessor: (self modelMerger targetModel entityNamed: 'Smalltalk::B3diff.c3()').

	"creation of the attribute and the 3 accesses in the target model"
	(self modelMerger baseModel entityNamed: 'Smalltalk::A4diff') addAttributeNamed: 'attAdded' inModel: self modelMerger baseModel.
	(self modelMerger baseModel entityNamed: 'Smalltalk::A3diff.b3()') addAccessTo: (self modelMerger baseModel entityNamed: 'Smalltalk::A4diff.attAdded') inModel: self modelMerger baseModel.
	(self modelMerger baseModel entityNamed: 'Smalltalk::A3diff.c3()') addAccessTo: (self modelMerger baseModel entityNamed: 'Smalltalk::A4diff.attAdded') inModel: self modelMerger baseModel.
	(self modelMerger baseModel entityNamed: 'Smalltalk::B3diff.c3()') addAccessTo: (self modelMerger baseModel entityNamed: 'Smalltalk::A4diff.attAdded') inModel: self modelMerger baseModel.
	self diff.
	self modelMerger orionVersionedModel: self modelMerger baseModel createNewChildVersion.
	self assert: self modelMerger result setOfMoveAttributeChanges notNil.
	self assert: self modelMerger result setOfMoveAttributeChanges size equals: 1.
	self assert: (self modelMerger result setOfMoveAttributeChanges collect: [ :e | e entity mooseName = 'Smalltalk::A3diff.attAdded' ]) notNil