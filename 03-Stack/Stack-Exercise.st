!classDefinition: #OOStackTest category: #'Stack-Exercise'!
TestCase subclass: #OOStackTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOStackTest methodsFor: 'test' stamp: 'HernanWilkinson 5/7/2012 11:30'!
test01StackShouldBeEmptyWhenCreated

	| stack |
	
	stack := OOStack new.
	
	self assert: stack isEmpty! !

!OOStackTest methodsFor: 'test' stamp: 'HernanWilkinson 5/7/2012 11:30'!
test02PushAddElementsToTheStack

	| stack |
	
	stack := OOStack new.
	stack push: 'Something'.
	
	self deny: stack isEmpty! !

!OOStackTest methodsFor: 'test' stamp: 'HernanWilkinson 5/7/2012 11:31'!
test03PopRemovesElementsFromTheStack

	| stack |
	
	stack := OOStack new.
	stack push: 'Something'.
	stack pop.
	
	self assert: stack isEmpty! !

!OOStackTest methodsFor: 'test' stamp: 'HernanWilkinson 5/8/2012 08:20'!
test04PopReturnsLastPushedObject

	| stack pushedObject |
	
	stack := OOStack new.
	pushedObject := 'Something'.
	stack push: pushedObject.
	
	self assert: stack pop = pushedObject! !

!OOStackTest methodsFor: 'test' stamp: 'HernanWilkinson 5/7/2012 11:33'!
test05StackBehavesLIFO

	| stack firstPushedObject secondPushedObject |
	
	stack := OOStack new.
	firstPushedObject := 'First'.
	secondPushedObject := 'Second'.
	
	stack push: firstPushedObject.
	stack push: secondPushedObject.
	
	self assert: stack pop = secondPushedObject.
	self assert: stack pop = firstPushedObject.
	self assert: stack isEmpty 
	! !

!OOStackTest methodsFor: 'test' stamp: 'HernanWilkinson 5/7/2012 11:35'!
test06TopReturnsLastPushedObject

	| stack pushedObject |
	
	stack := OOStack new.
	pushedObject := 'Something'.
	
	stack push: pushedObject.
	
	self assert: stack top = pushedObject.
	! !

!OOStackTest methodsFor: 'test' stamp: 'HernanWilkinson 5/7/2012 11:36'!
test07TopDoesNotRemoveObjectFromStack

	| stack pushedObject |
	
	stack := OOStack new.
	pushedObject := 'Something'.
	
	stack push: pushedObject.
	
	self assert: stack size = 1.
	stack top.
	self assert: stack size = 1.
	! !

!OOStackTest methodsFor: 'test' stamp: 'HAW 4/14/2017 22:48:26'!
test08CanNotPopWhenThereAreNoObjectsInTheStack

	| stack  |
	
	stack := OOStack new.
	self
		should: [ stack pop ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = OOStack stackEmptyErrorDescription ]
		
! !

!OOStackTest methodsFor: 'test' stamp: 'HAW 4/14/2017 22:48:36'!
test09CanNotPopWhenThereAreNoObjectsInTheStackAndTheStackHadObjects

	| stack  |
	
	stack := OOStack new.
	stack push: 'Something'.
	stack pop.
	
	self
		should: [ stack pop ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = OOStack stackEmptyErrorDescription ]
		
! !

!OOStackTest methodsFor: 'test' stamp: 'HAW 4/14/2017 22:48:44'!
test10CanNotTopWhenThereAreNoObjectsInTheStack

	| stack  |
	
	stack := OOStack new.
	self
		should: [ stack top ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = OOStack stackEmptyErrorDescription ]
		
! !


!classDefinition: #OOStack category: #'Stack-Exercise'!
Object subclass: #OOStack
	instanceVariableNames: 'topNode'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOStack methodsFor: 'testing' stamp: 'DS 4/24/2018 19:23:15'!
isEmpty

	^ topNode isEmpty.! !


!OOStack methodsFor: 'adding' stamp: 'DS 4/24/2018 19:31:47'!
push: anObject
	| aNode |
	aNode _ ValueStackNode
		with: anObject
		after: topNode.
	topNode _ aNode.! !


!OOStack methodsFor: 'initialization' stamp: 'DS 4/24/2018 19:31:28'!
initialize
	topNode _ NullStackNode new.! !


!OOStack methodsFor: 'removing' stamp: 'DS 4/24/2018 19:23:20'!
pop

	| lastNode |
	
	lastNode _ topNode.
	topNode _ lastNode next.
	^ lastNode value.! !


!OOStack methodsFor: 'accessing' stamp: 'DS 4/24/2018 19:23:36'!
size

	^ topNode size.! !

!OOStack methodsFor: 'accessing' stamp: 'DS 4/24/2018 19:23:40'!
top

	^ topNode value.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'OOStack class' category: #'Stack-Exercise'!
OOStack class
	instanceVariableNames: ''!

!OOStack class methodsFor: 'error descriptions' stamp: 'HernanWilkinson 5/7/2012 11:51'!
stackEmptyErrorDescription
	
	^ 'Stack is empty'! !


!OOStack class methodsFor: 'instance creation' stamp: 'DS 4/23/2018 22:31:21'!
new
	^super new initialize! !


!classDefinition: #StackNode category: #'Stack-Exercise'!
Object subclass: #StackNode
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!StackNode methodsFor: 'accessing' stamp: 'DS 4/24/2018 19:37:04'!
next

	self subclassResponsibility ! !

!StackNode methodsFor: 'accessing' stamp: 'DS 4/24/2018 19:35:16'!
size

	self subclassResponsibility ! !

!StackNode methodsFor: 'accessing' stamp: 'DS 4/23/2018 23:35:57'!
value

	self subclassResponsibility ! !


!StackNode methodsFor: 'testing' stamp: 'DS 4/23/2018 23:39:06'!
isEmpty

	self subclassResponsibility ! !


!classDefinition: #NullStackNode category: #'Stack-Exercise'!
StackNode subclass: #NullStackNode
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!NullStackNode methodsFor: 'testing' stamp: 'DS 4/23/2018 23:39:32'!
isEmpty

	^true! !


!NullStackNode methodsFor: 'accessing' stamp: 'DS 4/24/2018 19:36:45'!
next

	self error: self class stackEmptyErrorDescription! !

!NullStackNode methodsFor: 'accessing' stamp: 'DS 4/24/2018 19:35:27'!
size

	^0! !

!NullStackNode methodsFor: 'accessing' stamp: 'DS 4/23/2018 23:49:28'!
value

	self error: self class stackEmptyErrorDescription! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'NullStackNode class' category: #'Stack-Exercise'!
NullStackNode class
	instanceVariableNames: ''!

!NullStackNode class methodsFor: 'error descriptions' stamp: 'DS 4/23/2018 23:46:17'!
stackEmptyErrorDescription
	
	^ 'Stack is empty'! !


!classDefinition: #ValueStackNode category: #'Stack-Exercise'!
StackNode subclass: #ValueStackNode
	instanceVariableNames: 'next value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!ValueStackNode methodsFor: 'testing' stamp: 'DS 4/23/2018 23:39:44'!
isEmpty

	^false! !

!ValueStackNode methodsFor: 'testing' stamp: 'DS 4/24/2018 19:35:52'!
size

	^1 + next size! !


!ValueStackNode methodsFor: 'accessing' stamp: 'DS 4/24/2018 19:26:43'!
next

	^next! !

!ValueStackNode methodsFor: 'accessing' stamp: 'DS 4/23/2018 23:54:17'!
value

	^value! !


!ValueStackNode methodsFor: 'initialization' stamp: 'DS 4/24/2018 19:24:48'!
setValue: anObject after: aNode

	value _ anObject.
	next _ aNode! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'ValueStackNode class' category: #'Stack-Exercise'!
ValueStackNode class
	instanceVariableNames: ''!

!ValueStackNode class methodsFor: 'instance creation' stamp: 'DS 4/24/2018 19:18:28'!
with: anObject after: aNode

	^super new setValue: anObject after: aNode! !
