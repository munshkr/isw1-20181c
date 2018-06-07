!classDefinition: #TusLibrosTests category: #'TusLibros-Ejercicio'!
TestCase subclass: #TusLibrosTests
	instanceVariableNames: 'aCart catalogWithElements emptyCatalog cartWithEmptyCatalog cartWithElements'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros-Ejercicio'!

!TusLibrosTests methodsFor: 'Cart' stamp: 'f.o. 6/7/2018 03:29:51'!
setUp
	catalogWithElements _ Dictionary new.
	catalogWithElements at: 1 put: 2.
	catalogWithElements at: 2 put: 1.
	emptyCatalog _ Dictionary new.
	aCart _ Cart withCatalog: catalogWithElements.
	cartWithEmptyCatalog _ Cart withCatalog: emptyCatalog.
	cartWithElements _ Cart withCatalog: catalogWithElements.
	cartWithElements add: 1.
	cartWithElements add: 2.! !

!TusLibrosTests methodsFor: 'Cart' stamp: 'f.o. 6/6/2018 21:39:42'!
test01ACartIsInitializeEmpty
	self assert: aCart isEmpty.! !

!TusLibrosTests methodsFor: 'Cart' stamp: 'f.o. 6/7/2018 02:58:28'!
test02ACartWithElementsIsNotEmpty
	aCart add: 1.
	self deny: aCart isEmpty.! !

!TusLibrosTests methodsFor: 'Cart' stamp: 'f.o. 6/7/2018 02:58:39'!
test03ACartKnowsWhenHasOneElement
	aCart add: 1.
	self assert: aCart elements = 1! !

!TusLibrosTests methodsFor: 'Cart' stamp: 'f.o. 6/7/2018 02:59:17'!
test04ACartKnowsWhenHasAnyElementQuantity
	aCart add: 1.
	aCart add: 2.
	self assert: aCart elements = 2! !

!TusLibrosTests methodsFor: 'Cart' stamp: 'f.o. 6/7/2018 02:59:30'!
test05ACartWithAQuantityOfOneElementCountsGood
	aCart add: 1 quantity: 2.
	aCart add: 2.
	self assert: aCart elements = 3! !

!TusLibrosTests methodsFor: 'Cart' stamp: 'f.o. 6/7/2018 02:59:45'!
test06ACartKnowWhenHasOneContent
	aCart add: 1 quantity: 2.
	self assert: (aCart contents: 1)! !

!TusLibrosTests methodsFor: 'Cart' stamp: 'f.o. 6/7/2018 02:59:55'!
test07ACartKnowHowManyContentsHas
	aCart add: 1 quantity: 2.
	self deny: (aCart contents: 2)! !

!TusLibrosTests methodsFor: 'Cart' stamp: 'f.o. 6/7/2018 03:00:06'!
test08ACartKnowWhenAContentGotTwoElements
	aCart add: 1 quantity: 2.
	self assert: (aCart quantityOf: 1 ) = 2! !

!TusLibrosTests methodsFor: 'Cart' stamp: 'f.o. 6/7/2018 03:00:20'!
test09ACartKnowHowManyElementsGotFromAContent

	aCart add: 1 quantity: 1.
	self assert: (aCart quantityOf: 1 ) = 1! !

!TusLibrosTests methodsFor: 'Cart' stamp: 'f.o. 6/7/2018 03:00:32'!
test10ACartCantAddThingsThatAreNotInTheCatalog

	self should: [cartWithEmptyCatalog add: 1] 
		raise: Error 
		withExceptionDo: [:anError |
								anError messageText = 'No pertenece al catalogo'.
								self assert: cartWithEmptyCatalog isEmpty .
							 ].! !

!TusLibrosTests methodsFor: 'Cart' stamp: 'f.o. 6/7/2018 03:28:40'!
test11CanNotAddNonNaturalNumberOfItems

	self should: [aCart add: 1 quantity: 0] 
		raise: Error 
		withExceptionDo: [:anError |
								anError messageText = 'Debe ingresar un natural mayor o igual a 1'.
								self assert: cartWithEmptyCatalog isEmpty .
							 ].! !

!TusLibrosTests methodsFor: 'Cart' stamp: 'f.o. 6/7/2018 03:29:24'!
test12CanNotAddGreaterQuantityThanStock

	self should: [aCart add: 1 quantity: 6] 
		raise: Error 
		withExceptionDo: [:anError |
								anError messageText = 'Debe ingresar un natural mayor o igual a 1'.
								self assert: cartWithEmptyCatalog isEmpty .
							 ].! !


!classDefinition: #Cart category: #'TusLibros-Ejercicio'!
Object subclass: #Cart
	instanceVariableNames: 'elements catalog'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros-Ejercicio'!

!Cart methodsFor: 'Initialization' stamp: 'f.o. 6/7/2018 03:01:14'!
initialize
	elements := Bag new.! !

!Cart methodsFor: 'Initialization' stamp: 'f.o. 6/7/2018 03:02:23'!
withCatalog: anOrderedCollection 
	catalog := anOrderedCollection.
	elements := Bag new.
	! !


!Cart methodsFor: 'adding' stamp: 'f.o. 6/7/2018 03:02:59'!
add: anElement
	self add: anElement quantity: 1.
! !

!Cart methodsFor: 'adding' stamp: 'f.o. 6/7/2018 03:23:34'!
add: anElement quantity: aQuantity 
	self assert: aQuantity isInteger description: [self error: 'Debe ingresar un natural mayor o igual a 1'].
	self assert:  aQuantity  > 0 description: [self error: 'Debe ingresar un natural mayor o igual a 1'].
	
	self assert: (catalog includesKey: anElement) description: [self error: 'No pertenece al catalogo'].
	self assert: ((catalog at: anElement) >= aQuantity) description: [self error: 'No pertenece al catalogo'].
	
	elements add: anElement withOccurrences: aQuantity.
	
	
	
	"No puede superar la cantidad que hay en stock"! !


!Cart methodsFor: 'accessing' stamp: 'f.o. 6/7/2018 03:04:35'!
catalog
	^ catalog! !

!Cart methodsFor: 'accessing' stamp: 'f.o. 6/7/2018 03:04:44'!
contents: anElement
		^ elements includes: anElement .! !

!Cart methodsFor: 'accessing' stamp: 'f.o. 6/7/2018 03:04:52'!
elements
	^ elements size! !

!Cart methodsFor: 'accessing' stamp: 'f.o. 6/7/2018 03:05:00'!
isEmpty
	^ elements isEmpty .! !

!Cart methodsFor: 'accessing' stamp: 'f.o. 6/7/2018 03:05:10'!
products 
	^ elements! !

!Cart methodsFor: 'accessing' stamp: 'f.o. 6/7/2018 03:05:17'!
quantityOf: anElement
	^ elements occurrencesOf: anElement
	! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Cart class' category: #'TusLibros-Ejercicio'!
Cart class
	instanceVariableNames: ''!

!Cart class methodsFor: 'errors' stamp: 'f.o. 6/7/2018 03:15:58'!
CuantityMustBeNaturalNumber
^'Debe ingresar un natural mayor o igual a 1'! !


!Cart class methodsFor: 'as yet unclassified' stamp: 'f.o. 6/7/2018 03:01:55'!
withCatalog: anOrderedCollection 
	^ self new withCatalog: anOrderedCollection! !
