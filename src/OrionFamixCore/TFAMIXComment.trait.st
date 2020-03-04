"
A TFAMIXComment is a generated trait useful to Orion. All the methods are also generated from the instance variables of the corresponding famix class. The use links between the Orion traits follow the hierarchy of the Famix classes. 
"
Trait {
	#name : #TFAMIXComment,
	#traits : 'TFAMIXSourcedEntity',
	#classTraits : 'TFAMIXSourcedEntity classTrait',
	#category : 'OrionFamixCore-Trait'
}

{ #category : #'as yet unclassified' }
TFAMIXComment classSide >> isOrionClass [
	^ true
]

{ #category : #accessing }
TFAMIXComment >> container [
	^ self containerOR: self currentContext
]

{ #category : #accessing }
TFAMIXComment >> containerOR: aVersion [
	^ self privateContainer versionIn: aVersion
]

{ #category : #accessing }
TFAMIXComment >> content [
	^ self contentOR: self currentContext
]

{ #category : #accessing }
TFAMIXComment >> contentOR: aVersion [
	^ self privateContent versionIn: aVersion
]

{ #category : #accessing }
TFAMIXComment >> famixClass [
	"All Orion classes are direct subclasses of their Famix counterpart"
	^ super famixClass superclass
]
