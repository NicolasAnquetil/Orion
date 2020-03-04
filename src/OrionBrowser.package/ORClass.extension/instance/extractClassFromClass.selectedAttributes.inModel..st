*OrionBrowser
extractClassFromClass: aString selectedAttributes: aList inModel: aModelVersion

"|teste|"
	"aString  ifNotNil: [ "
		( "teste :=" ORActionExtractClass new
			orionModel: aModelVersion ;
			container: self;
			entity: self;
			selectedAttributes: aList;
			newName: aString)
			 manualRun; postRun"]."
		
	"Transcript show: teste entity ."
	