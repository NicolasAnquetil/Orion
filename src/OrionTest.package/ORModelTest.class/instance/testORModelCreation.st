as yet unclassified
testORModelCreation
	
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
	