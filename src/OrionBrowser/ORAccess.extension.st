Extension { #name : #ORAccess }

{ #category : #'*OrionBrowser' }
ORAccess >> deleteInAction:  anAction [
	ORActionRemoveAccess new
		parentAction: anAction ;
		orionModel: anAction orionModel ;
		entity: self ;
	run; postRun. 
]

{ #category : #'*OrionBrowser' }
ORAccess >> deleteInModel: aModel [
	ORActionRemoveAccess new
		orionModel: aModel;
		entity: self;
		run;
		postRun
]
