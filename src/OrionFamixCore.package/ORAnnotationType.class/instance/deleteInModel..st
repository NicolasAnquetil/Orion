as yet unclassified
deleteInModel: aModelVersion 
	(ORActionRemoveAnnotationType  new
		orionModel: aModelVersion;
		entity: self)
		manualRun;
		postRun