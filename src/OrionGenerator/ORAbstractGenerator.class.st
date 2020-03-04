"
Abstract class for orion generator
"
Class {
	#name : #ORAbstractGenerator,
	#superclass : #Object,
	#category : 'OrionGenerator'
}

{ #category : #'creating class and trait' }
ORAbstractGenerator >> createClassCategoryName: aFamixClass [
	^ String
		streamContents: [ :stream | 
			stream << 'Orion'.
			($- split: aFamixClass category) asStringOn: stream delimiter: ''.
			stream << '-'; << self typeOfGeneratedObject ]
]

{ #category : #'creating method' }
ORAbstractGenerator >> getExtendedPropertiesOf: aFamixClass [
	^ self selectExtendedPropertiesAmong: aFamixClass mooseDescription attributes
]

{ #category : #'creating method' }
ORAbstractGenerator >> getPropertiesOf: aFamixClass [
	^ self selectPropertiesAmong: aFamixClass mooseDescription attributes
]

{ #category : #'creating method' }
ORAbstractGenerator >> selectExtendedPropertiesAmong: aCollectionOfProperties [
	^ (aCollectionOfProperties reject: [ :a | a mmClass implementingClass allInstVarNames includes: a name ])
		select: [ :e | 
			(e type isPrimitive and: [ e isDerived not ])
				or: [ (e type isPrimitive not and: [ e hasOpposite ]) and: [ e isMultivalued or: [ e opposite isMultivalued ] ] ] ]
]

{ #category : #'creating method' }
ORAbstractGenerator >> selectPropertiesAmong: aCollectionOfProperties [
	^ aCollectionOfProperties select: [ :a | a mmClass implementingClass allInstVarNames includes: a name ]
]

{ #category : #accessing }
ORAbstractGenerator >> typeOfGeneratedObject [
	self subclassResponsibility
]
