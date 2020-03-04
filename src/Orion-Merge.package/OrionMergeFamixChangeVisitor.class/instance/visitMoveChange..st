visiting
visitMoveChange: aMoveChange
	famixAddVisitor currentEntity: aMoveChange.
	aMoveChange entity accept: famixAddVisitor