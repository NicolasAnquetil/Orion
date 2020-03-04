Extension { #name : #ORInvocation }

{ #category : #'*OrionBrowser' }
ORInvocation >> deleteInAction:  anAction [
	ORActionRemoveInvocation new
		parentAction: anAction;
		orionModel: anAction orionModel ;
		entity: self ;
		run; postRun . 

]

{ #category : #'*OrionBrowser' }
ORInvocation >> deleteInModel:  aModelVersion [
	(ORActionRemoveInvocation new
		orionModel: aModelVersion;
		entity: self )
	manualRun; postRun . 

]
