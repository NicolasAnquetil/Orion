as yet unclassified
deleteInAction: anAction
	ORActionRemoveAnnotationInstance new parentAction: anAction; orionModel: anAction orionModel; entity: self; run ; postRun