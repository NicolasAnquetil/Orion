gui
browserLinks

	"{#classes . #methods . #attributes} do: [:srcPanel |"

	(browser transmit) to: #links ; from: #classes ; andShow: [:b | | gmlList |
		gmlList := b list.
		gmlList
			title: 'Links' ;
			display: [ :anObject | (((anObject incomingReferences) union: (anObject superInheritances  )) union: (anObject subInheritances) ) sorted: [:x :y | x mooseName < y mooseName]] ;
			 
			format: [:aProp | (aProp asString)];
			selectionAct: [:list | list selection inspect] entitled:  'Inspect' ;

			selectionAct:  [:list | list selection deleteInModel: selectedVersion]  entitled: 'Remove the Link'.
		].
	

	
	(browser transmit) to: #links ; from: #methods ; andShow:[:b | | gmlList |
		gmlList := b list.
		gmlList
			title: 'Links' ;
			display: [ :anObject | (anObject outgoingReferences ) 
					union: ((anObject incomingInvocations) union: (anObject outgoingInvocations  )) ] ;
			sorted: [:x :y | x mooseName < y mooseName] ;
			format: [:aProp | (aProp asString)];
			selectionAct: [:list | list selection inspect] entitled:  'Inspect' ;
			
			selectionAct:  [:list | list selection deleteInModel: selectedVersion]  entitled: 'Remove the Link'.
		].
