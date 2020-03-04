creating method
selectPropertiesAmong: aCollectionOfProperties
	^ aCollectionOfProperties select: [ :a | a mmClass implementingClass allInstVarNames includes: a name ]