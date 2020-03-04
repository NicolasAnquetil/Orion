*OrionCore-model
valueCopy
	"Must copy the associations, or later store will affect both the
original and the copy"

	values := values collect: [ :val |
		val ifNotNil: [ val shallowCopy ] ].