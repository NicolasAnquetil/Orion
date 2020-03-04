tests
testJavaModelWithInnerclasses
	| mooseModel orionModel res |
	mooseModel := MooseModel importFromMSEStream: self model readStream.
	orionModel := (MooseModel importFromMSEStream: self model readStream) convertToOrion.
	res := mooseModel allPropertySelectors
		collect: [ :prop | 
			{(mooseModel perform: prop).
			(orionModel perform: prop)} ].
	res
		collect: [ :e | 
			e first isCollection
				ifTrue: [ self assert: e first size equals: e second size ] ]