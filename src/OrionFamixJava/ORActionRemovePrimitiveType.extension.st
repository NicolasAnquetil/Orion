Extension { #name : #ORActionRemovePrimitiveType }

{ #category : #'*OrionFamixJava' }
ORActionRemovePrimitiveType >> runOnJavaExtension: anEntity [
	<toRun>
	<generated: true>
	entity definedAnnotationTypes do: [ :e | e deleteInAction: self ].

]
