method execution
run
	| fromEl toEl recEl|
	super run.
	fromEl := (self orionModel retrieveEntity:entity sender).
	
	
	(entity candidates size > 1 and:[to notNil]) ifTrue:[
		|invoc realCandidate|
		realCandidate := (self orionModel retrieveEntity: to).
		invoc := (self orionModel retrieveEntity:entity).
		invoc privateCandidates: (invoc privateCandidates orionCopy orionRemove: realCandidate).
		realCandidate privateIncomingInvocations: (realCandidate privateIncomingInvocations orionCopy orionRemove: entity).
	] ifFalse:[
		"if there is only one candidate, it means that the invocation is sure, and the invocation can be removed.
		if there are multiple candidates and to is nil, it means that we want to remove the invocation itself"
		toEl := entity candidates collect:[:e | self orionModel retrieveEntity: e  ].
		
		entity receiver ifNotNil:[
			recEl := (self orionModel retrieveEntity:entity receiver).
			recEl privateReceivingInvocations: (recEl privateReceivingInvocations orionCopy orionRemove: entity).
		].
	
		fromEl privateOutgoingInvocations: (fromEl privateOutgoingInvocations orionCopy orionRemove: entity).
	
		toEl do:[:each|
			each privateIncomingInvocations: (each privateIncomingInvocations orionCopy orionRemove: entity).].
	
		entity comments do:[:com | com deleteInAction: self 		].
	
		self orionModel remove: entity.
	].
