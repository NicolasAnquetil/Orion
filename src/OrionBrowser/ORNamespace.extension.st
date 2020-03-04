Extension { #name : #ORNamespace }

{ #category : #'*OrionBrowser' }
ORNamespace >> deleteInAction: anAction [

	ORActionRemoveNamespace  new
		parentAction: anAction ;
		orionModel: anAction orionModel ;
		entity: self ;
		run; postRun. 
]

{ #category : #'*OrionBrowser' }
ORNamespace >> deleteInModel: aModelVersion [

	(ORActionRemoveNamespace new
		orionModel: aModelVersion ;
		entity: self ;
		yourself) 
	manualRun; postRun .
]

{ #category : #'*OrionBrowser' }
ORNamespace >> moveTo: aNamespace inModel: aModelVersion [
	
	^(ORActionMoveNamespace new
		orionModel: aModelVersion ;
		entity: self ;
		parentScope: aNamespace )
	manualRun;
	postRun
]
