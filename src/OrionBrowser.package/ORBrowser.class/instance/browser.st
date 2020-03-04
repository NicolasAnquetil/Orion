accessing
browser
	"
		self new browser openOn: ORSystem root
	"
	| browser  |
	
	browser := GLMTabulator new.
	
	browser column: #models span: 1; column: [:c | c row:#versions; row: #changes] span: 1; column: #categories span: 4.
	(browser transmit) to: #models; andShow: [:b |
		b list
			format:[:system | system name];
			display: [:each | each ].
	].
	
	(browser transmit) from: #models; to: #versions; andShow: [:b | 
		b tree
			allExpanded;
			format:[:system | system name];
			display: [:each | each orionModels select:[:om | om parentModel = nil]];
			children: [:each | each childrenModel];
			act: [:each | each selection inspect] entitled: 'inspect';
			act: [:each | each selection createNewChildVersion. ORSystem announcer announce: ORModelAdded. browser announce: ORAnnouncement] entitled: 'create a child version';
			act: [:each | each selection delete. ORSystem announcer announce: ORModelRemoved. browser announce: ORAnnouncement] entitled: 'delete'.
	].
	(browser transmit) to: #changes; from: #versions; andShow: [:b |
		b list
			display: [:each | each changes];
			title: [ :each | each changes size asString, ' changes'].
	].
	(browser transmit) to: #categories; from: #versions; andShow: [:b |
		b finder
			show: [:a |
				a custom: (self groupList).
				a custom: self entityNavigation.
			].
	 ].
	browser subscribe: ORAnnouncement do: [browser update].
	^ browser