tests-set
testSetOfAddAttributeChanges
	| att |
	att := FAMIXAttribute new
		name: 'attAdded';
		yourself.
	self modelMerger targetModel add: att.
	(self modelMerger targetModel entityNamed: 'Smalltalk::A3diff') addAttribute: att.
	self diff.
	self modelMerger orionVersionedModel: self modelMerger baseModel createNewChildVersion.
	self assert: self modelMerger result setOfAddAttributeChanges isNotNil.
	self assert: self modelMerger result setOfAddAttributeChanges size equals: (self diff count: [ :e | e isAddition and: [ e entity isAttribute ] ])