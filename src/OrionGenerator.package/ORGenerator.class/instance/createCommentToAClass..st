creating class and trait
createCommentToAClass: anORClass
	anORClass
		classComment:
			(String
				streamContents: [ :aStream | aStream << 'A ' << anORClass name << ' is a generated class useful to Orion. All the methods are also generated from the instance variables of the corresponding famix class.' ])