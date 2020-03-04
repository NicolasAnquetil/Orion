generator
makeORForAllClasses: aColl
	"For all the class of the collection, Create the ORClass corresponding to the FamixClass, add accessors to the trait and accessors to the FamixClass"
	
	aColl select: [ :aClass | aClass inheritsFrom: FAMIXEntity ] thenDo: [ :c | self makeOR: c ]