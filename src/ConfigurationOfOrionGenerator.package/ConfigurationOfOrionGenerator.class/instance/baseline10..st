as yet unclassified
baseline10: spec
	<version: '1.0-baseline'>
	spec
		for: #common
		do: [ 
			spec blessing: #baseline.
			spec author: 'Anne Etien'.
			spec description: 'work on Pharo 2.0'.
			spec repository: 'http://smalltalkhub.com/mc/Moose/Orion/main'.
			spec package: 'OrionGenerator'.
			spec package: 'OrionCore' ]