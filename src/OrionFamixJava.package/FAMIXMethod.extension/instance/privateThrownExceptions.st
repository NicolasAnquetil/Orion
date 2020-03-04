*OrionFamixJava
privateThrownExceptions
		^ self privateState attributeAt: #thrownExceptions ifAbsentPut: [ FMMultivalueLink on: self opposite: #definingMethod: ]