private-run
createRemoveAnnotationType
	self result setOfRemoveAnnotationTypeChanges
		do: [ :chg | chg entity deleteInModel: self orionVersionedModel ]