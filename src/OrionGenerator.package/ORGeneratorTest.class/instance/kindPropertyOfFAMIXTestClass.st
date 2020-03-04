tests
kindPropertyOfFAMIXTestClass
	^ (aGenerator getPropertiesOf: FAMIXTestClass) detect: [ :e | e name = #kind ]