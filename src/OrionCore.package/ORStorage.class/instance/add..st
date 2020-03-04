adding
add: anElement
	| key group |
	key := anElement class.
	group := byType at: key ifAbsentPut: [ OrderedCollection new ].
	group add: anElement.
	elements add: anElement mooseID -> anElement.
	^ anElement