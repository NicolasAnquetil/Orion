*OrionBrowser
addAccessToVarNamed: aMooseName inModel: aModelVersion
	^ self addAccessTo: (aModelVersion entityNamed: aMooseName) inModel: aModelVersion