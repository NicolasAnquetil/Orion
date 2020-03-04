adding
addModel: anORModel
	^ attributes
		at: #privateModels
		ifPresent: [ :e | e add: anORModel ]
		ifAbsentPut: [ OrderedCollection with: anORModel ]