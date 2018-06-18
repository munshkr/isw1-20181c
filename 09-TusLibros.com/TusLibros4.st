!classDefinition: #TusLibrosTests category: #'TusLibros-Ejercicio'!
TestCase subclass: #TusLibrosTests
	instanceVariableNames: 'aCart catalogWithElements emptyCatalog cartWithEmptyCatalog cartWithElements cashierWithFewPrices catalogWithFewerElements validCreditCard invalidCreditCard validCards aMerchant cartWithoutElements cashierWithPrices validCreditCard2 aSalesBook emptyCart cartWithMoreElements aBook dataLogin merchantRest rest'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros-Ejercicio'!

!TusLibrosTests methodsFor: 'setup' stamp: 'f.o. 6/18/2018 16:10:12'!
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
	cartWithMoreElements _ Cart withCatalog: catalogWithElements.
	cartWithMoreElements add: 1.
	cartWithMoreElements add: 2.
	cartWithMoreElements add: 3.
	
	validCreditCard _ CreditCard new withNumber: 123456789 withName: 'pepe' withExpirationMonth: GregorianMonthOfYear current next.
	validCreditCard2 _ CreditCard new withNumber: 123456790 withName: 'juan' withExpirationMonth: GregorianMonthOfYear current next.
	invalidCreditCard _ CreditCard new withNumber: 123456790 withName: 'pepe' withExpirationMonth: GregorianMonthOfYear current next.
	validCards _ Dictionary new.
	validCards at: validCreditCard put: 2000.
	validCards at: validCreditCard2 put: 3.
	
	aMerchant _ MerchantProcessorSim withBankInfo: validCards .
	
	aSalesBook _ OrderedCollection new.
	
	cashierWithFewPrices _ Cashier new initializeWithPriceList: catalogWithFewerElements andMerchant: aMerchant registeringOn: aSalesBook.
	cashierWithPrices _ Cashier new initializeWithPriceList: catalogWithElements andMerchant: aMerchant registeringOn: aSalesBook.
	
	aBook _ OrderedCollection new.
	dataLogin _ Dictionary new.
	dataLogin
		at: 1
		put: 1.
	dataLogin
		at: 2
		put: 2.
	merchantRest _ MerchantProcessorSim withBankInfo: validCards .
	rest _ Rest
		withCatalog: catalogWithElements
		withDataLogin: dataLogin
		withTime: DateAndTime now
		withMerchant: merchantRest
		withBook: aBook.! !


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

!TusLibrosTests methodsFor: 'Cashier tests' stamp: 'DS 6/17/2018 16:38:54'!
test14CashierCanNotCheckoutAnEmptyCart
	self
		should: [
			cashierWithPrices
				checkout: emptyCart
				on: FixedGregorianDate today
				with: validCreditCard ]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError |
			self assert: anError messageText = 'El carrito no puede estar vacio' ].! !

!TusLibrosTests methodsFor: 'Cashier tests' stamp: 'DS 6/17/2018 16:38:42'!
test15CashierCalculatesTotalsOnCheckout
	| total |
	total _ cashierWithPrices
		checkout: cartWithElements
		on: FixedGregorianDate today
		with: validCreditCard.
	self assert: total = (2 + 1).! !

!TusLibrosTests methodsFor: 'Cashier tests' stamp: 'DS 6/17/2018 16:47:41'!
test16CashierRegistersASaleOnCheckout
	| total lastSale |

	total _ cashierWithPrices
		checkout: cartWithElements
		on: FixedGregorianDate today
		with: validCreditCard.
		
	lastSale _ cashierWithPrices salesBook last.

	self assert: (lastSale value = total).
	self assert: (lastSale owner = validCreditCard cardOwner)! !

!TusLibrosTests methodsFor: 'Cashier tests' stamp: 'DS 6/17/2018 16:52:07'!
test17CashierDoesNotRegisterSaleWhenTheCreditCardHasNoCredit
	self
		should: [
			cashierWithPrices
				checkout: cartWithMoreElements 
				on: FixedGregorianDate today
				with: validCreditCard2 ]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError |
			self assert: anError messageText = 'El saldo es insuficiente' ].
		
	self assert: cashierWithPrices salesBook isEmpty ! !


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

!TusLibrosTests methodsFor: 'Merchant tests' stamp: 'DS 6/17/2018 15:52:39'!
test20MerchantRecognicesWhenCardDontHaveEnoughMoney
	aCart
		add: 1
		quantity: 2.
		
	self
		should: [
			cashierWithPrices
				checkout: aCart
				on: FixedGregorianDate today
				with: validCreditCard2 ]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError |
			self assert: anError messageText = 'El saldo es insuficiente' ].! !

!TusLibrosTests methodsFor: 'Merchant tests' stamp: 'f.o. 6/18/2018 15:41:27'!
test21AMerchantCantDebitAnExpiredCard
	self
		should: [
			aMerchant checkout: invalidCreditCard withAmount: 200]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError |
			anError messageText = CreditCard expiredError ].! !

!TusLibrosTests methodsFor: 'Merchant tests' stamp: 'f.o. 6/18/2018 15:43:07'!
test22AMerchantDebitAValidCard
	
	self shouldnt: [aMerchant checkout: validCreditCard withAmount: 1.] 
	       raise: Error - MessageNotUnderstood ! !


!TusLibrosTests methodsFor: 'Rest tests' stamp: 'f.o. 6/18/2018 16:15:26'!
test23RestLoginAnUserWithCartEmpty
	| idCart |
	idCart _ rest
		createCartWithClientId: 1
		password: 1.
	self assert: (rest listCart: idCart) isEmpty.! !

!TusLibrosTests methodsFor: 'Rest tests' stamp: 'f.o. 6/18/2018 16:15:40'!
test24RestCantLoginAnUserWithInvalidID
	self
		should: [
			rest
				createCartWithClientId: 2
				password: 1 ]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError |
			self assert: anError messageText = Rest invalidUser.
			self assert: rest listCarts isEmpty ].
	self
		should: [
			rest
				listPurchasesId: 2
				withPassword: 1 ]
		raise: Error
		withExceptionDo: [ :anError |
			self assert: anError messageText = Rest invalidUser.
			self assert: rest listCarts isEmpty ].! !

!TusLibrosTests methodsFor: 'Rest tests' stamp: 'f.o. 6/18/2018 16:15:51'!
test25RestCantLoginAnUserWithWrongPassword
	self
		should: [
			rest
				createCartWithClientId: 1
				password: 2 ]
		raise: Error
		withExceptionDo: [ :anError |
			self assert: anError messageText = Rest invalidUser.
			self assert: rest listCarts isEmpty ].! !

!TusLibrosTests methodsFor: 'Rest tests' stamp: 'f.o. 6/18/2018 16:16:17'!
test26RestCanAddBookISBNToCart
	| idCart |
	idCart _ rest
		createCartWithClientId: 1
		password: 1.
	rest
		addToCart: idCart
		isbn: 1
		withQuantity: 1.
	self assert: ((rest listCart: idCart) includes: 1).
	self assert: (rest listCart: idCart) elements = 1.! !

!TusLibrosTests methodsFor: 'Rest tests' stamp: 'f.o. 6/18/2018 16:21:21'!
test27RestRaiseErrorWhenISBNIsInvalid

	| idCart  |
	
	idCart := rest createCartWithClientId: 1 password: 1.
	
	self should: [rest addToCard: idCart isbn: 0 withQuantity: 1.]  
		raise:  Error
	 withExceptionDo: [:anError | 
				anError messageText  = Cart doesNotBelongToCatalog.
					self assert: (rest listCart: idCart ) elements  = 0.
		].! !

!TusLibrosTests methodsFor: 'Rest tests' stamp: 'f.o. 6/18/2018 16:17:07'!
test28RestRaiseErrorWhenISBNIsNotInCatalog

	| idCart  |
	
	idCart := rest createCartWithClientId: 1 password: 1.
	
	self should: [rest addToCard: idCart isbn: 10 withQuantity: 1.]  
		raise:  Error
	 withExceptionDo: [:anError | 
				self assert: (anError messageText  = 'No pertenece al catalogo').
					self assert: (rest listCart: idCart ) elements  = 0.
		].! !

!TusLibrosTests methodsFor: 'Rest tests' stamp: 'f.o. 6/18/2018 17:06:02'!
test29RestCartAreValidWith30minutesTransaction

	| idCart |
	
	idCart := rest createCartWithClientId: 1 password: 1.
	
	rest time: ((DateAndTime now) + 31 minutes ).
	
	self should: [rest addToCard: idCart isbn: 1 withQuantity: 1.]  
			raise: Error 
			 withExceptionDo: [:anError |
				self assert: (anError messageText = Rest timeExpired).
	]! !

!TusLibrosTests methodsFor: 'Rest tests' stamp: 'f.o. 6/18/2018 16:35:43'!
test30RestCheckoutOfElementWithInvalidCardIsNotATransaction

	| idCart  bag |
	
	idCart := rest createCartWithClientId: 1 password: 1.
	
	rest addToCard: idCart isbn: 1 withQuantity: 1.
	
	bag:= Bag new.
	bag add:1.
	
	self should: [rest checkout: idCart withNumberCard: 12345679301 withExpirationDate: FixedGregorianDate today withNameHolder: 'kevin'] 
				raise: Error  
				withExceptionDo: [:anError | 
					self assert: (rest transactions isEmpty).
					].
				
	self should: [rest checkout: idCart withNumberCard: 12345679301 withExpirationDate: (FixedGregorianDate - 60 days) today withNameHolder: 'kevin'] 
				raise: Error  
				withExceptionDo: [:anError | 
					self assert: (rest transactions isEmpty).
					].
				
	self should: [rest checkout: idCart withNumberCard: 12345679301 withExpirationDate: (FixedGregorianDate today) withNameHolder: ''] 
				raise: Error  
				withExceptionDo: [:anError | 
					self assert: (rest transactions isEmpty).
					].! !

!TusLibrosTests methodsFor: 'Rest tests' stamp: 'f.o. 6/18/2018 16:36:12'!
test31RestCheckoutWithInvalidCardIsNotATransactionEver

	| idCart  bag |
	
	idCart := rest createCartWithClientId: 1 password: 1.
	
	rest addToCard: idCart isbn: 1 withQuantity: 1000.
	
	bag:= Bag new.
	bag add:1.
	
	
	self should: [rest checkout: idCart withNumberCard: 123456789301 withExpirationDate: FixedGregorianDate today withNameHolder: 'kevin'] 
				raise: Error  
				withExceptionDo: [:anError | 
					self assert: (rest transactions isEmpty).
					].
			! !

!TusLibrosTests methodsFor: 'Rest tests' stamp: 'f.o. 6/18/2018 17:01:17'!
test32RestOnlyKnowCartsRelatedToID
	
	self should: [rest listCart: 1 ] 
			raise: Error 
		 withExceptionDo: [:anError |
					self assert: anError messageText = Rest invalidCart.
			].
	! !

!TusLibrosTests methodsFor: 'Rest tests' stamp: 'f.o. 6/18/2018 17:03:28'!
test33RestCartsFromSameIdAreDifferentCarts

	| idCart  idCart2 |
	
	idCart := rest createCartWithClientId: 1 password: 1.
	idCart2 := rest createCartWithClientId: 1 password: 1.
	
	
	self deny:  (idCart  = idCart2).
	self deny: ((rest listCart: idCart)  = (rest listCart: idCart2 ))! !

!TusLibrosTests methodsFor: 'Rest tests' stamp: 'f.o. 6/18/2018 17:03:40'!
test34ARestCartIsEqualToSelf

	| idCart  |
	
	idCart := rest createCartWithClientId: 1 password: 1.	
	
	self assert: ((rest listCart: idCart)  = (rest listCart: idCart ))! !

!TusLibrosTests methodsFor: 'Rest tests' stamp: 'f.o. 6/18/2018 17:06:26'!
test35RestCartWithTransactionsIsValid

	| idCart |
	
	idCart := rest createCartWithClientId: 1 password: 1.
	
	rest time: ((DateAndTime now) + 15 minutes ).
	rest addToCard: idCart isbn: 1 withQuantity: 1.
	rest time: (rest time + 16 minutes ).	
	self shouldnt: [rest addToCard: idCart isbn: 1 withQuantity: 1.]  raise: Error
			! !

!TusLibrosTests methodsFor: 'Rest tests' stamp: 'f.o. 6/18/2018 17:04:15'!
test36RestInitializeIDWithoutPurchases

	self assert: (rest listPurchasesId: 1 withPassword: 1) isEmpty .

	! !

!TusLibrosTests methodsFor: 'Rest tests' stamp: 'f.o. 6/18/2018 17:04:34'!
test37RestCartsFromDifferentIdAreDifferentCarts

	| idCart  idCart2 |
	
	idCart := rest createCartWithClientId: 1 password: 1.
	idCart2 := rest createCartWithClientId: 2 password: 2.
	
	
	self deny:  (idCart  = idCart2).
	self deny: ((rest listCart: idCart)  = (rest listCart: idCart2 ))! !

!TusLibrosTests methodsFor: 'Rest tests' stamp: 'f.o. 6/18/2018 17:06:50'!
test38RestCartInUseIsValid

	| idCart |
	
	idCart := rest createCartWithClientId: 1 password: 1.
	
	rest time: ((DateAndTime now) + 15 minutes ).
	rest listCart: idCart .
	rest time: (rest time + 16 minutes ).	
	self shouldnt: [rest addToCard: idCart isbn: 1 withQuantity: 1.]  raise: Error
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


!Cart methodsFor: 'testing' stamp: 'f.o. 6/18/2018 16:21:04'!
assertIsANaturalNumber: aNumber

	self assert: aNumber isInteger description: [self error: Cart quantityMustBeNaturalNumber].
	self assert:  aNumber  > 0 description: [self error: Cart quantityMustBeNaturalNumber].! !

!Cart methodsFor: 'testing' stamp: 'f.o. 6/18/2018 02:38:24'!
assertIsCorrectToAdd: anElement times: aQuantity

	self assert: (catalog includesKey: anElement) description: [self error: Cart doesNotBelongToCatalog].
	
	"No puede superar la cantidad que hay en stock
	self assert: (((catalog at: anElement) + (elements occurrencesOf: anElement)) >= aQuantity) description: [self error: Cart notSoManyProducts].
	"! !


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

!Cart class methodsFor: 'errors' stamp: 'f.o. 6/17/2018 11:52:36'!
doesNotBelongToCatalog
	^ 'No pertenece al catalogo'.! !

!Cart class methodsFor: 'errors' stamp: 'f.o. 6/17/2018 11:53:29'!
notSoManyProducts
	^ 'No hay tantos productos'.! !

!Cart class methodsFor: 'errors' stamp: 'f.o. 6/18/2018 16:20:54'!
quantityMustBeNaturalNumber
	^ 'Debe ingresar un natural mayor o igual a 1'.! !


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


!Cashier methodsFor: 'checkout' stamp: 'DS 6/17/2018 16:45:38'!
checkout: aCart on: aDate with: aCreditCard
	| cost |
	self
		assertCreditCardIsNotExpired: aCreditCard
		onDate: aDate.
	self assertHasPricesForEveryBookIn: aCart.
	self
		assert: aCart isEmpty not
		description: [ self error: 'El carrito no puede estar vacio' ].
	cost _ (aCart products collect: [ :product |
		priceList at: product ]) sum.
	merchant
		checkout: aCreditCard
		withAmount: cost.
	salesBook add:
		(Sale
			ofValue: cost
			from: aCreditCard cardOwner).
	^ cost.! !


!Cashier methodsFor: 'testing' stamp: 'f.o. 6/17/2018 12:30:42'!
assertCreditCardIsNotExpired: aCreditCard onDate: aDate

	self assert: (aCreditCard isExpiredOn: aDate) not description: [ self error: CreditCard expiredError ].! !

!Cashier methodsFor: 'testing' stamp: 'f.o. 6/17/2018 12:31:10'!
assertHasPricesForEveryBookIn: aCart

	self assert: (self hasPricesForEveryBookIn: aCart) description: [self error: Cashier priceListError].! !

!Cashier methodsFor: 'testing' stamp: 'DS 6/11/2018 15:06:32'!
hasPricesForEveryBookIn: aCart

	^(aCart products) allSatisfy: [:product | priceList includesKey: product]! !


!Cashier methodsFor: 'accessing' stamp: 'DS 6/17/2018 16:42:27'!
salesBook
	^salesBook copy! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Cashier class' category: #'TusLibros-Ejercicio'!
Cashier class
	instanceVariableNames: 'priceList'!

!Cashier class methodsFor: 'error messages' stamp: 'f.o. 6/10/2018 18:45:17'!
priceListError

	^'La lista de precio no incluye todos los elementos del carrito'.! !


!Cashier class methodsFor: 'class initialization' stamp: 'f.o. 6/18/2018 16:25:43'!
withPriceList: aPriceList andMerchant: aMerchantProcessor registeringOn: aSalesBook

	^ self new initializeWithPriceList: aPriceList andMerchant: aMerchantProcessor registeringOn: aSalesBook.! !


!classDefinition: #CreditCard category: #'TusLibros-Ejercicio'!
Object subclass: #CreditCard
	instanceVariableNames: 'cardNumber cardHolder expirationMonth'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros-Ejercicio'!

!CreditCard methodsFor: 'testing' stamp: 'f.o. 6/18/2018 16:42:45'!
isExpiredOn: aDate

	^expirationMonth < aDate .
	! !


!CreditCard methodsFor: 'initialization' stamp: 'f.o. 6/18/2018 16:43:16'!
withNumber: acardNumber withName: acardHolder withExpirationMonth: amonthOfYear

	cardNumber _ acardNumber.
	cardHolder _ acardHolder.
	expirationMonth _ amonthOfYear.
	self assert: (self isExpiredOn: GregorianMonthOfYear current) not description: [ self error: CreditCard expiredError ].! !


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


!MerchantProcessorSim methodsFor: 'checkout' stamp: 'DS 6/17/2018 16:14:11'!
checkout: creditCard withAmount: anAmount

	self isValid: creditCard .
	self assert: ((validCreditCards at: creditCard) >= anAmount)
		description: [self error: MerchantProcessorSim insufficientCredit].
	
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


!classDefinition: #Rest category: #'TusLibros-Ejercicio'!
Object subclass: #Rest
	instanceVariableNames: 'catalog dataLogin carts usersCarts actionsCarts time cartsCheckout merchant book transactions'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros-Ejercicio'!

!Rest methodsFor: 'as yet unclassified' stamp: 'f.o. 6/18/2018 16:13:28'!
addToCard: cartId isbn: isbn withQuantity: aQuantity 
	
	| cart |
	cart:= self listCart: cartId.
	cart add: isbn quantity: aQuantity .
	^ true.! !

!Rest methodsFor: 'as yet unclassified' stamp: 'f.o. 6/18/2018 16:13:32'!
addToCart: cartId isbn: isbn withQuantity: aQuantity 
	
	| cart |
	cart:= self listCart: cartId.
	cart add: isbn quantity: aQuantity .
	^ true.! !

!Rest methodsFor: 'as yet unclassified' stamp: 'f.o. 6/18/2018 16:46:52'!
checkout: cartId withNumberCard: numberCard withExpirationDate: anExpirationDate withNameHolder: aNameHolder
	| aCart aCashier |
	
	aCart _ self listCart: cartId.
	aCashier _ Cashier withPriceList: catalog andMerchant: merchant registeringOn: OrderedCollection new.
	transactions add:
		(
			aCashier checkout: aCart on: (FixedGregorianDate today) with: 
			(CreditCard new withNumber: numberCard withName: aNameHolder withExpirationMonth:anExpirationDate)
		).
	cartsCheckout add: cartId.
	^ transactions size.! !

!Rest methodsFor: 'as yet unclassified' stamp: 'f.o. 6/18/2018 02:42:33'!
createCartWithClientId: clientId password: password 

	self validateUser: clientId withPassword: password.
	
	carts addLast: (Cart withCatalog: catalog).
	(usersCarts at: clientId  ifAbsentPut: [OrderedCollection new .]) add: (carts size).
	self updateTimeCart: (carts size).
	
	^ carts size.! !

!Rest methodsFor: 'as yet unclassified' stamp: 'f.o. 6/18/2018 03:03:36'!
initializeWithCatalog: aCatalog withDataLogin: aDictionary withTime: aDate withMerchant: aMerchantProcesorSim withBook: aBook 
	catalog := aCatalog.
	dataLogin := aDictionary.
	carts  := OrderedCollection new.
	time := aDate.
	merchant := aMerchantProcesorSim.
	book  := aBook .
	transactions := OrderedCollection new.
	cartsCheckout := OrderedCollection new.
	usersCarts := Dictionary new.
	actionsCarts := Dictionary new.! !

!Rest methodsFor: 'as yet unclassified' stamp: 'f.o. 6/18/2018 02:48:57'!
listCart: idCart

	(cartsCheckout includes: idCart  ) ifTrue: [self error: Rest invalidCart].
	(((actionsCarts at:idCart ifAbsent: [self error: Rest invalidCart] ) + 30 minutes) < time) ifTrue: [self error: Rest timeExpired].
	self updateTimeCart: idCart .	
	"[ ^carts at: idCart .] on: Error do: [self error: Rest invalidCart ]."
	^carts at: idCart ! !

!Rest methodsFor: 'as yet unclassified' stamp: 'f.o. 6/18/2018 16:13:03'!
listCarts
	^ carts ! !

!Rest methodsFor: 'as yet unclassified' stamp: 'f.o. 6/18/2018 02:51:00'!
listPurchasesId: clientId withPassword: password 
	self validateUser: clientId withPassword: password.
	^ usersCarts at: clientId ifAbsent: [^ OrderedCollection new.].
! !

!Rest methodsFor: 'as yet unclassified' stamp: 'f.o. 6/18/2018 02:46:04'!
time
	^time.! !

!Rest methodsFor: 'as yet unclassified' stamp: 'f.o. 6/18/2018 02:45:46'!
time: aDateAndTime 
	time := aDateAndTime .! !

!Rest methodsFor: 'as yet unclassified' stamp: 'f.o. 6/18/2018 16:52:15'!
transactions
	^ transactions! !

!Rest methodsFor: 'as yet unclassified' stamp: 'f.o. 6/18/2018 03:13:07'!
updateTimeCart: idCart 
	actionsCarts at: idCart put: time! !

!Rest methodsFor: 'as yet unclassified' stamp: 'f.o. 6/18/2018 02:43:22'!
validateUser: clientId withPassword: password 
	self assert: (dataLogin at: clientId  ifAbsent: [self error: Rest invalidUser ]) = password description: [self error: Rest invalidUser].! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Rest class' category: #'TusLibros-Ejercicio'!
Rest class
	instanceVariableNames: ''!

!Rest class methodsFor: 'as yet unclassified' stamp: 'f.o. 6/18/2018 02:49:28'!
invalidCart
	^ 'invalid cart'! !

!Rest class methodsFor: 'as yet unclassified' stamp: 'f.o. 6/18/2018 02:43:54'!
invalidUser
	^ 'Invalid user/password'! !

!Rest class methodsFor: 'as yet unclassified' stamp: 'f.o. 6/18/2018 02:49:38'!
timeExpired
	^ 'time expired'! !

!Rest class methodsFor: 'as yet unclassified' stamp: 'f.o. 6/18/2018 16:24:27'!
withCatalog: aCatalog withDataLogin: aDictionary withMerchant: aMerchantProcesor
	^ self new initializeWithCatalog: aCatalog withDataLogin: aDictionary withTime: (Date today) withMerchant: aMerchantProcesor withBook: OrderedCollection  new.! !

!Rest class methodsFor: 'as yet unclassified' stamp: 'f.o. 6/18/2018 16:22:46'!
withCatalog: aCatalog withDataLogin: aDictionary withTime: aDate withMerchant: aMerchantProcesor
	^ self new initializeWithCatalog: aCatalog withDataLogin: aDictionary withTime: aDate withMerchant: aMerchantProcesor withBook: OrderedCollection  new.! !

!Rest class methodsFor: 'as yet unclassified' stamp: 'f.o. 6/18/2018 16:23:32'!
withCatalog: aCatalog withDataLogin: aDictionary withTime: aDate withMerchant: aMerchantProcesor withBook: anOrderedCollection 
	^ self new initializeWithCatalog: aCatalog withDataLogin: aDictionary withTime: aDate withMerchant: aMerchantProcesor withBook: anOrderedCollection! !


!classDefinition: #Sale category: #'TusLibros-Ejercicio'!
Object subclass: #Sale
	instanceVariableNames: 'value owner'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros-Ejercicio'!

!Sale methodsFor: 'inspecting' stamp: 'DS 6/17/2018 16:45:54'!
owner

	^owner! !

!Sale methodsFor: 'inspecting' stamp: 'DS 6/17/2018 16:45:47'!
value

	^value! !


!Sale methodsFor: 'initializing' stamp: 'f.o. 6/17/2018 11:45:40'!
registerWithValue: aValue from: aName

	value := aValue.
	owner := aName.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Sale class' category: #'TusLibros-Ejercicio'!
Sale class
	instanceVariableNames: ''!

!Sale class methodsFor: 'class initialization' stamp: 'DS 6/17/2018 16:45:38'!
ofValue: aValue from: aName
	^ Sale new
		registerWithValue: aValue
		from: aName.! !
