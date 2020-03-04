as yet unclassified
add: anElement

	self root add: anElement.
	self announcer announce: (ORSystemAdded new entity: anElement).
