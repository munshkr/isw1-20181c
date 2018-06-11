!classDefinition: #CartTest category: #'TusLibros.com'!
TestCase subclass: #CartTest
	instanceVariableNames: 'cart catalogue firstBook secondBook unknownBook market'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros.com'!

!CartTest methodsFor: 'initializing' stamp: 'DS 6/7/2018 09:36:01'!
setUp

	firstBook _ Book new.
	secondBook _ Book new.
	unknownBook _ Book new.
	
	catalogue _ Catalogue new.
	catalogue add: firstBook withAmount: 1.
	catalogue add: secondBook withAmount: 2.
	
	cart _ Cart withCatalogue: catalogue! !


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

!CartTest methodsFor: 'testing' stamp: 'DS 6/7/2018 09:42:47'!
test08ACartCanListItsBooks
	| aSet |
	aSet _ Set with: firstBook with: secondBook.
	cart add: secondBook withAmount: 2.
	cart add: firstBook withAmount: 1.
	self assert: cart list = aSet! !

!CartTest methodsFor: 'testing' stamp: 'DS 6/7/2018 09:46:45'!
test09ACartCantAddBookWithAmountZero
	self
		should: [
			cart
				add: firstBook
				withAmount: 0 ]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError |
			self
				assert: Cart cannotAddBookWithNonPositiveAmount
				equals: anError messageText.
			cart isEmpty ].! !

!CartTest methodsFor: 'testing' stamp: 'DS 6/7/2018 09:43:06'!
test10ACartCannotAddMoreBooksThanPresentInCatalogue
	self
		should: [ cart add: firstBook withAmount: 2 ] 
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError |
			self assert: Cart cannotAddMoreBooksThanInCatalogue equals: anError messageText.
			cart isEmpty ].! !


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
	instanceVariableNames: 'books catalogue'
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

!Cart methodsFor: 'accessing' stamp: 'DS 6/7/2018 09:47:21'!
add: aBook withAmount: anAmount

	(catalogue includes: aBook) ifFalse: [ self error: Cart bookIsNotInCatalogueErrorMessage ].
	(anAmount <= 0) ifTrue: [self error: Cart cannotAddBookWithNonPositiveAmount ].
	(anAmount > (catalogue quantityOf: aBook)) ifTrue: [ self error: Cart cannotAddMoreBooksThanInCatalogue ].
	
	books add: aBook withOccurrences: anAmount! !


!Cart methodsFor: 'initializing' stamp: 'DS 6/7/2018 09:34:57'!
initializeWithCatalogue: aCatalogue

	catalogue _ aCatalogue.
	books _ Bag new.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Cart class' category: #'TusLibros.com'!
Cart class
	instanceVariableNames: ''!

!Cart class methodsFor: 'class initialization' stamp: 'DS 6/6/2018 22:58:11'!
for: aMarket 

	^self new initializeWith: aMarket! !

!Cart class methodsFor: 'class initialization' stamp: 'DS 6/7/2018 09:34:38'!
withCatalogue: aCatalogue

	^self new initializeWithCatalogue: aCatalogue! !


!Cart class methodsFor: 'error messages' stamp: 'DS 6/6/2018 21:28:20'!
bookIsNotInCatalogueErrorMessage
	^'Book is not in catalogue'! !

!Cart class methodsFor: 'error messages' stamp: 'DS 6/7/2018 09:46:59'!
cannotAddBookWithNonPositiveAmount
	^ 'cannot add book with non positive amount'.! !

!Cart class methodsFor: 'error messages' stamp: 'DS 6/7/2018 09:42:10'!
cannotAddMoreBooksThanInCatalogue
	^'cannot add more books than in catalogue'! !


!classDefinition: #Catalogue category: #'TusLibros.com'!
Object subclass: #Catalogue
	instanceVariableNames: 'books'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros.com'!

!Catalogue methodsFor: 'accessing' stamp: 'DS 6/7/2018 09:33:43'!
add: aBook 
	books add: aBook withAmount: 1! !

!Catalogue methodsFor: 'accessing' stamp: 'DS 6/7/2018 09:34:09'!
add: aBook withAmount: anAmount
	books add: aBook withOccurrences: anAmount! !


!Catalogue methodsFor: 'inspecting' stamp: 'DS 6/6/2018 21:27:55'!
includes: aBook 
	^books includes: aBook! !

!Catalogue methodsFor: 'inspecting' stamp: 'DS 6/7/2018 09:41:50'!
quantityOf: aBook 
	^books occurrencesOf: aBook! !


!Catalogue methodsFor: 'initializing' stamp: 'DS 6/7/2018 09:33:02'!
initialize

	books _ Bag new! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Catalogue class' category: #'TusLibros.com'!
Catalogue class
	instanceVariableNames: ''!

!Catalogue class methodsFor: 'class initialization' stamp: 'DS 6/6/2018 20:56:55'!
new

	^super new initialize! !
