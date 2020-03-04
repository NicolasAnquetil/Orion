Extension { #name : #ORActionRemoveParameterType }

{ #category : #'*OrionFamixJava' }
ORActionRemoveParameterType >> runOnJavaExtension: anEntity [
	<toRun>
	<generated: true>
	entity definedAnnotationTypes do: [ :e | e deleteInAction: self ].

]
