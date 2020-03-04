*OrionFamixCore-Class
addAnnotationTypeNamed: aString inModel: aModelVersion
	aString
		ifNotNil: [ (ORActionAddAnnotationType new orionModel: aModelVersion; 
					container: self; name: aString) manualRun; postRun ]