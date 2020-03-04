creating
retrieveEntity: anEntity
	^ (self contains: anEntity)
		ifTrue: [ anEntity ]
		ifFalse: [ | old new |
			old := self at: anEntity orionID.
			new := self createEntityFrom: old.
			new ]