baselines
baseline01: spec 
	<version: '01-baseline'>
	spec for: #common do: [
		spec blessing: #baseline.
	
		spec repository: 'http://ss3.gemstone.com/ss/Orion'.
		spec 
			package: 'OrionCore';
			package: 'OrionBrowser';
			package: 'OrionTest';
			package: 'Orion-TestModel-Constellation1';
			package: 'Orion-TestModel-Constellation2'.
						
	].