creating method
generateRequiredMethods: anAction forARemovedEntity: anOREntity
	self
		applyGenerationOfActionsOn: anOREntity mooseDescription allComplexAttributesWithOpposite
		onBlock: [ :assoc | 
			self
				generateRequiredMethods: anAction
				forARemovedEntity: anOREntity
				withPackage: assoc key
				withProps: assoc value ]