!classDefinition: #MerchantProcessorSim category: #'TusLibros-Ejercicio'!
TestCase subclass: #MerchantProcessorSim
	instanceVariableNames: 'validCreditCards'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros-Ejercicio'!

!MerchantProcessorSim methodsFor: 'initialization' stamp: 'f.o. 6/14/2018 01:34:19'!
initializeWithBankInfo: accountsInfo
	
	validCreditCards _ accountsInfo.! !


!MerchantProcessorSim methodsFor: 'checkout' stamp: 'f.o. 6/14/2018 02:28:34'!
balanceOfCard: aCard
	
	^ validCreditCards at: aCard .
	
	"no creo q esto lo deba responder un merchant, aunq nos serviria para los tests"! !

!MerchantProcessorSim methodsFor: 'checkout' stamp: 'f.o. 6/14/2018 02:47:00'!
checkout: creditCard withAmount: anAmount

	self isValid: creditCard .
	self assert: (validCreditCards at: creditCard <= anAmount) description: [self error: MerchantProcessorSim insufficientCredit].
	
	validCreditCards at: creditCard put: (validCreditCards at: creditCard  - anAmount).! !


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


!classDefinition: #TusLibrosTests category: #'TusLibros-Ejercicio'!
TestCase subclass: #TusLibrosTests
	instanceVariableNames: 'aCart catalogWithElements emptyCatalog cartWithEmptyCatalog cartWithElements cashierWithFewPrices catalogWithFewerElements validCreditCard invalidCreditCard validCards aMerchant cartWithoutElements cashierWithPrices validCreditCard2'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros-Ejercicio'!

!TusLibrosTests methodsFor: 'setup' stamp: 'f.o. 6/14/2018 02:56:12'!
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
	
	validCreditCard _ CreditCard new withNumber: 123456789 withName: 'pepe' withExpirationMonth: Month current next.
	validCreditCard2 _ CreditCard new withNumber: 123456790 withName: 'juan' withExpirationMonth: Month current next.
	invalidCreditCard _ CreditCard new withNumber: 123456790 withName: 'pepe' withExpirationMonth: Month current next.
	validCards _ Dictionary new.
	validCards at: validCreditCard put: 2000.
	validCards at: validCreditCard2 put: 3.
	
	aMerchant _ MerchantProcessorSim withBankInfo: validCards .
	
	cashierWithFewPrices _ Cashier new initializeWithPriceList: catalogWithFewerElements andMerchant: aMerchant.
	cashierWithPrices _ Cashier new initializeWithPriceList: catalogWithElements andMerchant: aMerchant.! !


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

!TusLibrosTests methodsFor: 'Cart tests' stamp: 'f.o. 6/7/2018 18:16:08'!
test06CanNotAddNonNaturalNumberOfItems
	self
		should: [
			aCart
				add: 1
				quantity: 0 ]
		raise: Error
		withExceptionDo: [ :anError |
			anError messageText = 'La cantidad debe ingresar un natural mayor o igual a 1'.
			self assert: cartWithEmptyCatalog isEmpty ].! !

!TusLibrosTests methodsFor: 'Cart tests' stamp: 'f.o. 6/14/2018 01:21:07'!
test07CanNotAddGreaterQuantityThanStockAtOnce
	self
		should: [
			aCart
				add: 1
				quantity: 6 ]
		raise: Error
		withExceptionDo: [ :anError |
			anError messageText = 'No hay tantos productos'.
			self assert: cartWithEmptyCatalog isEmpty ].! !

!TusLibrosTests methodsFor: 'Cart tests' stamp: 'f.o. 6/7/2018 18:14:05'!
test08ACartKnowHowManyElementsHasOfEachElement
	aCart add: 1 quantity: 2.
	aCart add: 3 quantity: 3.
	self assert: (aCart quantityOf: 1 ) = 2.
	self assert: (aCart quantityOf: 3 ) = 3.! !

!TusLibrosTests methodsFor: 'Cart tests' stamp: 'f.o. 6/7/2018 18:17:00'!
test09ACartCantAddThingsThatAreNotInTheCatalog
	self
		should: [ cartWithEmptyCatalog add: 1 ]
		raise: Error
		withExceptionDo: [ :anError |
			anError messageText = 'No pertenece al catalogo'.
			self assert: cartWithEmptyCatalog isEmpty ].! !

!TusLibrosTests methodsFor: 'Cart tests' stamp: 'f.o. 6/14/2018 01:22:02'!
test10CanNotAddGreaterQuantityThanStock
	self
		should: [aCart add: 1 quantity: 2.
			aCart add: 1 quantity: 7]
		raise: Error
		withExceptionDo: [ :anError |
			anError messageText = 'No hay tantos productos'.
			self assert: cartWithEmptyCatalog isEmpty ].! !


!TusLibrosTests methodsFor: 'CreditCard tests' stamp: 'DS 6/11/2018 14:59:41'!
test10CreditCardCantBeCreatedInvalid
	| invalidDate |
	invalidDate _ GregorianMonthOfYear new
		initializeYear: Year current previous
		month: February.
	self
		should: [
			CreditCard new
				withNumber: 123456789
				withName: 'pepe'
				withExpirationMonth: invalidDate ]
		raise: Error
		withExceptionDo: [ :anError |
			anError messageText = 'La tarjeta de crédito está vencida' ].! !


!TusLibrosTests methodsFor: 'Cashier tests' stamp: 'f.o. 6/14/2018 02:11:03'!
test11CashierCantCheckOutWithOutEveryPrice

	self
		should: [
			cashierWithFewPrices
				checkout: cartWithElements
				on: Date today
				with: validCreditCard ]
		raise: Error
		withExceptionDo: [ :anError |
			anError messageText = 'La lista de precio no incluye todos los elementos del carrito' ].
! !

!TusLibrosTests methodsFor: 'Cashier tests' stamp: 'DS 6/11/2018 15:00:13'!
test12CashierCantCheckOutWithOutdatedCreditCard
	self
		should: [
			cashierWithFewPrices
				checkout: cartWithElements
				on: Date today year next
				with: validCreditCard ]
		raise: Error
		withExceptionDo: [ :anError |
			anError messageText = 'La tarjeta de crédito está vencida' ].! !


!TusLibrosTests methodsFor: 'Merchant tests' stamp: 'f.o. 6/14/2018 02:50:58'!
test01MerchantRecognicesValidCards

	aMerchant isValid: validCreditCard.
	aMerchant isValid: validCreditCard2.! !

!TusLibrosTests methodsFor: 'Merchant tests' stamp: 'f.o. 6/14/2018 02:51:09'!
test02MerchantRecognicesInvalidCards

	self should: [aMerchant isValid: invalidCreditCard]
		raise: Error
		withExceptionDo: [ :anError |
			anError messageText = 'La tarjeta de crédito provista es inexistente. Revise los datos ingresados.'].! !

!TusLibrosTests methodsFor: 'Merchant tests' stamp: 'f.o. 6/14/2018 02:58:23'!
test03MerchantRecognicesWhenCardDontHaveEnoughMoney

	aCart add: 1 quantity: 2.
	self should: [cashierWithPrices checkout: aCart on: Date today with: validCreditCard2]
		raise: Error
		withExceptionDo: [ :anError |
			anError messageText = 'El saldo es insuficiente'].
		! !


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


!Cart methodsFor: 'adding' stamp: 'f.o. 6/7/2018 03:02:59'!
add: anElement
	self add: anElement quantity: 1.
! !

!Cart methodsFor: 'adding' stamp: 'f.o. 6/14/2018 01:24:45'!
add: anElement quantity: aQuantity 
	self assert: aQuantity isInteger description: [self error: 'La cantidad debe ingresar un natural mayor o igual a 1'].
	self assert:  aQuantity  > 0 description: [self error: 'La cantidad debe ingresar un natural mayor o igual a 1'].
	
	self assert: (catalog includesKey: anElement) description: [self error: 'No pertenece al catalogo'].
	self assert: (((catalog at: anElement) + (elements occurrencesOf: anElement)) >= aQuantity) description: [self error: 'No hay tantos productos'].
	
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


!Cart class methodsFor: 'class initialization' stamp: 'f.o. 6/7/2018 03:01:55'!
withCatalog: anOrderedCollection 
	^ self new withCatalog: anOrderedCollection! !


!classDefinition: #Cashier category: #'TusLibros-Ejercicio'!
Object subclass: #Cashier
	instanceVariableNames: 'priceList merchant'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros-Ejercicio'!

!Cashier methodsFor: 'initialization' stamp: 'f.o. 6/14/2018 01:30:06'!
initializeWithPriceList: aPriceList andMerchant: aMerchantProcessor

	priceList := aPriceList .
	merchant := aMerchantProcessor.! !


!Cashier methodsFor: 'checkout' stamp: 'f.o. 6/14/2018 02:10:46'!
checkout: aCart on: aDate with: aCreditCard

	| cost |
	
	self assert: (aCreditCard isExpiredOn: aDate) not description: [ self error: CreditCard expiredError ].
	self assert: (self hasPricesForEveryBookIn: aCart) description: [self error: Cashier priceListError].
	
	cost _ (aCart products) inject: 0 into: [:product | priceList at: product]. "puede q haya un error en esta linea"
	
	"cobrar el carrito. "
	
	merchant checkout: aCreditCard withAmount: cost.! !


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

!CreditCard methodsFor: 'testing' stamp: 'f.o. 6/10/2018 17:16:29'!
isExpiredOn: aDate 
	
	^expirationMonth start < (Month month: aDate monthIndex year: aDate yearNumber) start ! !


!CreditCard methodsFor: 'initialization' stamp: 'f.o. 6/10/2018 18:54:18'!
withNumber: acardNumber withName: acardHolder withExpirationMonth: amonthOfYear

	cardNumber _ acardNumber.
	cardHolder _ acardHolder.
	expirationMonth _ amonthOfYear.
	self assert: (self isExpiredOn: Date today) not description: [ self error: CreditCard expiredError ].! !


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
