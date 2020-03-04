creating
createEntityFrom: anEntity
	| newEntity |
	self remove: anEntity.
	newEntity := anEntity shallowCopy.
	newEntity privateState: (ORDefaultState with: newEntity).
	newEntity orionModel: self.
	^ newEntity