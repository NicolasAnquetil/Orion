accessing
versionIn: anOrionModel
	| upEntity |
	upEntity := anOrionModel entityStorage
		atID: self mooseID
		ifAbsent: [ "OREntityNotFoundInCurrentModel signal: self model: anOrionModel."
			^ nil	"Should NEVER happen (excepted in one cases. See (*))... If it is happening, you are NOT in the right model and currentContext of the caller should have been set to the right model where the considered entity is existing. By set, I mean for at least the first entity where you begin the query; the currentContext is transmitted to the other entities  ---VB---
				(*) In fact, this method should answer nil only in one case, and only in this one: 	if an entity of a previous model has been deleted and is acceeded by a single value selector (i.e. not a multivalued one). E.g:						
						Let M1 and M2, 2 models. M1 is the parent of M2. 
						Let A and B 2 entites of M1, where we can access B from A through a method called m(). m() answers either an object or nil.
						If B is deleted in M2, the call of m() on A, in M1 should give B and in M2, nil.
						Calling m(), call privateM() that gives all the B in all the models: B. But, B does not exists in M2.
						I, versionIn:, do not find B in M2 (as expected), so fall in this absent block. AND SHOULD RETURN nil... (so disagree with Jannik Thesis: https://tel.archives-ouvertes.fr/tel-00601546...)" ].
	upEntity currentContext: anOrionModel.
	^ upEntity