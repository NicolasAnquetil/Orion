*OrionBrowser
addMethodNamed: aString inModel: aModelVersion

	aString  ifNotNil: [ 
		(ORActionAddMethod new
			orionModel: aModelVersion ;
			parentType: self ;
			name: aString )
		manualRun; postRun ]