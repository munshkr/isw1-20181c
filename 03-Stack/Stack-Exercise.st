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
	instanceVariableNames: 'collection'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOStack methodsFor: 'testing' stamp: 'DS 4/23/2018 23:55:29'!
isEmpty

	^collection last isEmpty ! !


!OOStack methodsFor: 'adding' stamp: 'DS 4/23/2018 23:52:10'!
push: anObject
	
	| aNode |
	
	aNode _ ValidStackNode new: anObject.
	collection addLast: aNode! !


!OOStack methodsFor: 'initialization' stamp: 'DS 4/23/2018 23:55:23'!
initialize

	collection _ OrderedCollection new.
	collection addLast: EmptyStackNode new! !


!OOStack methodsFor: 'removing' stamp: 'DS 4/23/2018 23:55:39'!
pop

	collection last onRemove.
	^collection removeLast value! !


!OOStack methodsFor: 'accessing' stamp: 'DS 4/23/2018 23:55:45'!
size

	^collection size - 1! !

!OOStack methodsFor: 'accessing' stamp: 'DS 4/23/2018 23:55:50'!
top

	^collection last value! !

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

!StackNode methodsFor: 'accessing' stamp: 'DS 4/23/2018 23:35:57'!
value

	self subclassResponsibility ! !


!StackNode methodsFor: 'testing' stamp: 'DS 4/23/2018 23:39:06'!
isEmpty

	self subclassResponsibility ! !


!StackNode methodsFor: 'private' stamp: 'DS 4/23/2018 23:45:10'!
onRemove

	self subclassResponsibility ! !


!classDefinition: #EmptyStackNode category: #'Stack-Exercise'!
StackNode subclass: #EmptyStackNode
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!EmptyStackNode methodsFor: 'testing' stamp: 'DS 4/23/2018 23:39:32'!
isEmpty

	^true! !


!EmptyStackNode methodsFor: 'private' stamp: 'DS 4/23/2018 23:46:01'!
onRemove

	self error: self class stackEmptyErrorDescription! !


!EmptyStackNode methodsFor: 'accessing' stamp: 'DS 4/23/2018 23:49:28'!
value

	self error: self class stackEmptyErrorDescription! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'EmptyStackNode class' category: #'Stack-Exercise'!
EmptyStackNode class
	instanceVariableNames: ''!

!EmptyStackNode class methodsFor: 'error descriptions' stamp: 'DS 4/23/2018 23:46:17'!
stackEmptyErrorDescription
	
	^ 'Stack is empty'! !


!classDefinition: #ValidStackNode category: #'Stack-Exercise'!
StackNode subclass: #ValidStackNode
	instanceVariableNames: 'value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!ValidStackNode methodsFor: 'private' stamp: 'DS 4/23/2018 23:55:10'!
onRemove

	'do nothing'! !

!ValidStackNode methodsFor: 'private' stamp: 'DS 4/23/2018 23:52:56'!
setValue: anObject

	value _ anObject! !


!ValidStackNode methodsFor: 'testing' stamp: 'DS 4/23/2018 23:39:44'!
isEmpty

	^false! !


!ValidStackNode methodsFor: 'accessing' stamp: 'DS 4/23/2018 23:54:17'!
value

	^value! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'ValidStackNode class' category: #'Stack-Exercise'!
ValidStackNode class
	instanceVariableNames: ''!

!ValidStackNode class methodsFor: 'as yet unclassified' stamp: 'DS 4/23/2018 23:52:33'!
new: anObject

	^super new setValue: anObject! !
