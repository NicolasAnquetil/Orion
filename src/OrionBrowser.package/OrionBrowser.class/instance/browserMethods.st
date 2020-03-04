gui
browserMethods
	(browser transmit) to: #methods; from: #classes; andShow: [:b | | gmlList |
		gmlList := b list.
		gmlList
			display: [:anEntity | (anEntity methods)  sorted: [:c1 :c2 | c1 name < c2 name] ];
			title: [ :each | 'Methods'] ;
			selectionAct: [:list | list selection inspect] entitled:  'Inspect' ;

			selectionAct:  [:list | list selection rename: (self getNameDialog:  'New method name') inModel: selectedVersion]  entitled: 'Rename' ;
			 selectionAct: [:list | list selection deleteInModel: selectedVersion] entitled: 'Remove' ;
			selectionAct: [:list | [list selection moveTo: entityInBuffer inModel: selectedVersion] orBrowserExceptionsUIManager] entitled: 'Move to the buffered class' ;
			selectionAct: [:list | [list selection addReferenceTo: entityInBuffer inModel: selectedVersion] orBrowserExceptionsUIManager] entitled: 'Add reference to the buffered class' ;
			selectionAct: [:list | [list selection addInvocationTo: entityInBuffer asOrderedCollection inModel: selectedVersion] orBrowserExceptionsUIManager] entitled: 'Add invocation to the buffered method'.
	].
