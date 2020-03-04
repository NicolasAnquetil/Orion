preparation
obtainActionSuperClass: anOREntity actionType: anActionType
	^ anActionType = #Add
		ifTrue: [ (anOREntity inheritsFrom: FAMIXAssociation)
				ifTrue: [ ORActionAddLink ]
				ifFalse: [ ORActionAddEntity ] ]
		ifFalse: [ Smalltalk globals at: ('ORAction' , anActionType) asSymbol ]