running- public
createActionForORClass: anORClass
	(anORClass isOrionClass and: [ anORClass isRootEntity not ])
		ifTrue: [ #(#Add #Remove #Move #Rename)
				do: [ :action | 
					(self isAction: action validFor: anORClass)
						ifTrue: [ self createActionFor: anORClass type: action ] ] ]