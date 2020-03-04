creating class and trait
createCommentToATrait: anORTrait
	anORTrait
		comment:
			(String
				streamContents: [ :aStream | 
					aStream << 'A ' << anORTrait name
						<<
							' is a generated trait useful to Orion. All the methods are also generated from the instance variables of the corresponding famix class. The use links between the Orion traits follow the hierarchy of the Famix classes. ' ])