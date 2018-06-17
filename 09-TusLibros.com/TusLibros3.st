!classDefinition: #TusLibrosTests category: #'TusLibros-Ejercicio'!
TestCase subclass: #TusLibrosTests
	instanceVariableNames: 'aCart catalogWithElements emptyCatalog cartWithEmptyCatalog cartWithElements cashierWithFewPrices catalogWithFewerElements validCreditCard invalidCreditCard validCards aMerchant cartWithoutElements cashierWithPrices validCreditCard2 aSalesBook emptyCart'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros-Ejercicio'!

!TusLibrosTests methodsFor: 'setup' stamp: 'DS 6/17/2018 15:03:20'!
setUp
	catalogWithElements _ Dictionary new.
	catalogWithElements at: 1 put: 2.
	catalogWithElements at: 2 put: 1.
	catalogWithElements at: 3 put: 3.
	catalogWithFewerElements _ Dictionary new.
	catalogWithFewerElements at: 1 put: 2.
	catalogWithFewerElements at: 3 put: 1.
	emptyCatalog _ Dictionary new.
	
	aCart _ Cart withCatalog: catalogWithElements.
	
	cartWithEmptyCatalog _ Cart withCatalog: emptyCatalog.
	cartWithElements _ Cart withCatalog: catalogWithElements.
	cartWithElements add: 1.
	cartWithElements add: 2.
	emptyCart _ Cart withCatalog: catalogWithElements.
	
	validCreditCard _ CreditCard new withNumber: 123456789 withName: 'pepe' withExpirationMonth: GregorianMonthOfYear current next.
	validCreditCard2 _ CreditCard new withNumber: 123456790 withName: 'juan' withExpirationMonth: GregorianMonthOfYear current next.
	invalidCreditCard _ CreditCard new withNumber: 123456790 withName: 'pepe' withExpirationMonth: GregorianMonthOfYear current next.
	validCards _ Dictionary new.
	validCards at: validCreditCard put: 2000.
	validCards at: validCreditCard2 put: 3.
	
	aMerchant _ MerchantProcessorSim withBankInfo: validCards .
	
	aSalesBook _ OrderedCollection new.
	
	cashierWithFewPrices _ Cashier new initializeWithPriceList: catalogWithFewerElements andMerchant: aMerchant registeringOn: aSalesBook.
	cashierWithPrices _ Cashier new initializeWithPriceList: catalogWithElements andMerchant: aMerchant registeringOn: aSalesBook.! !


!TusLibrosTests methodsFor: 'Cart tests' stamp: 'f.o. 6/14/2018 02:50:26'!
test01ACartIsInitializeEmpty
	self assert: aCart isEmpty.! !

!TusLibrosTests methodsFor: 'Cart tests' stamp: 'f.o. 6/7/2018 02:58:28'!
test02ACartWithElementsIsNotEmpty
	aCart add: 1.
	self deny: aCart isEmpty.! !

!TusLibrosTests methodsFor: 'Cart tests' stamp: 'f.o. 6/7/2018 02:58:39'!
test03ACartKnowsWhenHasOneElement
	aCart add: 1.
	self assert: aCart elements = 1! !

!TusLibrosTests methodsFor: 'Cart tests' stamp: 'f.o. 6/7/2018 02:59:17'!
test04ACartKnowsWhenHasAnyElementQuantity
	aCart add: 1.
	aCart add: 2.
	self assert: aCart elements = 2! !

!TusLibrosTests methodsFor: 'Cart tests' stamp: 'f.o. 6/7/2018 02:59:30'!
test05ACartWithAQuantityOfOneElementCountsGood
	aCart add: 1 quantity: 2.
	aCart add: 2.
	self assert: aCart elements = 3! !

!TusLibrosTests methodsFor: 'Cart tests' stamp: 'DS 6/17/2018 13:30:08'!
test06CanNotAddNonNaturalNumberOfItems
	self
		should: [
			aCart
				add: 1
				quantity: 0 ]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError |
			self assert: anError messageText = 'Debe ingresar un natural mayor o igual a 1'.
			self assert: cartWithEmptyCatalog isEmpty ].! !

!TusLibrosTests methodsFor: 'Cart tests' stamp: 'DS 6/17/2018 13:30:34'!
test07CanNotAddGreaterQuantityThanStockAtOnce
	self
		should: [
			aCart
				add: 1
				quantity: 6 ]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError |
			self assert: anError messageText = 'No hay tantos productos'.
			self assert: cartWithEmptyCatalog isEmpty ].! !

!TusLibrosTests methodsFor: 'Cart tests' stamp: 'f.o. 6/17/2018 10:46:58'!
test08ACartKnowHowManyElementsHasOfEachElement
	aCart add: 1 quantity: 2.
	aCart add: 3 quantity: 3.
	self assert: (aCart occurrencesOf: 1 ) = 2.
	self assert: (aCart occurrencesOf: 3 ) = 3.! !

!TusLibrosTests methodsFor: 'Cart tests' stamp: 'DS 6/17/2018 13:30:41'!
test09ACartCantAddThingsThatAreNotInTheCatalog
	self
		should: [ cartWithEmptyCatalog add: 1 ]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError |
			self assert: anError messageText = 'No pertenece al catalogo'.
			self assert: cartWithEmptyCatalog isEmpty ].! !

!TusLibrosTests methodsFor: 'Cart tests' stamp: 'DS 6/17/2018 13:30:45'!
test10CanNotAddGreaterQuantityThanStock
	self
		should: [aCart add: 1 quantity: 2.
			aCart add: 1 quantity: 7]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError |
			self assert: anError messageText = 'No hay tantos productos'.
			self assert: cartWithEmptyCatalog isEmpty ].! !


!TusLibrosTests methodsFor: 'CreditCard tests' stamp: 'DS 6/17/2018 15:43:11'!
test11CreditCardCantBeCreatedInvalid
	| invalidDate |
	invalidDate _ GregorianMonthOfYear year: GregorianYear current previous month: February.
	self
		should: [
			CreditCard new
				withNumber: 123456789
				withName: 'pepe'
				withExpirationMonth: invalidDate ]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError |
			self assert: anError messageText = 'La tarjeta de crédito está vencida' ].! !


!TusLibrosTests methodsFor: 'Cashier tests' stamp: 'DS 6/17/2018 15:43:28'!
test12CashierCantCheckOutWithOutEveryPrice
	self
		should: [
			cashierWithFewPrices
				checkout: cartWithElements
				on: FixedGregorianDate today
				with: validCreditCard ]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError |
			self assert: anError messageText = 'La lista de precio no incluye todos los elementos del carrito' ]! !

!TusLibrosTests methodsFor: 'Cashier tests' stamp: 'DS 6/17/2018 15:45:21'!
test13CashierCantCheckOutWithOutdatedCreditCard
	self
		should: [
			cashierWithFewPrices
				checkout: cartWithElements
				on: GregorianYear current next firstDate
				with: validCreditCard ]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError |
			self assert: anError messageText = 'La tarjeta de crédito está vencida' ].! !

!TusLibrosTests methodsFor: 'Cashier tests' stamp: 'DS 6/17/2018 13:29:06'!
test14CanNotCheckoutAnEmptyCart
	^self! !

!TusLibrosTests methodsFor: 'Cashier tests' stamp: 'DS 6/17/2018 13:15:42'!
test15CalculatedTotalIsCorrect
	^ self.! !

!TusLibrosTests methodsFor: 'Cashier tests' stamp: 'DS 6/17/2018 13:15:52'!
test16CheckoutRegistersASale
	^ self.! !

!TusLibrosTests methodsFor: 'Cashier tests' stamp: 'DS 6/17/2018 13:16:03'!
test17CashierDoesNotSaleWhenTheCreditCardHasNoCredit
	^ self.! !


!TusLibrosTests methodsFor: 'Merchant tests' stamp: 'DS 6/17/2018 13:17:17'!
test18MerchantRecognicesValidCards
	aMerchant isValid: validCreditCard.
	aMerchant isValid: validCreditCard2.! !

!TusLibrosTests methodsFor: 'Merchant tests' stamp: 'DS 6/17/2018 13:31:13'!
test19MerchantRecognicesInvalidCards
	self
		should: [ aMerchant isValid: invalidCreditCard ]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError |
			self assert: anError messageText = 'La tarjeta de crédito provista es inexistente. Revise los datos ingresados.' ].! !

!TusLibrosTests methodsFor: 'Merchant tests' stamp: 'DS 6/17/2018 15:49:30'!
test20MerchantRecognicesWhenCardDontHaveEnoughMoney
	aCart
		add: 1
		quantity: 2.
		
cashierWithPrices
				checkout: aCart
				on: FixedGregorianDate today
				with: validCreditCard2 .		
		
	self
		should: [
			cashierWithPrices
				checkout: aCart
				on: FixedGregorianDate today
				with: validCreditCard2 ]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError |
			self assert: anError messageText = 'El saldo es insuficiente' ].! !


!classDefinition: #Cart category: #'TusLibros-Ejercicio'!
Object subclass: #Cart
	instanceVariableNames: 'elements catalog'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros-Ejercicio'!

!Cart methodsFor: 'initialization' stamp: 'f.o. 6/7/2018 03:01:14'!
initialize
	elements := Bag new.! !

!Cart methodsFor: 'initialization' stamp: 'f.o. 6/7/2018 03:02:23'!
withCatalog: anOrderedCollection 
	catalog := anOrderedCollection.
	elements := Bag new.
	! !


!Cart methodsFor: 'testing' stamp: 'f.o. 6/17/2018 11:57:17'!
assertIsANaturalNumber: aNumber

	self assert: aNumber isInteger description: [self error: Cart cuantityMustBeNaturalNumber].
	self assert:  aNumber  > 0 description: [self error: Cart cuantityMustBeNaturalNumber].! !

!Cart methodsFor: 'testing' stamp: 'f.o. 6/17/2018 12:01:24'!
assertIsCorrectToAdd: anElement times: aQuantity

	self assert: (catalog includesKey: anElement) description: [self error: Cart doesNotBelongToCatalog].
	
	"No puede superar la cantidad que hay en stock"
	self assert: (((catalog at: anElement) + (elements occurrencesOf: anElement)) >= aQuantity) description: [self error: Cart notSoManyProducts].! !


!Cart methodsFor: 'adding' stamp: 'f.o. 6/7/2018 03:02:59'!
add: anElement
	self add: anElement quantity: 1.
! !

!Cart methodsFor: 'adding' stamp: 'f.o. 6/17/2018 12:01:11'!
add: anElement quantity: aQuantity 
	
	self assertIsANaturalNumber: aQuantity.
	self assertIsCorrectToAdd: anElement times: aQuantity .
	
	elements add: anElement withOccurrences: aQuantity.
	! !


!Cart methodsFor: 'accessing' stamp: 'f.o. 6/7/2018 03:04:35'!
catalog
	^ catalog! !

!Cart methodsFor: 'accessing' stamp: 'f.o. 6/7/2018 03:04:52'!
elements
	^ elements size! !

!Cart methodsFor: 'accessing' stamp: 'f.o. 6/17/2018 10:40:04'!
includes: anElement
	^ elements includes: anElement.! !

!Cart methodsFor: 'accessing' stamp: 'f.o. 6/7/2018 03:05:00'!
isEmpty
	^ elements isEmpty .! !

!Cart methodsFor: 'accessing' stamp: 'f.o. 6/17/2018 10:45:42'!
occurrencesOf: anElement
	^ elements occurrencesOf: anElement.! !

!Cart methodsFor: 'accessing' stamp: 'f.o. 6/7/2018 03:05:10'!
products 
	^ elements! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Cart class' category: #'TusLibros-Ejercicio'!
Cart class
	instanceVariableNames: ''!

!Cart class methodsFor: 'errors' stamp: 'f.o. 6/17/2018 11:51:00'!
cuantityMustBeNaturalNumber
	^ 'Debe ingresar un natural mayor o igual a 1'.! !

!Cart class methodsFor: 'errors' stamp: 'f.o. 6/17/2018 11:52:36'!
doesNotBelongToCatalog
	^ 'No pertenece al catalogo'.! !

!Cart class methodsFor: 'errors' stamp: 'f.o. 6/17/2018 11:53:29'!
notSoManyProducts
	^ 'No hay tantos productos'.! !


!Cart class methodsFor: 'class initialization' stamp: 'f.o. 6/7/2018 03:01:55'!
withCatalog: anOrderedCollection 
	^ self new withCatalog: anOrderedCollection! !


!classDefinition: #Cashier category: #'TusLibros-Ejercicio'!
Object subclass: #Cashier
	instanceVariableNames: 'priceList merchant salesBook'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros-Ejercicio'!

!Cashier methodsFor: 'initialization' stamp: 'f.o. 6/17/2018 11:32:15'!
initializeWithPriceList: aPriceList andMerchant: aMerchantProcessor registeringOn: aSalesBook

	priceList := aPriceList .
	merchant := aMerchantProcessor.
	salesBook := aSalesBook.! !


!Cashier methodsFor: 'checkout' stamp: 'DS 6/17/2018 15:50:53'!
checkout: aCart on: aDate with: aCreditCard

	| cost |
	
	self assertCreditCardIsNotExpired: aCreditCard onDate: aDate .
	self assertHasPricesForEveryBookIn: aCart.
	
	self assert: (aCart isEmpty not)
		description: [ self error: 'El carrito no puede estar vacio' ].
	
	cost _ (aCart products collect: [:product | priceList at: product]) sum.
	
	merchant checkout: aCreditCard withAmount: cost.
	salesBook add: (Sale ofValue: cost from: aCreditCard owner).! !


!Cashier methodsFor: 'testing' stamp: 'f.o. 6/17/2018 12:30:42'!
assertCreditCardIsNotExpired: aCreditCard onDate: aDate

	self assert: (aCreditCard isExpiredOn: aDate) not description: [ self error: CreditCard expiredError ].! !

!Cashier methodsFor: 'testing' stamp: 'f.o. 6/17/2018 12:31:10'!
assertHasPricesForEveryBookIn: aCart

	self assert: (self hasPricesForEveryBookIn: aCart) description: [self error: Cashier priceListError].! !

!Cashier methodsFor: 'testing' stamp: 'DS 6/11/2018 15:06:32'!
hasPricesForEveryBookIn: aCart

	^(aCart products) allSatisfy: [:product | priceList includesKey: product]! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Cashier class' category: #'TusLibros-Ejercicio'!
Cashier class
	instanceVariableNames: 'priceList'!

!Cashier class methodsFor: 'error messages' stamp: 'f.o. 6/10/2018 18:45:17'!
priceListError

	^'La lista de precio no incluye todos los elementos del carrito'.! !


!Cashier class methodsFor: 'class initialization' stamp: 'f.o. 6/14/2018 01:31:56'!
withPriceList: aPriceList andMerchant: aMerchantProcessor

	^ self new initializeWithPriceList: aPriceList andMerchant: aMerchantProcessor .! !


!classDefinition: #CreditCard category: #'TusLibros-Ejercicio'!
Object subclass: #CreditCard
	instanceVariableNames: 'cardNumber cardHolder expirationMonth'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros-Ejercicio'!

!CreditCard methodsFor: 'testing' stamp: 'DS 6/17/2018 15:40:36'!
isExpiredOn: aDate 
	
	^expirationMonth firstDate < aDate! !


!CreditCard methodsFor: 'initialization' stamp: 'DS 6/17/2018 15:36:10'!
withNumber: acardNumber withName: acardHolder withExpirationMonth: amonthOfYear

	cardNumber _ acardNumber.
	cardHolder _ acardHolder.
	expirationMonth _ amonthOfYear.
	self assert: (self isExpiredOn: FixedGregorianDate today) not description: [ self error: CreditCard expiredError ].! !


!CreditCard methodsFor: 'accessing' stamp: 'f.o. 6/14/2018 01:59:21'!
cardExpiringDate

	^expirationMonth.! !

!CreditCard methodsFor: 'accessing' stamp: 'f.o. 6/14/2018 01:58:53'!
cardNumber

	^cardNumber.! !

!CreditCard methodsFor: 'accessing' stamp: 'f.o. 6/14/2018 01:58:37'!
cardOwner

	^cardHolder.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CreditCard class' category: #'TusLibros-Ejercicio'!
CreditCard class
	instanceVariableNames: ''!

!CreditCard class methodsFor: 'error messages' stamp: 'f.o. 6/10/2018 18:42:07'!
expiredError

	^'La tarjeta de crédito está vencida'.! !


!classDefinition: #MerchantProcessorSim category: #'TusLibros-Ejercicio'!
Object subclass: #MerchantProcessorSim
	instanceVariableNames: 'validCreditCards'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros-Ejercicio'!

!MerchantProcessorSim methodsFor: 'initialization' stamp: 'f.o. 6/14/2018 01:34:19'!
initializeWithBankInfo: accountsInfo
	
	validCreditCards _ accountsInfo.! !


!MerchantProcessorSim methodsFor: 'checkout' stamp: 'DS 6/17/2018 15:51:21'!
checkout: creditCard withAmount: anAmount

	self isValid: creditCard .
	self assert: ((validCreditCards at: creditCard) <= anAmount) description: [self error: MerchantProcessorSim insufficientCredit].
	
	validCreditCards at: creditCard put: ((validCreditCards at: creditCard) - anAmount).! !


!MerchantProcessorSim methodsFor: 'testing' stamp: 'f.o. 6/14/2018 02:51:42'!
isValid: aCreditCard

	self assert: (validCreditCards includesKey: aCreditCard) description: [self error: MerchantProcessorSim invalidCreditCard].! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MerchantProcessorSim class' category: #'TusLibros-Ejercicio'!
MerchantProcessorSim class
	instanceVariableNames: ''!

!MerchantProcessorSim class methodsFor: 'initialization' stamp: 'f.o. 6/14/2018 01:35:35'!
withBankInfo: accountsInfo
	
	^MerchantProcessorSim new initializeWithBankInfo: accountsInfo.! !


!MerchantProcessorSim class methodsFor: 'errors' stamp: 'f.o. 6/14/2018 02:49:05'!
insufficientCredit

	^'El saldo es insuficiente'.! !

!MerchantProcessorSim class methodsFor: 'errors' stamp: 'f.o. 6/14/2018 02:48:55'!
invalidCreditCard

	^'La tarjeta de crédito provista es inexistente. Revise los datos ingresados.'.! !


!classDefinition: #Sale category: #'TusLibros-Ejercicio'!
Object subclass: #Sale
	instanceVariableNames: 'value owner'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros-Ejercicio'!

!Sale methodsFor: 'as yet unclassified' stamp: 'f.o. 6/17/2018 11:45:40'!
registerWithValue: aValue from: aName

	value := aValue.
	owner := aName.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Sale class' category: #'TusLibros-Ejercicio'!
Sale class
	instanceVariableNames: ''!

!Sale class methodsFor: 'as yet unclassified' stamp: 'f.o. 6/17/2018 11:44:51'!
ofValue: aValue from: aName
	^Sale new registerWithValue: aValue from: aName.! !
