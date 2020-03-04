*OrionBrowser
deleteOnlyInAction: anAction

	^(ORActionRemoveClassOnly new
		parentAction: anAction ;
		orionModel: anAction orionModel  ;
		entity: self  )
	run. 
