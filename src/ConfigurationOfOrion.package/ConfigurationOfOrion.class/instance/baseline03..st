baselines
baseline03: spec
	<version: '03-baseline'>

	spec for: #'common' do: [
		spec blessing: #'baseline'.
		spec repository: 'http://smalltalkhub.com/mc/Moose/Orion/main'.
		spec 
			package: 'OrionCore';
			package: 'OrionFamixCore' with: [
				spec requires: #('OrionCore' 'OrionCore' ). ];
			package: 'OrionBrowser' with: [
				spec requires: #('OrionCore' 'OrionFamixCore' 'OrionCore' 'OrionFamixCore' ). ];
			package: 'OrionTest';
			package: 'Orion-TestModel-Constellation1';
			package: 'Orion-TestModel-Constellation2';
			package: 'OrionFamixJava' with: [
				spec requires: #('OrionFamixCore' ). ];
			package: 'Famix-Diff-Orion'.
		spec 
			group: 'default' with: #('OrionCore' 'OrionFamixCore' 'OrionBrowser' 'OrionTest' 'Orion-TestModel-Constellation1' 'Orion-TestModel-Constellation2');
			group: 'java' with: #('OrionCore' 'OrionFamixCore' 'OrionBrowser' 'OrionTest' 'Orion-TestModel-Constellation1' 'Orion-TestModel-Constellation2' 'OrionFamixJava' ). ].
