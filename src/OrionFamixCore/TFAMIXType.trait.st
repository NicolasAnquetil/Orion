"
A TFAMIXType is a generated trait useful to Orion. All the methods are also generated from the instance variables of the corresponding famix class. The use links between the Orion traits follow the hierarchy of the Famix classes. 
"
Trait {
	#name : #TFAMIXType,
	#traits : 'TFAMIXContainerEntity',
	#classTraits : 'TFAMIXContainerEntity classTrait',
	#category : 'OrionFamixCore-Trait'
}

{ #category : #'as yet unclassified' }
TFAMIXType classSide >> isOrionClass [
	^ true
]

{ #category : #adding }
TFAMIXType >> addInheritanceTo: superclass inModel: anORModel [
	^ (ORActionAddInheritance new
		orionModel: anORModel;
		subclass: self;
		superclass: superclass)
		manualRun;
		postRun
]

{ #category : #accessing }
TFAMIXType >> attributes [
	^ self attributesOR: self currentContext
]

{ #category : #accessing }
TFAMIXType >> attributesOR: aVersion [
	^ self privateAttributes versionIn: aVersion
]

{ #category : #accessing }
TFAMIXType >> behavioursWithDeclaredType [
	^ self behavioursWithDeclaredTypeOR: self currentContext
]

{ #category : #accessing }
TFAMIXType >> behavioursWithDeclaredTypeOR: aVersion [
	^ self privateBehavioursWithDeclaredType versionIn: aVersion
]

{ #category : #accessing }
TFAMIXType >> container [
	^ self containerOR: self currentContext
]

{ #category : #accessing }
TFAMIXType >> containerOR: aVersion [
	^ self privateContainer versionIn: aVersion
]

{ #category : #accessing }
TFAMIXType >> incomingReferences [
	^ self incomingReferencesOR: self currentContext
]

{ #category : #accessing }
TFAMIXType >> incomingReferencesOR: aVersion [
	^ self privateIncomingReferences versionIn: aVersion
]

{ #category : #accessing }
TFAMIXType >> methods [
	^ self methodsOR: self currentContext
]

{ #category : #accessing }
TFAMIXType >> methodsOR: aVersion [
	^ self privateMethods versionIn: aVersion
]

{ #category : #accessing }
TFAMIXType >> structuresWithDeclaredType [
	^ self structuresWithDeclaredTypeOR: self currentContext
]

{ #category : #accessing }
TFAMIXType >> structuresWithDeclaredTypeOR: aVersion [
	^ self privateStructuresWithDeclaredType versionIn: aVersion
]

{ #category : #accessing }
TFAMIXType >> subInheritances [
	^ self subInheritancesOR: self currentContext
]

{ #category : #accessing }
TFAMIXType >> subInheritancesOR: aVersion [
	^ self privateSubInheritances versionIn: aVersion
]

{ #category : #accessing }
TFAMIXType >> superInheritances [
	^ self superInheritancesOR: self currentContext
]

{ #category : #accessing }
TFAMIXType >> superInheritancesOR: aVersion [
	^ self privateSuperInheritances versionIn: aVersion
]
