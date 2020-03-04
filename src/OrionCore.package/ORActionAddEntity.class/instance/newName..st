accessing
newName: aString
	self
		deprecated: 'Use name instead'
		on: '21 December 2016'
		in: 'Pharo-6.0-60328-'
		transformWith: '`@receiver newName: `@arg' -> '`@receiver name: `@arg'.
	self name: aString