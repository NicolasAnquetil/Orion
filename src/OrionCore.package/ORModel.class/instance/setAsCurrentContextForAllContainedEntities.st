initialization
setAsCurrentContextForAllContainedEntities
	self do: [ :entity | entity currentContext: self ]