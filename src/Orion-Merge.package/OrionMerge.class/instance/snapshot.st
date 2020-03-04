deprecated
snapshot
	self
		deprecated: 'Use famixDiff instead'
		on: '17 November 2016'
		in: 'Pharo-6.0-60294-'
		transformWith: '`@receiver snapshot' -> '`@receiver orchestrator'.
	^ self orchestrator