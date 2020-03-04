tests-create
testCreateRemoveAnnotation
	| method annotationType annotationsInstancesBaseModel |
	method := self modelMerger baseModel
		entityNamed: 'Smalltalk::A3diff.c3()'.
	annotationType := (ORActionAddAnnotationType new
		orionModel: self modelMerger baseModel;
		container: method;
		name: 'newAnnotationType') run.
	(ORActionAddAnnotationInstance new
		orionModel: self modelMerger baseModel;
		annotatedEntity: method;
		annotationType: 'newAnnotationType') run.
		self diff.
	annotationsInstancesBaseModel := (self modelMerger baseModel
		entityNamed: 'Smalltalk::A3diff.c3()') annotationInstances.
	self assert: annotationsInstancesBaseModel size equals: 1.
	self
		assert: annotationsInstancesBaseModel first annotatedEntity isNotNil.
	self
		assert: annotationsInstancesBaseModel first annotatedEntity name
		equals: 'c3'.
	self
		assert: annotationsInstancesBaseModel first annotationType name
		equals: 'newAnnotationType'.
	self
		assert:
			(self modelMerger orionVersionedModel
				entityNamed: 'Smalltalk::A3diff.c3()') annotationInstances isEmpty