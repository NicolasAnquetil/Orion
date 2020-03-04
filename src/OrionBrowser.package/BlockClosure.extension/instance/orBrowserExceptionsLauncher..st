*OrionBrowser
orBrowserExceptionsLauncher: anObject
	"Launch an exception in OrionBrowser and create the alert message"		

	 self on: MessageNotUnderstood
		do: [
			 :e |  | mess | 
			e message ifNotNil:[mess := e message name] ifNil: [ mess := e messageText asString  ].
			OrionBrowserException
				signal:
					('The "' , mess , '" message is not supported by "' , anObject class name
						, '" (buffered entity) \Please check if this message exists.') withCRs ] 