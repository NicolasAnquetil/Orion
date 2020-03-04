creating
populateModel
	self sourceLanguage: self parentModel sourceLanguage.
	self parentModel entityStorage
		do: [ :anElement | 
			self entityStorage add: anElement.
			anElement addModel: self ]