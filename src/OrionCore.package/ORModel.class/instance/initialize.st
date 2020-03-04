initialize-release
initialize 
	super initialize.
	childrenModel := OrderedCollection new.
	changes := OrderedCollection new. 
	storage := ORStorage new.
	storage model: self.
	state currentContext: self.