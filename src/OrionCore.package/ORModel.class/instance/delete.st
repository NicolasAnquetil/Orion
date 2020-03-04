adding/removing
delete
	"remove the version and all its children"
	
	self childrenModel do:[:each | each remove].
	
	self parentModel ifNotNil:[
		self parentModel childrenModel remove: self].
	self = self system sourceModel ifTrue:[
		ORSystem remove: self system
	].
	self system orionModels remove: self.
	
	"ORContext currentModel = self ifTrue:[ORContext currentModel: self parentModel]."
	^ self