*OrionBrowser
orBrowserExceptionsUIManager
	"Generate an Alert when an exception is launched in the OrionBrowser"
	self
		on: Error
		do: [ :exception | UIManager default alert: exception messageText ]