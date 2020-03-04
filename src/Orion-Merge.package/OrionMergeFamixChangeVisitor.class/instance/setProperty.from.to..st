initialization
setProperty: aFM3PropertyDescription from: aMooseEntity to: anActionClass
	| selector fromEntityResult result |
	selector := aFM3PropertyDescription implementingSelector.
	fromEntityResult := [ aMooseEntity perform: selector ]
		on: OREntityNotFoundInCurrentModel
		do: [ ^ self ].
	fromEntityResult ifNil: [ ^ self ].
	result := fromEntityResult.
	aFM3PropertyDescription type isPrimitive
		ifFalse: [ aFM3PropertyDescription isMultivalued
				ifTrue: [ result := fromEntityResult
						collect: [ :e | self findEntityInOrionModel: e ]
						thenSelect: [ :e | e isNotNil ] ]
				ifFalse: [ result := self findEntityInOrionModel: fromEntityResult ] ].
	[ anActionClass perform: selector asMutator with: result ]
		on: MessageNotUnderstood
		do: [ :e | "Transcript logCr: e printString" ].
	^ result