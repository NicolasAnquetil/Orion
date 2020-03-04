Extension { #name : #ORActionRemoveNamespace }

{ #category : #'*OrionFamixJava' }
ORActionRemoveNamespace >> runOnJavaExtension: anEntity [
	<toRun>
	<generated: true>
	entity definedAnnotationTypes do: [ :e | e deleteInAction: self ].

]
