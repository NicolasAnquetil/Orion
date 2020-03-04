creating
withParent: aModel
	self parentModel: aModel.
	aModel childrenModel add: self.
	self system: aModel system.
	self populateModel.
	^ self