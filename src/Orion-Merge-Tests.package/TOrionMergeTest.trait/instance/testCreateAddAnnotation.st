tests-create
testCreateAddAnnotation
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
	self assert: (self modelMerger baseModel entityNamed: 'Smalltalk::A3diff.c3()') annotationInstances size equals: 0.
	self assert: (self modelMerger orionVersionedModel entityNamed: 'Smalltalk::A3diff.c3()') annotationInstances size equals: 1