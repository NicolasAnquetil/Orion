"
A TFAMIXAssociation is a generated trait useful to Orion. All the methods are also generated from the instance variables of the corresponding famix class. The use links between the Orion traits follow the hierarchy of the Famix classes. 
"
Trait {
	#name : #TFAMIXAssociation,
	#traits : 'TFAMIXSourcedEntity',
	#classTraits : 'TFAMIXSourcedEntity classTrait',
	#category : 'OrionFamixCore-Trait'
}

{ #category : #'as yet unclassified' }
TFAMIXAssociation classSide >> isOrionClass [
	^ true
]

{ #category : #accessing }
TFAMIXAssociation >> famixClass [
	"All Orion classes are direct subclasses of their Famix counterpart"
	^ super famixClass superclass
]

{ #category : #accessing }
TFAMIXAssociation >> next [
	^ self nextOR: self currentContext
]

{ #category : #accessing }
TFAMIXAssociation >> nextOR: aVersion [
	^ self privateNext versionIn: aVersion
]

{ #category : #accessing }
TFAMIXAssociation >> previous [
	^ self previousOR: self currentContext
]

{ #category : #accessing }
TFAMIXAssociation >> previousOR: aVersion [
	^ self privatePrevious versionIn: aVersion
]
