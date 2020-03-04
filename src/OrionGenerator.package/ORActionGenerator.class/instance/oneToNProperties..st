creating method
oneToNProperties: aCollectionOfProperties
	^ aCollectionOfProperties
		select: [ :e | e isMultivalued not and: [ e opposite isMultivalued ] ]