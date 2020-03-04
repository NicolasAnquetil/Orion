Extension { #name : #ORPackage }

{ #category : #'*OrionBrowser' }
ORPackage >> addClassNamed: aString  inAction: anAction [
	aString
		ifNotNil: [ | addedClass  action |
			action := (ORActionAddClass new
				parentAction: 	anAction ;
				orionModel: anAction orionModel;
				parent: self;
				parentPackage: anAction orionModel allNamespaces first;
				name: aString).
			addedClass :=  action run.
			action postRun.
			^addedClass ]
	ifNil: [ OrionNoNameException new signal ]
]

{ #category : #'*OrionBrowser' }
ORPackage >> deleteInAction: anAction [

	ORActionRemovePackageOnly new
		parentAction: anAction ;
		orionModel: anAction orionModel ;
		entity: self ;
	run; postRun . 
]

{ #category : #'*OrionBrowser' }
ORPackage >> deleteInModel: aModelVersion [

	(ORActionRemovePackage new
		orionModel: aModelVersion ;
		entity: self )
	manualRun; postRun . 
]

{ #category : #'*OrionBrowser' }
ORPackage >> mergePackage: aPackage inModel: aModelVersion [

	(ORActionMergePackage  new
		orionModel: aModelVersion ;
		entity: self ;
		newContainer: aPackage )
	manualRun; postRun . 

]

{ #category : #'*OrionBrowser' }
ORPackage >> rename: aString inModel: aModelVersion [

	^aString  ifNotNil: [ 
		(ORActionRenamePackage new
			orionModel: aModelVersion ;
			entity: self ;
			newName: aString )
		manualRun; postRun ]
]

{ #category : #'*OrionBrowser' }
ORPackage >> unsafeDeleteInModel: aModelVersion [

	(ORActionRemovePackageOnly new
		orionModel: aModelVersion ;
		entity: self )
	manualRun. 
]
