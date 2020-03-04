as yet unclassified
deleteInModel: aModel
	ORActionRemoveAnnotationTypeAttribute new
		orionModel: aModel;
		entity: self; 
		run;
		postRun