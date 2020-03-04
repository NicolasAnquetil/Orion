initialization
initialize
	super initialize.
	self entity: nil.
	selectedAttributes := OrderedCollection new.
	newName := 'newExtractClass'.