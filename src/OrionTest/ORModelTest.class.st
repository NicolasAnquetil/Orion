Class {
	#name : #ORModelTest,
	#superclass : #ORTest,
	#category : 'OrionTest'
}

{ #category : #'testing OrionModel' }
ORModelTest >> testModelCreation [
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
]

{ #category : #'as yet unclassified' }
ORModelTest >> testORModelCreation [
	
	|firstMod secMod sys|
	sys := self model system. 
	firstMod := sys sourceModel.
	secMod := (ORModel withParent: self model) name: #orionModel.
	
	self assert: TMooseEntity users size = 1.
	self assert: ORClass traits size = 1.
	
	self assert: sys orionModels size = 2.
	self assert: (sys sourceModel childrenModel includes: secMod).
	
	self assert: firstMod parentModel = nil.
	self assert: firstMod system = sys.
	self assert: firstMod sourceLanguage = secMod sourceLanguage.
	self assert: firstMod entityStorage size = secMod entityStorage size.
	"self assert: firstMod entityStorage size = 30."
	
	firstMod entities do:[:e |
		self assert: (e isKindOf: MooseEntity).
	].
	
	self assert: secMod parentModel = sys sourceModel.
	self assert: secMod system = sys.
	self assert: secMod sourceLanguage = sys sourceModel sourceLanguage.
	self assert: secMod entityStorage size = sys sourceModel entityStorage size.
	self assert: secMod entityStorage size ~= 0.
	
]
