tests-set
testSetOfAddAnnotationInstanceChanges
	| method annotationType |
	method := self modelMerger targetModel entityNamed: 'Smalltalk::A3diff.c3()'.
	annotationType := FAMIXAnnotationType named: 'newAnnotationType'.
	self modelMerger targetModel add: annotationType.
	self modelMerger targetModel
		add:
			(FAMIXAnnotationInstance new
				annotatedEntity: method;
				annotationType: annotationType;
				yourself).
	self diff.
	self modelMerger orionVersionedModel: self modelMerger baseModel createNewChildVersion.
	self assert: self modelMerger result setOfAddAnnotationInstanceChanges isNotNil.
	self assert: self modelMerger result setOfAddAnnotationInstanceChanges size equals: (self diff entityChanges count: [ :e | e isAddition and: [ e entity isAnnotationInstance ] ])