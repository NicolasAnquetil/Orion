creating method
selectExtendedPropertiesAmong: aCollectionOfProperties
	^ (aCollectionOfProperties reject: [ :a | a mmClass implementingClass allInstVarNames includes: a name ])
		select: [ :e | 
			(e type isPrimitive and: [ e isDerived not ])
				or: [ (e type isPrimitive not and: [ e hasOpposite ]) and: [ e isMultivalued or: [ e opposite isMultivalued ] ] ] ]