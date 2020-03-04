tests-set
testSetOfAddAnnotationTypeChanges
	| var2 |
	self modelMerger targetModel add: (FAMIXAnnotationType named: 'newAnnotationType').
	self diff.
	self modelMerger orionVersionedModel: self modelMerger baseModel createNewChildVersion.
	self assert: self modelMerger result setOfAddAnnotationTypeChanges isNotNil.
	self
		assert: self modelMerger result setOfAddAnnotationTypeChanges size
		equals: (self diff entityChanges count: [ :e | e isAddition and: [ e entity isAnnotationType ] ])