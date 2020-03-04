preparation
createActionClassNameWithType: aTypeOfAction for: anOREntity
	^ 'ORAction' , aTypeOfAction , anOREntity mooseDescription superclass name