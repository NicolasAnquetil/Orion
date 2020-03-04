tests-expected failures
testSetOfRenamePackageChanges
	<expectedFailure>
	(self modelMerger targetModel entityNamed: 'Moose-TestResources-ModelDiff-P3') name: 'totoPackage'.
	self diff.
	self modelMerger orionVersionedModel: self modelMerger baseModel createNewChildVersion.
	self assert: self modelMerger result setOfRenamePackageChanges isNotNil.
	self assert: self modelMerger result setOfRenamePackageChanges size equals: (self diff count: [ :e | e isRemoval and: [ e entity isPackage ] ]).
	self assert: (self modelMerger result setOfRenamePackageChanges collect: [ :e | e entity name = 'Moose-TestResources-ModelDiff-P3' ]) isNotNil.
	self assert: (self modelMerger result setOfRenamePackageChanges collect: [ :e | e targetEntity name = 'totoPackage' ]) isNotNil