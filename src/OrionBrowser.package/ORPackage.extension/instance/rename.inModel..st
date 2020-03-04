*OrionBrowser
rename: aString inModel: aModelVersion

	^aString  ifNotNil: [ 
		(ORActionRenamePackage new
			orionModel: aModelVersion ;
			entity: self ;
			newName: aString )
		manualRun; postRun ]