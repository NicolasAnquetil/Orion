*OrionBrowser
orBrowserExceptionsLauncherCollection: anObject
	"Launch an exception in OrionBrowser and create the alert message"

	self
		on: MessageNotUnderstood
		do: [ :e | 
			| mess |
			mess := e message ifNotNil: [ e message selector ] ifNil: [ e messageText asString ].
			OrionBrowserException
				signal:
					('The "' , mess , '" message is not supported by "' , anObject first class name
						, '" (buffered entity) \Please check if this message exists.') withCRs ]