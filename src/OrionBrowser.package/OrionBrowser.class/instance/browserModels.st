gui
browserModels

	(browser transmit) to: #models; andShow: [:b | | gmlTree |
		gmlTree := b tree.
		gmlTree
			allExpanded;
			display: [:systems | systems flatCollect: [:aSystem | aSystem orionModels select:[:versions | versions parentModel isNil]]];
			format:[:aVersion | aVersion name];
			children: [:aVersion | aVersion childrenModel] ;

			selectionAct: [:list | list selection inspect] entitled:  'Inspect';

			selectionAct: [:theList | 
						theList selection createNewChildVersion.
						browser announce: ORAnnouncement]
				entitled: 'Create a child version' ;

			selectionAct: [:theList | 
						theList selection delete.
						browser announce: ORAnnouncement]
				entitled: 'Delete version'  ;

			selectionAct: [:list | list selection addPackageNamed: (self getNameDialog:  'New package name')] entitled: 'Add a package'.	

		self	versionChangesPane: gmlTree.
	].
