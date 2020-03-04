changes
allChanges

	|collection current|
	collection := OrderedCollection new.
	current := self.
	
	[collection addAllFirst: current changes.
	current := current parentModel.
	current isNil] whileFalse.

	^collection
	
	