*OrionBrowser
rename: aString inModel: aModelVersion

	^aString  ifNotNil: [ 
		(ORActionRenameMethod new
			orionModel: aModelVersion ;
			entity: self ;
			newName: aString )
		manualRun; postRun ]