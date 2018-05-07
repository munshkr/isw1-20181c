!classDefinition: #OOStackTest category: #'Stack-Solution-2'!
TestCase subclass: #OOStackTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Solution-2'!

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

!OOStackTest methodsFor: 'test' stamp: 'HernanWilkinson 5/7/2012 11:50'!
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

!OOStackTest methodsFor: 'test' stamp: 'HAW 4/14/2017 22:49:38'!
test08CanNotPopWhenThereAreNoObjectsInTheStack

	| stack  |
	
	stack := OOStack new.
	self
		should: [ stack pop ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = OOStack stackEmptyErrorDescription ]
		
! !

!OOStackTest methodsFor: 'test' stamp: 'HAW 4/14/2017 22:49:45'!
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

!OOStackTest methodsFor: 'test' stamp: 'HAW 4/14/2017 22:49:54'!
test10CanNotTopWhenThereAreNoObjectsInTheStack

	| stack  |
	
	stack := OOStack new.
	self
		should: [ stack top ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = OOStack stackEmptyErrorDescription ]
		
! !


!classDefinition: #OOStack category: #'Stack-Solution-2'!
Object subclass: #OOStack
	instanceVariableNames: 'top'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Solution-2'!

!OOStack methodsFor: 'initialization' stamp: 'HernanWilkinson 5/7/2012 11:43'!
initialize

	top := OOStackBase new! !


!OOStack methodsFor: 'testing' stamp: 'HernanWilkinson 5/7/2012 11:46'!
isEmpty

	^ top isEmpty! !


!OOStack methodsFor: 'push/pop' stamp: 'HernanWilkinson 5/7/2012 11:45'!
pop

	| pushedObject |
	
	pushedObject := self top.
	top := top previous.
	
	^ pushedObject ! !

!OOStack methodsFor: 'push/pop' stamp: 'HernanWilkinson 5/7/2012 11:43'!
push: anObject

	top := OOPushedObject over: top with: anObject! !

!OOStack methodsFor: 'push/pop' stamp: 'HernanWilkinson 5/7/2012 11:46'!
top

	^ top content! !


!OOStack methodsFor: 'size' stamp: 'HernanWilkinson 5/7/2012 11:47'!
size

	^ top deepSize! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'OOStack class' category: #'Stack-Solution-2'!
OOStack class
	instanceVariableNames: ''!

!OOStack class methodsFor: 'error descriptions' stamp: 'HernanWilkinson 5/7/2012 11:51'!
stackEmptyErrorDescription
	
	^ 'Stack is empty'! !


!classDefinition: #OOStackTop category: #'Stack-Solution-2'!
Object subclass: #OOStackTop
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Solution-2'!

!OOStackTop methodsFor: 'content' stamp: 'HernanWilkinson 5/7/2012 11:52'!
content
	self subclassResponsibility! !


!OOStackTop methodsFor: 'size' stamp: 'HernanWilkinson 5/7/2012 11:52'!
deepSize
	self subclassResponsibility! !


!OOStackTop methodsFor: 'testing' stamp: 'HernanWilkinson 5/7/2012 11:52'!
isEmpty
	self subclassResponsibility! !


!classDefinition: #OOPushedObject category: #'Stack-Solution-2'!
OOStackTop subclass: #OOPushedObject
	instanceVariableNames: 'previous content'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Solution-2'!

!OOPushedObject methodsFor: 'content' stamp: 'HernanWilkinson 5/7/2012 11:50'!
content
	
	^ content! !


!OOPushedObject methodsFor: 'size' stamp: 'HernanWilkinson 5/7/2012 11:50'!
deepSize
	
	^ previous deepSize + 1! !


!OOPushedObject methodsFor: 'initialization' stamp: 'HernanWilkinson 5/7/2012 11:49'!
initializeOver: anStackTop with: anObject

	previous := anStackTop.
	content := anObject! !


!OOPushedObject methodsFor: 'testing' stamp: 'HernanWilkinson 5/7/2012 11:49'!
isEmpty
	
	^ false! !


!OOPushedObject methodsFor: 'previous' stamp: 'HernanWilkinson 5/7/2012 11:50'!
previous
	
	^ previous! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'OOPushedObject class' category: #'Stack-Solution-2'!
OOPushedObject class
	instanceVariableNames: ''!

!OOPushedObject class methodsFor: 'instance creation' stamp: 'HernanWilkinson 5/7/2012 11:48'!
over: anStackTop with: anObject

	^ self new initializeOver: anStackTop with: anObject! !


!classDefinition: #OOStackBase category: #'Stack-Solution-2'!
OOStackTop subclass: #OOStackBase
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Solution-2'!

!OOStackBase methodsFor: 'content' stamp: 'HernanWilkinson 5/7/2012 11:52'!
content

	self error: OOStack stackEmptyErrorDescription ! !


!OOStackBase methodsFor: 'size' stamp: 'HernanWilkinson 5/7/2012 11:51'!
deepSize
	
	^ 0! !


!OOStackBase methodsFor: 'testing' stamp: 'HernanWilkinson 5/7/2012 11:47'!
isEmpty
	
	^ true! !
