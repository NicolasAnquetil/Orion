Extension { #name : #ORActionRemoveParameterizableClass }

{ #category : #'*OrionFamixJava' }
ORActionRemoveParameterizableClass >> runOnJavaExtension: anEntity [
	<toRun>
	<generated: true>
	entity definedAnnotationTypes do: [ :e | e deleteInAction: self ].

]
