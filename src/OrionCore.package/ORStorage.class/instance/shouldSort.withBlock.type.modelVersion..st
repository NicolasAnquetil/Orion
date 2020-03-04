private
shouldSort: aCollection withBlock: aBlockClosure type: aMooseClass modelVersion: anORModel
	| isSorted modelVersionDict |
	modelVersionDict := self sortedCollectionList at: anORModel ifAbsentPut: [ Dictionary new ].
	isSorted := modelVersionDict at: aMooseClass ifAbsentPut: [ false ].
	^ isSorted
		ifTrue: [ aCollection ]
		ifFalse: [ modelVersionDict at: aMooseClass put: true.
			aCollection sort: aBlockClosure ]