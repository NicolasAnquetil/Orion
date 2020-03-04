creating method
generateRequiredMethods: anAction forAnAddEntity: anOREntity
	self
		applyGenerationOfActionsOn: anOREntity mooseDescription allAttributes
		onBlock: [ :assoc | 
			self
				generateRequiredMethods: anAction
				forAnAddedEntity: anOREntity
				withPackage: assoc key
				withProps: assoc value ]