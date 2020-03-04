Extension { #name : #ORGlobalVariable }

{ #category : #'*OrionBrowser' }
ORGlobalVariable >> deleteInAction: anAction [

	ORActionRemoveGlobalVariable new
		parentAction: anAction ;
		orionModel: anAction orionModel ;
		entity: self ;
		run; postRun. 

]
