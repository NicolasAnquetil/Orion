running
tearDown
	(ORSystem root notEmpty and: [ modelMerger isNotNil ])
		ifTrue: [ "ORSystem remove: modelMerger orionVersionedModel."
			(ORSystem root last orionModels first = modelMerger targetModel
				and: [ ORSystem root last orionModels last = modelMerger orionVersionedModel ])
				ifTrue: [ ORSystem root remove: ORSystem root last ifAbsent: [  ] ] ]