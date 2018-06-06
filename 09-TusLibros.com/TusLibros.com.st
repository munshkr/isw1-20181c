!classDefinition: #CartTest category: #'TusLibros.com'!
TestCase subclass: #CartTest
	instanceVariableNames: 'cart'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros.com'!

!CartTest methodsFor: 'initializing' stamp: 'DS 6/6/2018 19:57:56'!
setUp

	cart _ Cart new.! !


!CartTest methodsFor: 'testing' stamp: 'DS 6/6/2018 20:17:15'!
test01ANewCartIsEmpty
	self assert: cart isEmpty! !

!CartTest methodsFor: 'testing' stamp: 'DS 6/6/2018 20:17:12'!
test02ACartWithBooksIsNotEmpty
	| aBook | 
	aBook _ Book named: 'Ficciones'.
	cart add: aBook.
	self deny: cart isEmpty! !

!CartTest methodsFor: 'testing' stamp: 'DS 6/6/2018 20:12:26'!
test03ACartIncludesBookAfterAddingIt
	| aBook |
	aBook _ Book named: 'Ficciones'.
	cart add: aBook.
	self assert: (cart includes: aBook).! !

!CartTest methodsFor: 'testing' stamp: 'DS 6/6/2018 20:17:06'!
test04ACartDoesNotIncludeBookIfItWasNotAdded
	| aBook |
	aBook _ Book named: 'Ficciones'.
	self deny: (cart includes: aBook)! !

!CartTest methodsFor: 'testing' stamp: 'DS 6/6/2018 20:30:08'!
test05ACartCountsTheAmountOfBooksAdded
	| aBook |
	aBook _ Book named: 'Ficciones'.
	cart add: aBook.
	cart add: aBook.
	self assert: (cart quantityOf: aBook) = 2! !

!CartTest methodsFor: 'testing' stamp: 'DS 6/6/2018 20:39:02'!
test06ACartDoesNotCountBooksThatWereNotAdded
	| ficciones juguete rayuela |
	ficciones _ Book named: 'Ficciones'.
	juguete _ Book named: 'El Juguete Rabioso'.
	rayuela _ Book named: 'Rayuela'.
	cart add: ficciones.
	cart
		add: rayuela
		withAmount: 2.
	self assert: (cart quantityOf: ficciones) = 1.
	self assert: (cart quantityOf: juguete) = 0.
	self assert: (cart quantityOf: rayuela) = 2.! !


!classDefinition: #Book category: #'TusLibros.com'!
Object subclass: #Book
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros.com'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Book class' category: #'TusLibros.com'!
Book class
	instanceVariableNames: ''!

!Book class methodsFor: 'class initialization' stamp: 'DS 6/6/2018 20:10:14'!
named: aString 

	^self new! !


!classDefinition: #Cart category: #'TusLibros.com'!
Object subclass: #Cart
	instanceVariableNames: 'books'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros.com'!

!Cart methodsFor: 'inspecting' stamp: 'DS 6/6/2018 20:13:58'!
includes: aBook

	^books includes: aBook! !

!Cart methodsFor: 'inspecting' stamp: 'DS 6/6/2018 20:14:26'!
isEmpty

	^books isEmpty ! !

!Cart methodsFor: 'inspecting' stamp: 'DS 6/6/2018 20:33:28'!
quantityOf: aBook 

	^books occurrencesOf: aBook! !


!Cart methodsFor: 'accessing' stamp: 'DS 6/6/2018 20:39:36'!
add: aBook

	self add: aBook withAmount: 1! !

!Cart methodsFor: 'accessing' stamp: 'DS 6/6/2018 20:38:32'!
add: aBook withAmount: anAmount

	books add: aBook withOccurrences: anAmount! !

!Cart methodsFor: 'accessing' stamp: 'DS 6/6/2018 20:33:00'!
initialize

	books _ Bag new.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Cart class' category: #'TusLibros.com'!
Cart class
	instanceVariableNames: ''!

!Cart class methodsFor: 'class initialization' stamp: 'DS 6/6/2018 20:03:59'!
new

	^super new initialize! !
