*OrionBrowser
addClassNamed: aString  inAction: anAction
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