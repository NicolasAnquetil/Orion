gui
versionChangesPane: gmlTree

		gmlTree
			selectionSpawn: [:theList |
				|tmpBrowser| 
				tmpBrowser := GLMTabulator new row: #one; "initialExtent: 100@100 ;" yourself.
				tmpBrowser
					transmit to: #one ; andShow: [:brows | 
						brows tree
							display: [:aVersion | aVersion changes select: [:chg | chg parentAction isNil]] ;
							children: [:aChange | aChange childrenActions];
							format:[:aChange | aChange printWorkspace];
							title: [ :aVersion | ' Changes in ' , (aVersion name)] ].
				tmpBrowser startOn: theList selection
				] entitled: 'List changes' .