"
A TFAMIXTypeAlias is a generated trait useful to Orion. All the methods are also generated from the instance variables of the corresponding famix class. The use links between the Orion traits follow the hierarchy of the Famix classes. 
"
Trait {
	#name : #TFAMIXTypeAlias,
	#traits : 'TFAMIXType',
	#classTraits : 'TFAMIXType classTrait',
	#category : 'OrionFamixCore-Trait'
}

{ #category : #'as yet unclassified' }
TFAMIXTypeAlias classSide >> isOrionClass [
	^ true
]

{ #category : #accessing }
TFAMIXTypeAlias >> aliasedType [
	^ self aliasedTypeOR: self currentContext
]

{ #category : #accessing }
TFAMIXTypeAlias >> aliasedTypeOR: aVersion [
	^ self privateAliasedType versionIn: aVersion
]
