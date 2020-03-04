*OrionFamixJava
privateExceptions
		^ self privateState attributeAt: #exceptions ifAbsentPut: [ FMMultivalueLink on: self opposite: #exceptionClass: ]