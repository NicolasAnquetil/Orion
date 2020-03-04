creating action class
createActionFor: anOREntity type: action
	| aClass |
	aClass := (self obtainActionSuperClass: anOREntity actionType: action)
		subclass: (self createActionClassNameWithType: action for: anOREntity) asSymbol
		uses: {}
		instanceVariableNames: ''
		classVariableNames: ''
		poolDictionaries: ''
		category: (self createClassCategoryName: anOREntity superclass).
	self createCommentToAnORAction: aClass.
	self generateRequiredMethods: aClass for: anOREntity