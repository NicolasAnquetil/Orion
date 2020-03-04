*OrionFamixJava
privateDeclaredExceptions
		^ self privateState attributeAt: #declaredExceptions ifAbsentPut: [ FMMultivalueLink on: self opposite: #definingMethod: ]