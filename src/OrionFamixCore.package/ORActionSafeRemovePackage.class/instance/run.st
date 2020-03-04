method execution
run
	| pack namespace |
	super run.
	entity parentPackage
		ifNotNil: [ pack := self orionModel retrieveEntity: entity parentPackage.
			pack privateChildNamedEntities: (pack privateChildNamedEntities orionCopy orionRemove: entity) ].
	entity parentScope
		ifNotNil: [ namespace := self orionModel retrieveEntity: entity parentScope.
			namespace privateChildScopes: (namespace privateChildScopes orionCopy orionRemove: entity) ].
	entity childScopes
		do: [ :each | 
			| scope |
			scope := self orionModel retrieveEntity: each.
			entity parentPackage isNil
				ifFalse: [ scope privateParentPackage: pack.
					pack privateChildScopes: (pack privateChildScopes orionCopy unsafeAdd: scope) ]
				ifTrue: [ scope privateParentPackage: nil ] ].
	entity childNamedEntities
		do: [ :each | 
			| ent |
			ent := self orionModel retrieveEntity: each.
			entity parentPackage isNil
				ifFalse: [ ent privateParentPackage: pack.
					pack privateChildNamedEntities: (pack privateChildNamedEntities orionCopy unsafeAdd: ent) ]
				ifTrue: [ ent privateParentPackage: nil ] ].
	entity types
		do: [ :each | 
			| class |
			class := self orionModel retrieveEntity: each.
			entity parentPackage isNil
				ifFalse: [ class privateParentPackage: pack.
					pack privateTypes: (pack privateTypes orionCopy unsafeAdd: class) ]
				ifTrue: [ class privateParentPackage: nil ] ].
	entity comments do: [ :com | com deleteInAction: self ].
	entity functions do: [ :com | com deleteInAction: self ].
	entity globalVariables do: [ :com | com deleteInAction: self ].
	entity receivingInvocations do: [ :com | com deleteInAction: self ].
	self orionModel remove: entity