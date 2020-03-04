*OrionBrowser
addAttributeNamed: aString inAction: anAction

	aString  ifNotNil: [ 
		(ORActionAddAttribute new
			parentAction: anAction ;
			orionModel: anAction orionModel ;
			parentType: self ;
			name: aString )
		run ]