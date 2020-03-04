gui
browserClasses
	browser transmit
		to: #classes;
		from: #packages;
		andShow: [ :b | 
					| gmlList |
					gmlList := b list.
					gmlList
						display: [ :anEntity | anEntity classes sorted: [ :c1 :c2 | c1 name < c2 name ] ];
						title: [ :each | ' Classes' ];
						selectionAct: [ :list | list selection inspect ] entitled: 'Inspect';
						selectionAct: [ :list | list selection rename: (self getNameDialog: 'New class name') inModel: selectedVersion ]
							entitled: 'Rename';
						selectionAct: [ :list | [ list selection addSuperClass: entityInBuffer inModel: selectedVersion ] orBrowserExceptionsUIManager ]
							entitled: 'Add inheritance from the buffered class';
						selectionAct: [ :list | [ list selection changeSuperClassTo: entityInBuffer inModel: selectedVersion ] orBrowserExceptionsUIManager ]
							entitled: 'Change super class for the buffered class';
						selectionAct: [ :list | list selection addAttributeNamed: (self getNameDialog: 'New attribute name') inModel: selectedVersion ]
							entitled: 'Add attribute';
						selectionAct: [ :list | list selection addMethodNamed: (self getNameDialog: 'New method name') inModel: selectedVersion ]
							entitled: 'Add method';
						selectionAct: [ :list | [list selection extractClassFromClass: 'FFF' selectedAttributes:  list selection attributes inModel: selectedVersion] orBrowserExceptionsUIManager]
							entitled: 'Extract Class';	
						selectionAct: [ :list | list selection deleteInModel: selectedVersion ] entitled: 'Remove';
						selectionAct: [ :list | [list selection moveTo: entityInBuffer inModel: selectedVersion] orBrowserExceptionsUIManager ]
							entitled: 'Move to buffered package' ]