private-run
createRemove
	"create the corresponding ORActions from the set of changes. Each type of change is managed separately"

	| coll |
	coll := OrderedCollection new.

	"The order in which the changes are added in the collection is relevant"
	self flag: 'All the modification are not repercuted in the orion model. E.g the LocalVariales'.
	coll addAll: self result setOfRemoveAccessChanges.
	coll addAll: self result setOfRemoveReferenceChanges.
	coll addAll: self result setOfRemoveAnnotationInstanceChanges.
	coll addAll: self result setOfRemoveAnnotationTypeChanges.
	coll addAll: self result setOfRemoveAttributeChanges.
	coll addAll: self result setOfRemoveMethodChanges.
	coll addAll: self result setOfRemoveClassChanges.
	coll addAll: self result setOfRemovePackageChanges.
	coll do: [ :chg | chg entity deleteInModel: self orionVersionedModel ]