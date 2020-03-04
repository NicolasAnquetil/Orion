*OrionBrowser
addAttributeNamed: aString inModel: aModelVersion

	^aString  ifNotNil: [ 
		(ORActionAddAttribute new
			orionModel: aModelVersion ;
			parentType: self ;
			name: aString )
		manualRun; postRun ]