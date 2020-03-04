testing
isRemovedBetween: anOrionModel and: anotherOrionModel
	^ (anOrionModel entityStorage atID: self mooseID ifAbsent: [ nil ]) notNil and: [ (anotherOrionModel entityStorage atID: self mooseID ifAbsent: [ nil ]) isNil ]