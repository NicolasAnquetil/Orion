gui
browser

	browser := GLMTabulator new.
	
	browser
		title: 'Orion Browser' ;
		column: [:c | c
				row:  #models ;
				row: #buffer size: 60 ]  span: 2 ;
		column: #packages  span: 2 ;
		column: #classes  span: 2 ;
		column: [:c | c
				row:  #attributes ;
				row:  #methods ]   span: 2 ;
		column: #links  span: 2 ;
		column: #summary span: 3.

	self
		browserModels ;
		browserBuffer ;
		browserPackages ;
		browserClasses ;
		browserAttributes ;
		browserMethods ;
		browserLinks ;
		browserSummary.
	
	browser subscribe: ORAnnouncement do: [browser update].
	browser subscribe: GLMBrowserClosing do: [self unsubscribeSelectedVersion].
	^ browser