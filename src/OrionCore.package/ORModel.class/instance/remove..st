adding/removing
remove: anElement
	"remove an entity in the version"

	anElement removeModel: self.
	^ self entityStorage remove: anElement ifAbsent: [ self error ]