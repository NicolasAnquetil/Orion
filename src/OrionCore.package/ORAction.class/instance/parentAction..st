accessing
parentAction: anAction
	parentAction ifNotNil: [parentAction removeChildAction: self].
	parentAction := anAction.
	anAction ifNotNil: [anAction addChildAction: self].