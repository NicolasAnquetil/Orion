*OrionFamixJava
addNamespaceNamed: aString inORNamespace: aNamespace
	^aString ifNotNil: [ "Halt now."
			 ((ORActionAddNamespace new
				orionModel: self;
				parentScope: aNamespace;
				name: aString)
				manualRun;
				postRun )]