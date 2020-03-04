as yet unclassified
deleteInModel: aModelVersion
	(ORActionRemoveUnknownVariable new
		orionModel: aModelVersion;
		entity: self)
		manualRun;
		postRun