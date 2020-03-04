gui
browserSummary

	{#models . #packages .  #classes . #methods} do: [:srcPanel |

	(browser transmit) to: #summary ; from: srcPanel ; andShow: [:b |
		b  list
			noSelection ;
			title: 'Properties' ;
			display: [ :anObject | entityInSummary := anObject. anObject mooseInterestingEntity mooseDescription allPrimitiveAttributes ] ;
			sorted: [:x :y | x name < y name] ;
			format: [:aProp | aProp name ,  '= ' ,  ([(entityInSummary mooseInterestingEntity mmGetProperty: aProp) asString] on: Error do: ['error']) ]  ;
			when: [ :anObject | 
				(anObject mooseInterestingEntity isKindOf: MooseEntity) and: [
					anObject mooseInterestingEntity mooseDescription allPrimitiveAttributes notEmpty ]]]
		].
