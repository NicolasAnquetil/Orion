as yet unclassified
removeModel: anORModel
	^ attributes at: #privateModels ifPresent: [ :e | e remove: anORModel ] ifAbsentPut: [ OrderedCollection new ]