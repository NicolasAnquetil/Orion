Extension { #name : #ORActionAddParameterType }

{ #category : #'*OrionFamixJava' }
ORActionAddParameterType >> definedAnnotationTypes [
	^ definedAnnotationTypes
]

{ #category : #'*OrionFamixJava' }
ORActionAddParameterType >> definedAnnotationTypes: aValue [
	definedAnnotationTypes := aValue
]

{ #category : #'*OrionFamixJava' }
ORActionAddParameterType >> runOnJavaExtension: newEntity [
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
