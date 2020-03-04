creating method
addInstanceVariable: aString on: aClass
	[ aClass addInstVarNamed: aString ]
		on: DuplicatedSlotName
		do: [ "Slot already existing, just break and continue" ]