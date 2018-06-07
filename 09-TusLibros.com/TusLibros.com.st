!classDefinition: #CartTest category: #'TusLibros.com'!
TestCase subclass: #CartTest
	instanceVariableNames: 'cart catalogue firstBook secondBook unknownBook market'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros.com'!

!CartTest methodsFor: 'initializing' stamp: 'DS 6/6/2018 22:56:20'!
setUp

	firstBook _ Book new.
	secondBook _ Book new.
	unknownBook _ Book new.
	
	catalogue _ Catalogue new.
	catalogue add: firstBook.
	catalogue add: secondBook.
	
	market _ Market with: catalogue.

	cart _ Cart for: market.! !


!CartTest methodsFor: 'testing' stamp: 'DS 6/6/2018 20:17:15'!
test01ANewCartIsEmpty
	self assert: cart isEmpty! !

!CartTest methodsFor: 'testing' stamp: 'DS 6/6/2018 20:59:58'!
test02ACartWithBooksIsNotEmpty
	cart add: firstBook.
	self deny: cart isEmpty! !

!CartTest methodsFor: 'testing' stamp: 'DS 6/6/2018 21:00:18'!
test03ACartIncludesBookAfterAddingIt
	cart add: firstBook.
	self assert: (cart includes: firstBook).! !

!CartTest methodsFor: 'testing' stamp: 'DS 6/6/2018 21:00:49'!
test04ACartDoesNotIncludeBookIfItWasNotAdded

	self deny: (cart includes: firstBook)! !

!CartTest methodsFor: 'testing' stamp: 'DS 6/6/2018 21:01:04'!
test05ACartCountsTheAmountOfBooksAdded
	cart add: firstBook.
	cart add: firstBook.
	self assert: (cart quantityOf: firstBook) = 2! !

!CartTest methodsFor: 'testing' stamp: 'DS 6/6/2018 21:01:58'!
test06ACartDoesNotCountBooksThatWereNotAdded
	cart add: firstBook.
	cart
		add: secondBook
		withAmount: 2.
	self assert: (cart quantityOf: firstBook) = 1.
	self assert: (cart quantityOf: unknownBook) = 0.
	self assert: (cart quantityOf: secondBook) = 2.! !

!CartTest methodsFor: 'testing' stamp: 'DS 6/6/2018 21:29:09'!
test07ACartCantHaveAnUnknownBook
	self
		should: [ cart add: unknownBook ] 
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError |
			self assert: Cart bookIsNotInCatalogueErrorMessage equals: anError messageText.
			cart isEmpty ].! !

!CartTest methodsFor: 'testing' stamp: 'DS 6/6/2018 21:32:08'!
test08ACartCanListItsBooks
	| aSet |
	aSet _ Set with: firstBook with: secondBook.
	cart add: secondBook.
	cart add: firstBook withAmount: 3.
	self assert: cart list = aSet! !


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
	instanceVariableNames: 'books market'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros.com'!

!Cart methodsFor: 'inspecting' stamp: 'DS 6/6/2018 20:13:58'!
includes: aBook

	^books includes: aBook! !

!Cart methodsFor: 'inspecting' stamp: 'DS 6/6/2018 20:14:26'!
isEmpty

	^books isEmpty ! !

!Cart methodsFor: 'inspecting' stamp: 'DS 6/6/2018 21:31:16'!
list
	^Set newFrom: books! !

!Cart methodsFor: 'inspecting' stamp: 'DS 6/6/2018 20:33:28'!
quantityOf: aBook 

	^books occurrencesOf: aBook! !


!Cart methodsFor: 'accessing' stamp: 'DS 6/6/2018 20:39:36'!
add: aBook

	self add: aBook withAmount: 1! !

!Cart methodsFor: 'accessing' stamp: 'DS 6/6/2018 22:59:35'!
add: aBook withAmount: anAmount

	(market catalogueIncludes: aBook) ifFalse: [ self error: Cart bookIsNotInCatalogueErrorMessage ].
	books add: aBook withOccurrences: anAmount! !


!Cart methodsFor: 'initializing' stamp: 'DS 6/6/2018 22:58:34'!
initializeWith: aMarket 

	market _ aMarket.
	books _ Bag new.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Cart class' category: #'TusLibros.com'!
Cart class
	instanceVariableNames: ''!

!Cart class methodsFor: 'class initialization' stamp: 'DS 6/6/2018 22:58:11'!
for: aMarket 

	^self new initializeWith: aMarket! !


!Cart class methodsFor: 'error messages' stamp: 'DS 6/6/2018 21:28:20'!
bookIsNotInCatalogueErrorMessage
	^'Book is not in catalogue'! !


!classDefinition: #Catalogue category: #'TusLibros.com'!
Object subclass: #Catalogue
	instanceVariableNames: 'books'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros.com'!

!Catalogue methodsFor: 'accessing' stamp: 'DS 6/6/2018 20:56:18'!
add: aBook 
	books add: aBook! !


!Catalogue methodsFor: 'inspecting' stamp: 'DS 6/6/2018 21:27:55'!
includes: aBook 
	^books includes: aBook! !


!Catalogue methodsFor: 'initializing' stamp: 'DS 6/6/2018 20:57:45'!
initialize

	books _ Set new! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Catalogue class' category: #'TusLibros.com'!
Catalogue class
	instanceVariableNames: ''!

!Catalogue class methodsFor: 'class initialization' stamp: 'DS 6/6/2018 20:56:55'!
new

	^super new initialize! !


!classDefinition: #Market category: #'TusLibros.com'!
Object subclass: #Market
	instanceVariableNames: 'catalogue'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros.com'!

!Market methodsFor: 'initializing' stamp: 'DS 6/6/2018 22:57:11'!
initializeWith: aCatalogue 
	catalogue _ aCatalogue ! !


!Market methodsFor: 'inspecting' stamp: 'DS 6/6/2018 22:59:56'!
catalogueIncludes: aBook 
	^catalogue includes: aBook! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Market class' category: #'TusLibros.com'!
Market class
	instanceVariableNames: ''!

!Market class methodsFor: 'class initialization' stamp: 'DS 6/6/2018 22:56:40'!
with: aCatalogue 
	^self new initializeWith: aCatalogue! !
