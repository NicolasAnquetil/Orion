*OrionBrowser
rename: aString inModel: aModelVersion

	^aString  ifNotNil: [ 
		(ORActionRenameClass new
			orionModel: aModelVersion ;
			entity: self ;
			newName: aString )
		manualRun; postRun ]