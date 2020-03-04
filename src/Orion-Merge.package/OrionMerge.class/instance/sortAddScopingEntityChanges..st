categorizing
sortAddScopingEntityChanges: aCollection
	"select the FamixChanges of the dictionnary according to their type and the type of the entity on which they occur"

	^ aCollection sort: [ :a :b | a mooseName < b mooseName ].