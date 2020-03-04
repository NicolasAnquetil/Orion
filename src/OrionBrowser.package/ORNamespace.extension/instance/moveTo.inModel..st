*OrionBrowser
moveTo: aNamespace inModel: aModelVersion
	
	^(ORActionMoveNamespace new
		orionModel: aModelVersion ;
		entity: self ;
		parentScope: aNamespace )
	manualRun;
	postRun