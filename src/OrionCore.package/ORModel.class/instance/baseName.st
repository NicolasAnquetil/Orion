accessing
baseName
	|op|
	op := 1.
	^self name copyFrom: 1 to: ((self name indexOf:$_ ifAbsent:[op := 0.self name size]) - op)