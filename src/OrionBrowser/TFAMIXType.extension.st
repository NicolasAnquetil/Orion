Extension { #name : #TFAMIXType }

{ #category : #'*OrionBrowser' }
TFAMIXType >> addMethodNamed: aString withSignature: aSignature inModel: aModelVersion [

	aString  ifNotNil: [ 
		(ORActionAddMethod new
			orionModel: aModelVersion ;
			parentType: self ;
			name: aString ;
			signature: aSignature)
		manualRun; postRun ]
]

{ #category : #'*OrionBrowser' }
TFAMIXType >> addMethodNamed: aString withSignature: aSignature withBodyHash: anHash inModel: aModelVersion [
	aString
		ifNotNil: [ (ORActionAddMethodWithBodyHash new
				orionModel: aModelVersion;
				container: self;
				newName: aString;
				bodyHash: anHash;
				signature: aSignature)
				manualRun;
				postRun ]
]
