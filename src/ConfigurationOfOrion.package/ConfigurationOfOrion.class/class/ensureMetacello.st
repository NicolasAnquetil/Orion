private
ensureMetacello
	Smalltalk at: #MetacelloProject ifAbsent: [
		Gofer new
				url: 'http://smalltalkhub.com/mc/dkh/metacello/main';
				package: 'ConfigurationOfMetacello';
				load.
		(Smalltalk at: #ConfigurationOfMetacello) loadLatestVersion ]