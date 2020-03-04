*OrionBrowser
simplyMoveTo: aPackage inAction: anAction

	^(ORActionSimplyMoveClass new
		parentAction: anAction ;
		orionModel: anAction orionModel  ;
		entity: self ;
		newContainer: aPackage )
		run. 
