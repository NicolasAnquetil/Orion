accessing
selectedVersion: anObject
	self unsubscribeSelectedVersion.
	selectedVersion := anObject.
	self selectedVersion system announcer subscribe: ORAnnouncement send: #update to: browser