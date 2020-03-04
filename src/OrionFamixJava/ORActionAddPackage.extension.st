Extension { #name : #ORActionAddPackage }

{ #category : #'*OrionFamixJava' }
ORActionAddPackage >> definedAnnotationTypes [
	^ definedAnnotationTypes
]

{ #category : #'*OrionFamixJava' }
ORActionAddPackage >> definedAnnotationTypes: aValue [
	definedAnnotationTypes := aValue
]

{ #category : #'*OrionFamixJava' }
ORActionAddPackage >> runOnJavaExtension: newEntity [
	<toRun>
	<generated: true>
	"Set primitive not derived properties of the entity"
	"Set complex not derived properties of the entity"
	self definedAnnotationTypes
		ifNotNil: [ | theNewEntities |
			theNewEntities := OrderedCollection withAll: (self definedAnnotationTypes collect: [:e | self orionModel retrieveEntity: e ]).
			newEntity privateDefinedAnnotationTypes: theNewEntities orionCopy.
			theNewEntities do: [:e | e privateContainer: newEntity ] ].

]
