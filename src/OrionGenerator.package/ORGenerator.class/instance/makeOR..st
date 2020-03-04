generator
makeOR: aFamixClass
	"Create the ORClass corresponding to the FamixClass, add accessors to the trait and accessors to the FamixClass"
	| anORClass |
	self addAccessorFrom: aFamixClass toTrait: (self ensureORTrait: aFamixClass).
	anORClass := self ensureORClass: aFamixClass.
	self createCommentToAClass: anORClass. 
	self addPrivateAccessorTo: aFamixClass