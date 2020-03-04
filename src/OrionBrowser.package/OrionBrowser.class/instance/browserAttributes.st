gui
browserAttributes
	(browser transmit) to: #attributes; from: #classes; andShow: [:b | | gmlList |
		gmlList := b list.
		gmlList
			display: [:anEntity | (anEntity attributes )  sorted: [:c1 :c2 | c1 name < c2 name] ];
			title: [ :each | ' Attributes'] ;
			selectionAct: [:list | list selection inspect] entitled:  'Inspect' ;
		
			selectionAct:  [:list | list selection rename: (self getNameDialog:  'New attribute name') inModel: selectedVersion]  entitled: 'Rename' ;
			selectionAct: [:list | list selection deleteInModel: selectedVersion] entitled: 'Remove' ;
			selectionAct: [:list | [list selection moveTo: entityInBuffer inModel: selectedVersion] orBrowserExceptionsUIManager] entitled: 'Move to buffered class'.
	].
