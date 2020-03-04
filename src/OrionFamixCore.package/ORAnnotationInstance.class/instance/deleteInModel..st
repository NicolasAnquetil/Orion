as yet unclassified
deleteInModel: aModelVersion
	(ORActionRemoveAnnotationInstance new
		orionModel: aModelVersion;
		entity: self;
		yourself)
		manualRun;
		postRun