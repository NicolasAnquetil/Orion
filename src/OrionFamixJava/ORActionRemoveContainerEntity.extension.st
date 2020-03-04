Extension { #name : #ORActionRemoveContainerEntity }

{ #category : #'*OrionFamixJava' }
ORActionRemoveContainerEntity >> runOnJavaExtension: anEntity [
	<toRun>
	<generated: true>
	entity definedAnnotationTypes do: [ :e | e deleteInAction: self ].

]
