*OrionFamixJava
privateDefinedAnnotationTypes
		^ self privateState attributeAt: #definedAnnotationTypes ifAbsentPut: [FMMultivalueLink on: self opposite: #container: ]