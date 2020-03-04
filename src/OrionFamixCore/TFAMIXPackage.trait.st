"
A TFAMIXPackage is a generated trait useful to Orion. All the methods are also generated from the instance variables of the corresponding famix class. The use links between the Orion traits follow the hierarchy of the Famix classes. 
"
Trait {
	#name : #TFAMIXPackage,
	#traits : 'TFAMIXScopingEntity',
	#classTraits : 'TFAMIXScopingEntity classTrait',
	#category : 'OrionFamixCore-Trait'
}

{ #category : #'as yet unclassified' }
TFAMIXPackage classSide >> isOrionClass [
	^ true
]

{ #category : #adding }
TFAMIXPackage >> addClassNamed: aString isStub: aBoolean inModel: aModelVersion [
	^ self
		addClassNamed: aString
		isStub: aBoolean
		withNamespace: aModelVersion allNamespaces first
		inModel: aModelVersion
]

{ #category : #accessing }
TFAMIXPackage >> childNamedEntities [
	^ self childNamedEntitiesOR: self currentContext
]

{ #category : #accessing }
TFAMIXPackage >> childNamedEntitiesOR: aVersion [
	^ self privateChildNamedEntities versionIn: aVersion
]
