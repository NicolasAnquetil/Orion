Extension { #name : #ORActionRemoveTypeAlias }

{ #category : #'*OrionFamixJava' }
ORActionRemoveTypeAlias >> runOnJavaExtension: anEntity [
	<toRun>
	<generated: true>
	entity definedAnnotationTypes do: [ :e | e deleteInAction: self ].

]
