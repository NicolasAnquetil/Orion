removing
remove: anElement ifAbsent: exceptionBlock
	| key group |
	key := anElement class.
	group := byType at: key ifAbsent: [ OrderedCollection new ].
	group remove: anElement ifAbsent: [  ].
	byName
		removeKey: (byName keyAtValue: anElement ifAbsent: [  ])
		ifAbsent: [  ].
	elements removeKey: anElement mooseID ifAbsent: exceptionBlock.
	^ anElement