*OrionBrowser
orNoNameExceptionLauncher
	"Launch an exception in OrionBrowser and create the alert message"

	self
		on: Error
		do: [ :e | OrionNoNameException signal: 'The name of the entity to add is nil \Please provide a right name.' withCRs ]