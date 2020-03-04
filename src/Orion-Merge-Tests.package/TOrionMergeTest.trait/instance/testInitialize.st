tests-set
testInitialize
	self assert: self modelMerger notNil.
	self assert: self modelMerger class equals: FXDiff.
	self assert: self modelMerger notNil.
	self assert: self modelMerger diffComputer class equals: FamixDiff.
	ORSystem root isNotEmpty
		ifTrue: [ ORSystem root last orionModels first = self modelMerger baseModel
				ifTrue: [ ORSystem root remove: ORSystem root last ifAbsent: [  ] ] ]