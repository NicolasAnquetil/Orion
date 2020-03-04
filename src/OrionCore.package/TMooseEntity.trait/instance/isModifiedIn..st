testing
isModifiedIn: anOrionModel
	| parent |
	parent := anOrionModel parentModel.
	parent ifNil: [ ^ false ] ifNotNil: [ ^ (parent entityStorage atID: self mooseID ifAbsent: [ nil ]) isNil ]