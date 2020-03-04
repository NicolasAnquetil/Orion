private
orionClassOf: aClass
	"Fix for Orion: if the entities are sorted by type, the famix type should be the rule. If a package is defined, it is a real class of the model, else it is another kind of class (type Orion)"

	^ (aClass mooseDescription isNil or: [ aClass mooseDescription subclasses isEmptyOrNil ])
		ifTrue: [ aClass ]
		ifFalse: [ self
				orionClassOf: (aClass mooseDescription subclasses detect: [ :e | e implementingClass isOrionClass ] ifNone: [ ^ aClass ]) implementingClass ]