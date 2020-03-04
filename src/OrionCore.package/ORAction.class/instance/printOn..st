printing
printOn: stream 

	stream 
		nextPutAll: self class name;
		nextPut: $(;
		nextPutAll: entity class name;
		nextPut: $);
		nextPutAll:  entity mooseName