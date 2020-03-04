running- public
createActionsForACollectionOfORClasses: aCollectionOfOREntities
	aCollectionOfOREntities do: [ :anEntity | self createActionForORClass: anEntity ]