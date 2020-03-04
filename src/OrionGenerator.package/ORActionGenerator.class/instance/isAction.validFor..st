preparation
isAction: action validFor: anOREntity
	action = #Move
		ifTrue: [ ^ (anOREntity inheritsFrom: FAMIXAssociation) not ].
	action = #Rename
		ifTrue: [ ^ anOREntity inheritsFrom: FAMIXNamedEntity ].
	^ true