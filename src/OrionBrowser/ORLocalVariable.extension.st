Extension { #name : #ORLocalVariable }

{ #category : #'*OrionBrowser' }
ORLocalVariable >> deleteInAction:  anAction [
	ORActionRemoveLocalVariable new
		parentAction: anAction ;
		orionModel: anAction orionModel ;
		entity: self ;
	run; postRun. 
]
