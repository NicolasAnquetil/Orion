baselines
baseline01: spec
	<version: '0.1-baseline'>

	spec for: #'common' do: [
		spec blessing: #'baseline'.
		spec repository: 'http://smalltalkhub.com/mc/Moose/Orion/main/'.
		spec 
			project: 'FamixDiff' with: [
				spec
					className: #ConfigurationOfFamixDiff;
					versionString: #'development';
					repository: 'http://smalltalkhub.com/mc/Moose/FamixDiff/main/' ];
			project: 'Orion' with: [
				spec
					className: #ConfigurationOfOrion;
					versionString: #'development';
					repository: 'http://smalltalkhub.com/mc/Moose/Orion/main/' ].
		spec 
			package: 'Orion-Merge' with: [
				spec requires: #('Orion' 'FamixDiff' 'OrionFamixJava' ). ];
			package: 'Orion-Merge-Tests' with: [
				spec requires: #('Orion-Merge' ). ];
			package: #OrionFamixBodyHash with: [
				spec requires: #('OrionFamixCore' 'Orion' 'OrionFamixCore' 'FamixDiff' ). ];
			package: 'OrionFamixCore' with: [
				spec requires: #('Orion' ). ];
			package: 'OrionFamixJava' with: [
				spec requires: #('Orion' 'OrionFamixCore' ). ];
			package: 'OrionFamixSourceAnchor' with: [
				spec requires: #('Orion' 'OrionFamixCore' ). ]. ].
