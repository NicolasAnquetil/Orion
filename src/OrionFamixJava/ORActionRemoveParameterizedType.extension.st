Extension { #name : #ORActionRemoveParameterizedType }

{ #category : #'*OrionFamixJava' }
ORActionRemoveParameterizedType >> runOnJavaExtension: anEntity [
	<toRun>
	<generated: true>
	entity definedAnnotationTypes do: [ :e | e deleteInAction: self ].

]
