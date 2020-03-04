navigation
allWithType: aMetaDesription
	| try |
	try := ORConverter mapping at: aMetaDesription ifAbsent: [ aMetaDesription ].
	^ MooseGroup withAll: (self entityStorage selectAllWithType: try) withDescription: 'All ' , try mooseName asLowercase