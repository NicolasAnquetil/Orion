method execution
postRun

	from ifNotNil: [ 
		| sender |
		sender := (self orionModel retrieveEntity: from).
		sender parentType resetMooseName ].
	super postRun.