baselines
baseline02: spec 
	<version: '02-baseline'>
	spec for: #common do: [
		spec blessing: #baseline.
	
		spec repository: 'http://smalltalkhub.com/mc/Moose/Orion/main'.
		spec 
			package: 'OrionCore';
			package: 'OrionBrowser';
			package: 'OrionTest';
			package: 'Orion-TestModel-Constellation1';
			package: 'Orion-TestModel-Constellation2'.
		spec repository: 'http://smalltalkhub.com/mc/AnneEtien/FamixDiff/main'.
		spec 
			package: 'Famix-Diff-Orion'.
	].