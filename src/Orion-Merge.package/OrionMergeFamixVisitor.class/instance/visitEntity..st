visiting
visitEntity: anEntity
	^ self changeVisitor
		perform: ('create' , self actionType,':entity:')asSymbol
		with: anEntity mooseDescription 
		with: currentEntity