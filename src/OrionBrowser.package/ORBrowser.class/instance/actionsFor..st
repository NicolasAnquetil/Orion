private
actionsFor: each
	|posAction elements listOfAct |

	elements :=  each selection mooseInterestingEntity.
	posAction := (((ORAction withAllSubclasses flatCollect: [:act | Pragma allNamed: #OrionActionFor: in: act class])
					select:[:e | e arguments includes: elements class asString asSymbol]) collect:[:e | e methodClass soleInstance]) asOrderedCollection.
	listOfAct := OrderedCollection new.
	posAction do:[:ie | 
						|depend| 
						depend := ie needs: elements.
						depend isNil 
							ifTrue:[ 
								listOfAct add:(
								(GLMAction new)
									action:[:anAct | 
										elements currentContext isModifiable ifTrue:[
											ie new entity: elements; orionModel: elements currentContext; manualRun.
											elements currentContext system announcer announce: ORModelChanged]
										ifFalse:[
											ie new entity:elements; runOnNewVersionFrom: elements currentContext.
											elements currentContext system announcer announce: ORModelAdded
										]
									];
									title:ie description;
									yourself).]
							ifFalse:[
								depend do:[:anEl |
									listOfAct add:(
									(GLMAction new)
										action:[:anAct | 
											elements currentContext isModifiable ifTrue:[
												ie new entity:elements; to:anEl; orionModel: elements currentContext; manualRun.
												elements currentContext system announcer announce: ORModelChanged]
											ifFalse:[
												ie new entity:elements; to:anEl; runOnNewVersionFrom: elements currentContext.
												elements currentContext system announcer announce: ORModelAdded]
										];
										title:anEl mooseName;
										category:ie description;
										yourself).]].				
				].
	^listOfAct.