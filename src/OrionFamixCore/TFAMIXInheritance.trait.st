"
A TFAMIXInheritance is a generated trait useful to Orion. All the methods are also generated from the instance variables of the corresponding famix class. The use links between the Orion traits follow the hierarchy of the Famix classes. 
"
Trait {
	#name : #TFAMIXInheritance,
	#traits : 'TFAMIXAssociation',
	#classTraits : 'TFAMIXAssociation classTrait',
	#category : 'OrionFamixCore-Trait'
}

{ #category : #'as yet unclassified' }
TFAMIXInheritance classSide >> isOrionClass [
	^ true
]

{ #category : #accessing }
TFAMIXInheritance >> subclass [
	^ self subclassOR: self currentContext
]

{ #category : #accessing }
TFAMIXInheritance >> subclassOR: aVersion [
	^ self privateSubclass versionIn: aVersion
]

{ #category : #accessing }
TFAMIXInheritance >> superclass [
	^ self superclassOR: self currentContext
]

{ #category : #accessing }
TFAMIXInheritance >> superclassOR: aVersion [
	^ self privateSuperclass versionIn: aVersion
]
