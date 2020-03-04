generic actions
visitBodyChange: aBodyChange
	| changeAction |
	changeAction := ORActionAddMethodWithBodyHash new.
	changeAction orionModel: self orionVersionedModel.
	changeAction entity: aBodyChange entity.
	changeAction bodyHash: aBodyChange targetEntity bodyHash.
	changeAction
		manualRun;
		postRun