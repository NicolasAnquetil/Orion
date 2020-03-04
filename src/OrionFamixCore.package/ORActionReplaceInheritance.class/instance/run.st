method execution
run
	"This is a replacement, so remove the existing inheritance if it exists
	If there are several, defaults to removing the frst one"

	super run.
	
	from superInheritances ifNotEmpty: [
		ORActionRemoveInheritance new 
			parentAction: self ;
			orionModel: orionModel; 
			entity: from superInheritances first; 
			run
		].

	"Add the new inheritance"
	^ ORActionAddInheritance new 
			parentAction: self ;
			orionModel: orionModel; 		
			subclass: (orionModel retrieveEntity: self from) ;
			superclass: (orionModel retrieveEntity: self to) ;
			run.
