Extension { #name : #ORMethod }

{ #category : #'*OrionBrowser' }
ORMethod >> addAccessTo: aStructuralEntity inModel: aModelVersion [
	(ORActionAddAccess new
		orionModel: aModelVersion;
		accessor: self;
		variable: aStructuralEntity)
		manualRun;
		postRun
]

{ #category : #'*OrionBrowser' }
ORMethod >> addAccessToVarNamed: aMooseName inModel: aModelVersion [
	^ self addAccessTo: (aModelVersion entityNamed: aMooseName) inModel: aModelVersion
]

{ #category : #'*OrionBrowser' }
ORMethod >> addInvocationTo: anOrderedCollection inModel: aModelVersion [
	[ (ORActionAddInvocation new
		orionModel: aModelVersion;
		sender: self;
		candidates: anOrderedCollection)
		manualRun;
		postRun ] orBrowserExceptionsLauncherCollection: anOrderedCollection
]

{ #category : #'*OrionBrowser' }
ORMethod >> addInvocationTo: aCollection receiver: receiver withSignature: aSymbol inModel: aModelVersion [ 

	(ORActionAddInvocation new
		orionModel: aModelVersion;
		sender: self ;
		receiver: receiver;
		candidates: aCollection;
		signature: aSymbol )
	manualRun; postRun . 
]

{ #category : #'*OrionBrowser' }
ORMethod >> addReferenceTo: aClass inModel: aModelVersion [
[ 

	(ORActionAddReference new
		orionModel: aModelVersion;
		source: self ;
		target: aClass)
	manualRun; postRun ]
	orBrowserExceptionsLauncher: aClass. 
]

{ #category : #'*OrionBrowser' }
ORMethod >> deleteInAction: anAction [

	ORActionRemoveMethod new
		parentAction: anAction ;
		orionModel: anAction orionModel ;
		entity: self ;
	run; postRun . 
]

{ #category : #'*OrionBrowser' }
ORMethod >> deleteInModel: aModelVersion [

	(ORActionRemoveMethod new
		orionModel: aModelVersion ;
		entity: self ;
		yourself) 
	manualRun; postRun . 
]

{ #category : #'*OrionBrowser' }
ORMethod >> moveTo: aClass inAction: anAction [
[ 
	(ORActionMoveMethod new
		parentAction: anAction ;
		orionModel: anAction  orionModel ;
		entity: self ;
		newContainer: aClass )
	run; postRun ] orBrowserExceptionsLauncher: aClass.
]

{ #category : #'*OrionBrowser' }
ORMethod >> moveTo: aClass inModel: aModelVersion [
	[ ^ (ORActionMoveMethod new
		orionModel: aModelVersion;
		entity: self;
		parentType: aClass)
		manualRun;
		postRun ] orBrowserExceptionsLauncher: aClass
]

{ #category : #'*OrionBrowser' }
ORMethod >> rename: aString inModel: aModelVersion [

	^aString  ifNotNil: [ 
		(ORActionRenameMethod new
			orionModel: aModelVersion ;
			entity: self ;
			newName: aString )
		manualRun; postRun ]
]

{ #category : #'*OrionBrowser' }
ORMethod >> updatePackage: aPackage inAnAction: anAction [
	ORActionMoveMethodInPackage new
		parentAction: anAction;
		orionModel: anAction orionModel;
		entity: self;
		newContainer: aPackage;
		run; postRun 
]

{ #category : #'*OrionBrowser' }
ORMethod >> updatePackage: aPackage inModel: aModel [
	^ORActionMoveMethodInPackage new
		orionModel: aModel;
		entity: self;
		newContainer: aPackage;
		run; postRun 
]
