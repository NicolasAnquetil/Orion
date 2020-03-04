accessing
model: anObject
	self addModel: anObject.
	^ attributes at: #privateModel put: anObject