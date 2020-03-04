*OrionFamixJava
privateCaughtExceptions
		^ self privateState attributeAt: #caughtExceptions ifAbsentPut: [ FMMultivalueLink on: self opposite: #definingMethod: ]