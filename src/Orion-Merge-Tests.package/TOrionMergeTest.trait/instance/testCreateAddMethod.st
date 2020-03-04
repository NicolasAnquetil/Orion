tests-create
testCreateAddMethod
	| meth |
	meth := FAMIXMethod new
		name: 'toto';
		yourself.
	self modelMerger targetModel add: meth.
	(self modelMerger targetModel entityNamed: 'Smalltalk::A3diff') addMethod: meth.
	self diff.
	self assert: (self modelMerger baseModel entityNamed: 'Smalltalk::A3diff.toto') isNil.
	self assert: (self modelMerger orionVersionedModel entityNamed: 'Smalltalk::A3diff.toto') notNil.