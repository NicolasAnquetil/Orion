opening
menuCommandOn: aBuilder
	<worldMenu>
	(aBuilder item: #'Orion')
		order: 10.0; 
		parent: #Moose;
		label: 'Orion Panel';
		action:[OrionBrowser open];
		withSeparatorAfter 