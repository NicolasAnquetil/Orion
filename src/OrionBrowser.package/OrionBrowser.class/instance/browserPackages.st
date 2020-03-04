gui
browserPackages

	(browser transmit) to: #packages ; from:#models; andShow: [:b | | gmlList |
		gmlList := b list.
		gmlList
			display: [:model |
				self selectedVersion: model.
				((model allWithType: ORPackage) union: (model allWithType: ORNamespace)) sorted: [:c1 :c2 | c1 name < c2 name] ] ;
			title: [ :each | ' Packages'] ;
			selectionAct: [:list | list selection inspect] entitled:  'Inspect' ;
			selectionAct:  [:list | list selection rename: (self getNameDialog:  'New package name') inModel: selectedVersion]  entitled: 'Rename' ;
			selectionAct: [:list |  list selection addClassNamed: (self getNameDialog:  'New class name') inModel: selectedVersion]  entitled: 'Add a class' ;
			selectionAct: [:list | list selection deleteInModel: selectedVersion] entitled: 'Remove' ;
			selectionAct: [:list | list selection mergePackage: entityInBuffer inModel: selectedVersion] entitled: 'Merge with buffered package' .		
	].
