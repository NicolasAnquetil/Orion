deprecated
snapshot: anObject
	self
		deprecated: 'Use famixDiff: instead'
		on: '17 November 2016'
		in: 'Pharo-6.0-60294-'
		transformWith: '`@receiver snapshot: `@arg' -> '`@receiver famixDiff: `@arg'.
	^ self famixDiff: anObject