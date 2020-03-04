*OrionBrowser
rename: aString inModel: aModelVersion

	^aString  ifNotNil: [ 
		(ORActionRenameAttribute new
			orionModel: aModelVersion ;
			entity: self ;
			newName: aString )
		manualRun; postRun ]