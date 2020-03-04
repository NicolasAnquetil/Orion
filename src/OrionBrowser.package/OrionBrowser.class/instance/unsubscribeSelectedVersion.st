accessing
unsubscribeSelectedVersion
	self selectedVersion ifNotNil: [ self selectedVersion system announcer unsubscribe: browser ].
