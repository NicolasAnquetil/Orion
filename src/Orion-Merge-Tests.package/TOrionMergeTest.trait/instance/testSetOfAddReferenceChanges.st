tests-set
testSetOfAddReferenceChanges
	
	| meth  |

	meth := self modelMerger targetModel entityNamed: 'Smalltalk::A3diff.b3()'.
	FAMIXReference new source: meth ; target: (self modelMerger targetModel entityNamed: 'Smalltalk::B3diff').
	self diff.
	self modelMerger orionVersionedModel: (self modelMerger baseModel createNewChildVersion).

	self assert: (self modelMerger result setOfAddReferenceChanges) notNil.
	self assert: self modelMerger result setOfAddReferenceChanges size equals:  (self diff assocChanges count: [ :e | e isAddition and: [ e entity isReference ] ]).


	