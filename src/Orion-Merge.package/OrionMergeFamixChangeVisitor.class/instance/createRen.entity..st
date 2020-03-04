generic actions
createRen: descr entity: aFamixRenameChange
	| changeAction |
	changeAction := ('ORActionRename' , descr superclass name) asClass new.
	changeAction orionModel: self orionVersionedModel.
	changeAction newName: aFamixRenameChange targetEntity name.
	changeAction entity: aFamixRenameChange entity.
	changeAction
		manualRun;
		postRun