An ORActionGenerator is a tool to easily create the skeleton of ORActions.

You can use it by providing a collection of OREntities: 
	ORActionGenerator new createActionsForACollectionOfORClasses: { MyOREntityClass1 . MyOREntityClass2 }

Look at the class side method for actual usage.

ORActionGenerator createActionsForORClasses: ('OrionFamixCore' asPackage definedClasses reject: #isTrait).