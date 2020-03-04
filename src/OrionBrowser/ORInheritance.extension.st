Extension { #name : #ORInheritance }

{ #category : #'*OrionBrowser' }
ORInheritance >> deleteInAction:  anAction [
	ORActionRemoveInheritance new
		parentAction: anAction ;
		orionModel: anAction orionModel ;
		entity: self ;
	run; postRun. 

]

{ #category : #'*OrionBrowser' }
ORInheritance >> deleteInModel:  aModelVersion [
	(ORActionRemoveInheritance new
		orionModel: aModelVersion;
		entity: self )
	manualRun; postRun. 

]
