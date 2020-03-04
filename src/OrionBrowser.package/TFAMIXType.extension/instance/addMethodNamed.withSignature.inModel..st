*OrionBrowser
addMethodNamed: aString withSignature: aSignature inModel: aModelVersion

	aString  ifNotNil: [ 
		(ORActionAddMethod new
			orionModel: aModelVersion ;
			parentType: self ;
			name: aString ;
			signature: aSignature)
		manualRun; postRun ]