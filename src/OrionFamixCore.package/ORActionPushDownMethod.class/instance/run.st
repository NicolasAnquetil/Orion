method execution
run
	| asAction |
	super run.
	
	asAction := ORActionMoveMethod new
					parentAction: self ;
					orionModel: self orionModel;
					entity: self entity;
					newContainer:self newContainer.
	^asAction run.
		

