method execution
run
	| thePackage theNewPackage |
	super run.
	thePackage := self orionModel retrieveEntity: entity.
	theNewPackage := self orionModel retrieveEntity: newContainer.
	theNewPackage name: theNewPackage name , thePackage name.
	thePackage allClasses
		do: [ :aClass | 
			| asAction |
			asAction := ORActionMoveClass new
				parentAction: self;
				orionModel: self orionModel;
				entity: aClass;
				newContainer: theNewPackage.
			asAction run ].
	thePackage extensionMethods
		do: [ :aMethod | 
			| asAction |
			asAction := ORActionExtendMethod new
				parentAction: self;
				orionModel: self orionModel;
				entity: aMethod.
			aMethod parentType parentPackage = theNewPackage
				ifFalse: [ asAction newContainer: theNewPackage ].
			asAction run ].
	self orionModel remove: thePackage