testing
isModifiable
	^ self childrenModel isEmpty and: [ self ~= self system sourceModel ]