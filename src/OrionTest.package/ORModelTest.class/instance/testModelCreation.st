testing OrionModel
testModelCreation
	| asS orionModel |
	asS := self model system.
	orionModel := (ORModel withParent: self model) name: #AsM.
	self assert: asS orionModels size equals: 2.
	self assert: (asS sourceModel childrenModel includes: orionModel).
	self assert: orionModel parentModel = asS sourceModel. 
	self assert: orionModel system = asS.
	self assert: orionModel sourceLanguage = asS sourceModel sourceLanguage.
	self assert: orionModel entityStorage size = asS sourceModel entityStorage size.
	self assert: orionModel entityStorage size ~= 0