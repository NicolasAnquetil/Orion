creating action class
createCommentToAnORAction: anORAction
	anORAction
		comment:
			(String
				streamContents: [ :aStream | 
					aStream
						nextPutAll: 'A ';
						nextPutAll: anORAction name;
						nextPutAll:
								' is a generated class useful to Orion. It corresponds to an action that can be performed on a type of model element. See OrionGenerator in Moose/Orion on SmalltalkHub for more information.' ])