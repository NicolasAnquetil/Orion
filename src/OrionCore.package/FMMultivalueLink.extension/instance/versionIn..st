*OrionCore-model
versionIn: aVersion
	self flag: #TODO.
	"Catch the exception here may not be a good idea since this exception should not be thrown..."
	^ self
		collect: [ :e | 
			[ e versionIn: aVersion ]
				on: OREntityNotFoundInCurrentModel
				do: [  ] ]
		thenSelect: #isNotNil