*OrionBrowser
addMethodNamed: aString inAction: anAction
	aString
		ifNotNil: [ (ORActionAddMethod new
				parentAction: anAction;
				orionModel: anAction orionModel;
				parentType: self;
				name: aString) run ]