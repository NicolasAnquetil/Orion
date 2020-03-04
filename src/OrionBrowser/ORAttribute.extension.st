Extension { #name : #ORAttribute }

{ #category : #'*OrionBrowser' }
ORAttribute >> deleteInAction: anAction [

	ORActionRemoveAttribute new
		parentAction: anAction ;
		orionModel: anAction orionModel ;
		entity: self ;
		run; postRun. 

]

{ #category : #'*OrionBrowser' }
ORAttribute >> deleteInModel: aModelVersion [

	(ORActionRemoveAttribute new
		orionModel: aModelVersion ;
		entity: self )
	manualRun; postRun. 

]

{ #category : #'*OrionBrowser' }
ORAttribute >> moveTo: aClass inAction: anAction [

[ 
	(ORActionMoveAttribute  new
		parentAction: anAction ;
		orionModel: anAction orionModel ;
		entity: self ;
		newContainer: aClass )
	run ; postRun]
		orBrowserExceptionsLauncher: aClass.

]

{ #category : #'*OrionBrowser' }
ORAttribute >> moveTo: aClass inModel: aModelVersion [

[ 
	^(ORActionMoveAttribute  new
		orionModel: aModelVersion ;
		entity: self ;
		parentType: aClass )
	manualRun; postRun ]
		orBrowserExceptionsLauncher: aClass.

]

{ #category : #'*OrionBrowser' }
ORAttribute >> rename: aString inModel: aModelVersion [

	^aString  ifNotNil: [ 
		(ORActionRenameAttribute new
			orionModel: aModelVersion ;
			entity: self ;
			newName: aString )
		manualRun; postRun ]
]
