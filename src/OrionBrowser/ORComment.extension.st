Extension { #name : #ORComment }

{ #category : #'*OrionBrowser' }
ORComment >> deleteInAction: anAction [

	ORActionRemoveComment new
		parentAction: anAction ;
		orionModel: anAction orionModel ;
		entity: self ;
		run; postRun. 

]
