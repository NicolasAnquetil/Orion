*OrionFamixJava
privateArgumentsInParameterizedTypes
		^ self privateState attributeAt: #argumentsInParameterizedTypes ifAbsentPut: [ FMMultiMultivalueLink on: self opposite: #arguments ]