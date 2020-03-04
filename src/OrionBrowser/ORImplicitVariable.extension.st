Extension { #name : #ORImplicitVariable }

{ #category : #'*OrionBrowser' }
ORImplicitVariable >> deleteInAction: anORActionRemoveMethod [
	ORActionRemoveImplicitVariable new
		parentAction: anORActionRemoveMethod;
		orionModel: anORActionRemoveMethod orionModel;
		entity: self;
		run;
		postRun
]
