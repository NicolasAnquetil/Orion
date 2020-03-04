"
A TFAMIXAccess is  a generated trait useful to Orion. All the methods are also generated from the instance variables of the corresponding famix class. The use links between the Orion traits follow the hierarchy of the Famix classes. 
"
Trait {
	#name : #TFAMIXAccess,
	#traits : 'TFAMIXAssociation',
	#classTraits : 'TFAMIXAssociation classTrait',
	#category : 'OrionFamixCore-Trait'
}

{ #category : #'as yet unclassified' }
TFAMIXAccess classSide >> isOrionClass [
	^ true
]

{ #category : #accessing }
TFAMIXAccess >> accessor [
	^ self accessorOR: self currentContext
]

{ #category : #accessing }
TFAMIXAccess >> accessorOR: aVersion [
	^ self privateAccessor versionIn: aVersion
]

{ #category : #accessing }
TFAMIXAccess >> isWrite [
	^ self isWriteOR: self currentContext
]

{ #category : #accessing }
TFAMIXAccess >> isWriteOR: aVersion [
	^ self privateIsWrite versionIn: aVersion
]

{ #category : #accessing }
TFAMIXAccess >> variable [
	^ self variableOR: self currentContext
]

{ #category : #accessing }
TFAMIXAccess >> variableOR: aVersion [
	^ self privateVariable versionIn: aVersion
]
