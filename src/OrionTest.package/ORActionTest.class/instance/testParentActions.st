testing OrionModel
testParentActions
	| act1 act2 act3 |
	act1 := ORActionAddClass new
		name: 'parentAct';
		yourself.
	self assert: act1 childrenActions isEmpty.
	self assert: act1 isManual.
	act2 := ORActionAddClass new
		name: '1stChildAct';
		parentAction: act1;
		yourself.
	self assert: act1 isManual.
	self deny: act2 isManual.
	self assert: act2 parentAction equals: act1.
	self assert: act1 childrenActions size equals: 1.
	act3 := ORActionAddClass new
		name: '2ndChildAct';
		parentAction: act1;
		yourself.
	self assert: act1 childrenActions size equals: 2.
	act2 parentAction: nil.
	self assert: act2 isManual.
	self assert: act1 childrenActions size equals: 1