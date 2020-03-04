private-run
createRemoveAnnotationInstance
	self result setOfRemoveAnnotationInstanceChanges 
		do: [ :chg | chg entity deleteInModel: self orionVersionedModel ]