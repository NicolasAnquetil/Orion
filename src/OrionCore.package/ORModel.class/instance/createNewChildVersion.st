creating
createNewChildVersion
	| newModel |
	newModel := ORModel withParent: self.
	newModel name: self baseName , '_' , Date current yyyymmdd , '_' , Time current print24.
	^ newModel