*OrionCore-model
orionRemove: element
	values
		remove: (values detect: [ :e | e mooseID = element mooseID ] ifNone: [ nil ])
		ifAbsent: [ nil ]