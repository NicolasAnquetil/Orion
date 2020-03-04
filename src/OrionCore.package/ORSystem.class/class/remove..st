as yet unclassified
remove: anElement

	self root remove: anElement.
	self announcer announce: (ORSystemRemoved new entity: anElement).
