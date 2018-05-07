!classDefinition: #NumeroTest category: #'Numero-Solution-4'!
TestCase subclass: #NumeroTest
	instanceVariableNames: 'zero one two four oneFifth oneHalf five twoFifth twoTwentyfifth fiveHalfs'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numero-Solution-4'!

!NumeroTest methodsFor: 'setup' stamp: 'HernanWilkinson 5/7/2016 20:56'!
setUp

	zero := Entero with: 0.
	one := Entero with: 1.
	two := Entero with: 2.
	four := Entero with: 4.
	five := Entero with: 5.
	
	oneHalf := one / two.
	oneFifth := one / five.
	twoFifth := two / five.
	twoTwentyfifth := two / (Entero with: 25).
	fiveHalfs := five / two.
	! !


!NumeroTest methodsFor: 'tests' stamp: 'HAW 5/3/2017 15:49:20'!
shouldRaiseDivideByZeroException: aBlock

	self 
		should: aBlock
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError | self assert: anError messageText equals: Numero canNotDivideByZeroErrorDescription ]
	! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 20:11'!
test01isCeroReturnsTrueWhenAskToZero

	self assert: zero isZero! !

!NumeroTest methodsFor: 'tests' stamp: 'HAW 5/3/2017 15:37:57'!
test02isCeroReturnsFalseWhenAskToOthersButZero

	self deny: one isZero.
	self deny: two isZero.! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 20:13'!
test03isOneReturnsTrueWhenAskToOne

	self assert: one isOne! !

!NumeroTest methodsFor: 'tests' stamp: 'HAW 5/3/2017 15:37:46'!
test04isOneReturnsFalseWhenAskToOtherThanOne

	self deny: zero isOne.
	self deny: two isOne.! !

!NumeroTest methodsFor: 'tests' stamp: 'HAW 5/3/2017 15:32:23'!
test05EnteroAddsWithEnteroCorrectly

	"Lo correcto seria hacer un test por cada uno de estos asserts ya que son casos distintos.
	Lo hago todo aca para no modificar mucho la estructura del test suite - Hernan"
	self assert: zero + zero equals: zero.
	self assert: zero + one equals: one.
	self assert: zero + two equals: two.
	
	self assert: one + zero equals: one.
	self assert: one + one equals: two.
	self assert: one + two equals: (Entero with: 3).
	
	self assert: two + zero equals: two.
	self assert: two + one equals: (Entero with: 3).
	self assert: two + two equals: four ! !

!NumeroTest methodsFor: 'tests' stamp: 'HAW 5/3/2017 15:20:44'!
test06EnteroMultipliesWithEnteroCorrectly

	"Lo correcto seria hacer un test por cada uno de estos asserts ya que son casos distintos.
	Lo hago todo aca para no modificar mucho la estructura del test suite - Hernan"
	self assert: zero * zero equals: zero.
	self assert: zero * one equals: zero.
	self assert: zero * two equals: zero.
	
	self assert: one * zero equals: zero.
	self assert: one * one equals: one.
	self assert: one * two equals: two.
	
	self assert: two * zero equals: zero.
	self assert: two * one equals: two.
	self assert: two * two equals: four! !

!NumeroTest methodsFor: 'tests' stamp: 'HAW 5/3/2017 15:32:52'!
test07EnteroDividesEnteroCorrectly

	"Lo correcto seria hacer un test por cada uno de estos asserts ya que son casos distintos.
	Lo hago todo aca para no modificar mucho la estructura del test suite - Hernan"
	self shouldRaiseDivideByZeroException: [ zero / zero ].
	self assert: zero / one equals: zero.
	self assert: zero / two equals: zero.
	
	self shouldRaiseDivideByZeroException: [ one / zero ].
	self assert: one / one equals: one.
	self assert: one / two equals: oneHalf.
	
	self shouldRaiseDivideByZeroException: [ two / zero ].
	self assert: two / one equals: two.
	self assert: two / two equals: one! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 20:38'!
test08FraccionAddsWithFraccionCorrectly
"
    La suma de fracciones es:
	 
	a/b + c/d = (a.d + c.b) / (b.d)
	 
	SI ESTAN PENSANDO EN LA REDUCCION DE FRACCIONES NO SE PREOCUPEN!!
	TODAVIA NO SE ESTA TESTEANDO ESE CASO
"
	| sevenTenths |

	sevenTenths := (Entero with: 7) / (Entero with: 10).

	self assert: oneFifth + oneHalf equals: sevenTenths! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 20:52'!
test09FraccionMultipliesWithFraccionCorrectly
"
    La multiplicacion de fracciones es:
	 
	(a/b) * (c/d) = (a.c) / (b.d)
"

	self assert: oneFifth * twoFifth equals: twoTwentyfifth! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 20:56'!
test10FraccionDividesFraccionCorrectly
"
    La division de fracciones es:
	 
	(a/b) / (c/d) = (a.d) / (b.c)
"

	self assert: oneHalf / oneFifth equals: fiveHalfs! !

!NumeroTest methodsFor: 'tests' stamp: 'HAW 5/3/2017 15:26:14'!
test11EnteroAddsFraccionCorrectly

	"Ahora empieza la diversion!!

	Lo correcto seria hacer un test por cada uno de estos asserts ya que son casos distintos.
	Lo hago todo aca para no modificar mucho la estructura del test suite - Hernan"

	self assert: zero + oneFifth equals: oneFifth.
	self assert: one + oneFifth equals:  (Entero with: 6) / five.
	self assert: two + oneFifth equals: (Entero with: 11) / five.
	! !

!NumeroTest methodsFor: 'tests' stamp: 'HAW 5/3/2017 15:27:05'!
test12FraccionAddsEnteroCorrectly

	"Lo correcto seria hacer un test por cada uno de estos asserts ya que son casos distintos.
	Lo hago todo aca para no modificar mucho la estructura del test suite - Hernan"

	self assert: oneFifth + zero equals: oneFifth.
	self assert: oneFifth + one equals:  (Entero with: 6) / five.
	self assert: oneFifth + two equals: (Entero with: 11) / five.
	! !

!NumeroTest methodsFor: 'tests' stamp: 'HAW 5/3/2017 15:27:54'!
test13EnteroMultipliesFraccionCorrectly
	
	"Lo correcto seria hacer un test por cada uno de estos asserts ya que son casos distintos.
	Lo hago todo aca para no modificar mucho la estructura del test suite - Hernan"

	self assert: zero * oneFifth equals: zero.
	self assert: one * oneFifth equals: oneFifth.
	self assert: two * oneFifth equals: twoFifth ! !

!NumeroTest methodsFor: 'tests' stamp: 'HAW 5/3/2017 15:28:41'!
test14FraccionMultipliesEnteroCorrectly

	"Lo correcto seria hacer un test por cada uno de estos asserts ya que son casos distintos.
	Lo hago todo aca para no modificar mucho la estructura del test suite - Hernan"

	self assert: oneFifth * zero equals: zero.
	self assert: oneFifth * one  equals:  oneFifth.
	self assert: oneFifth * two equals: twoFifth ! !

!NumeroTest methodsFor: 'tests' stamp: 'HAW 5/3/2017 15:30:12'!
test15EnteroDividesFraccionCorrectly

	"Lo correcto seria hacer un test por cada uno de estos asserts ya que son casos distintos.
	Lo hago todo aca para no modificar mucho la estructura del test suite - Hernan"

	self assert: zero / oneFifth equals: zero.
	self assert: one / oneFifth equals: five.
	self assert: two / oneFifth equals: (Entero with: 10)
	
! !

!NumeroTest methodsFor: 'tests' stamp: 'HAW 5/3/2017 15:32:05'!
test16FraccionDividesEnteroCorrectly

	"Lo correcto seria hacer un test por cada uno de estos asserts ya que son casos distintos.
	Lo hago todo aca para no modificar mucho la estructura del test suite - Hernan"

	self shouldRaiseDivideByZeroException: [ oneFifth / zero ].
	self assert: oneFifth / one equals: oneFifth.
	self assert: oneFifth / two equals: one/ (Entero with: 10)
	

	! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 22:38'!
test17AFraccionCanBeEqualToAnEntero

	self assert: two equals: four / two! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 22:39'!
test18AparentFraccionesAreEqual

	self assert: oneHalf equals: two / four! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 22:40'!
test19AddingFraccionesCanReturnAnEntero

	self assert: oneHalf + oneHalf equals: one! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 22:42'!
test20MultiplyingFraccionesCanReturnAnEntero

	self assert: (two/five) * (five/two) equals: one! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 22:42'!
test21DividingFraccionesCanReturnAnEntero

	self assert: oneHalf / oneHalf equals: one! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 22:43'!
test22DividingEnterosCanReturnAFraccion

	self assert: two / four equals: oneHalf! !

!NumeroTest methodsFor: 'tests' stamp: 'HAW 5/3/2017 15:35:56'!
test23CanNotDivideEnteroByZero

	"Este test ya no tiene sentido porque se esta verificando en los tests de division.
	Lo dejo solo para que se vea que ya no tiene sentido - Hernan
	self 
		should: [ one / zero ]
		raise: Error
		withExceptionDo: [ :anError | self assert: anError messageText equals: Numero canNotDivideByZeroErrorDescription ]
	"! !

!NumeroTest methodsFor: 'tests' stamp: 'HAW 5/3/2017 15:36:09'!
test24CanNotDivideFraccionByZero

	"Este test ya no tiene sentido porque se esta verificando en los tests de division.
	Lo dejo solo para que se vea que ya no tiene sentido - Hernan
	self 
		should: [ oneHalf / zero ]
		raise: Error
		withExceptionDo: [ :anError | self assert: anError messageText equals: Numero canNotDivideByZeroErrorDescription ]
	"	! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 22:50'!
test25AFraccionCanNotBeZero

	self deny: oneHalf isZero! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 22:50'!
test26AFraccionCanNotBeOne

	self deny: oneHalf isOne! !


!classDefinition: #Numero category: #'Numero-Solution-4'!
Object subclass: #Numero
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numero-Solution-4'!

!Numero methodsFor: 'arithmetic operations' stamp: 'HernanWilkinson 5/7/2016 22:48'!
* aMultiplier

	self subclassResponsibility ! !

!Numero methodsFor: 'arithmetic operations' stamp: 'HernanWilkinson 5/7/2016 22:49'!
+ anAdder

	self subclassResponsibility ! !

!Numero methodsFor: 'arithmetic operations' stamp: 'HernanWilkinson 5/7/2016 22:49'!
/ aDivisor

	self subclassResponsibility ! !


!Numero methodsFor: 'arithmetic operations - private' stamp: 'HAW 5/3/2017 18:04:09'!
addEnteroMenosUnoYCero: anAdder

	self subclassResponsibility ! !

!Numero methodsFor: 'arithmetic operations - private' stamp: 'HernanWilkinson 5/7/2016 23:09'!
addFraccion: anAdder

	self subclassResponsibility ! !

!Numero methodsFor: 'arithmetic operations - private' stamp: 'HAW 5/3/2017 18:04:30'!
addUno: anAdder

	self subclassResponsibility ! !

!Numero methodsFor: 'arithmetic operations - private' stamp: 'HAW 5/3/2017 18:05:01'!
divideCero: aDividend

	self subclassResponsibility ! !

!Numero methodsFor: 'arithmetic operations - private' stamp: 'HAW 5/3/2017 18:05:15'!
divideEnteroMenosUnoYCero: aDividend

	self subclassResponsibility ! !

!Numero methodsFor: 'arithmetic operations - private' stamp: 'HernanWilkinson 5/7/2016 23:10'!
divideFraccion: aDividend

	self subclassResponsibility ! !

!Numero methodsFor: 'arithmetic operations - private' stamp: 'HAW 5/3/2017 18:05:35'!
divideUno: aDividend

	self subclassResponsibility ! !

!Numero methodsFor: 'arithmetic operations - private' stamp: 'HAW 5/3/2017 18:05:47'!
multiplyEnteroMenosUnoYCero: aMultiplier

	self subclassResponsibility ! !

!Numero methodsFor: 'arithmetic operations - private' stamp: 'HernanWilkinson 5/7/2016 23:09'!
multiplyFraccion: aMultiplier

	self subclassResponsibility ! !


!Numero methodsFor: 'testing' stamp: 'HernanWilkinson 5/7/2016 22:49'!
isOne

	self subclassResponsibility ! !

!Numero methodsFor: 'testing' stamp: 'HernanWilkinson 5/7/2016 22:49'!
isZero

	self subclassResponsibility ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Numero class' category: #'Numero-Solution-4'!
Numero class
	instanceVariableNames: ''!

!Numero class methodsFor: 'error descriptions' stamp: 'HernanWilkinson 5/7/2016 22:45'!
canNotDivideByZeroErrorDescription

	^'No se puede dividir por cero'! !


!classDefinition: #Entero category: #'Numero-Solution-4'!
Numero subclass: #Entero
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numero-Solution-4'!

!Entero methodsFor: 'arithmetic operations' stamp: 'HAW 5/2/2017 17:13:09'!
// aDivisor 
	
	^self class with: self integerValue // aDivisor integerValue
	! !

!Entero methodsFor: 'arithmetic operations' stamp: 'HAW 5/2/2017 17:19:13'!
greatestCommonDivisorWith: anEntero 
	
	self subclassResponsibility ! !


!Entero methodsFor: 'arithmetic operations - private' stamp: 'HAW 5/2/2017 17:43:13'!
asDenominatorOf: aNumerator

	self subclassResponsibility ! !


!Entero methodsFor: 'value' stamp: 'HAW 5/2/2017 17:21:12'!
integerValue

	"Usamos integerValue en vez de value para que no haya problemas con el mensaje value implementado en Object - Hernan"
	
	self subclassResponsibility ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Entero class' category: #'Numero-Solution-4'!
Entero class
	instanceVariableNames: ''!

!Entero class methodsFor: 'instance creation' stamp: 'HAW 5/3/2017 16:13:47'!
with: aValue 
	
	"Esta verificacion esta puesta por si se equivocan y quieren crear un Entero pasando otra cosa que un Integer - Hernan"
	aValue isInteger ifFalse: [  self error: 'aValue debe ser anInteger' ].
	
	aValue = 0 ifTrue: [ ^Cero new ].
	aValue = 1 ifTrue: [ ^Uno new ].
	 
	^EnteroMenosUnoYCero safeWith: aValue! !


!classDefinition: #Cero category: #'Numero-Solution-4'!
Entero subclass: #Cero
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numero-Solution-4'!

!Cero methodsFor: 'arithmetic operations' stamp: 'HAW 5/2/2017 17:31:30'!
* aMultiplier 
	
	^self! !

!Cero methodsFor: 'arithmetic operations' stamp: 'HAW 5/2/2017 17:31:48'!
+ anAdder 
	
	^anAdder! !

!Cero methodsFor: 'arithmetic operations' stamp: 'HAW 5/3/2017 12:40:57'!
/ aDivisor 
	
	^aDivisor divideCero: self! !

!Cero methodsFor: 'arithmetic operations' stamp: 'HAW 5/3/2017 18:14:09'!
// aDivisor

	^self! !

!Cero methodsFor: 'arithmetic operations' stamp: 'HAW 5/2/2017 17:14:45'!
greatestCommonDivisorWith: anEntero 
	
	^ anEntero ! !


!Cero methodsFor: 'arithmetic operations - private' stamp: 'HAW 5/3/2017 15:40:59'!
addEnteroMenosUnoYCero: anAdder

	^anAdder 
	
	! !

!Cero methodsFor: 'arithmetic operations - private' stamp: 'HAW 5/2/2017 17:45:19'!
addFraccion: anAdder 
	
	^anAdder ! !

!Cero methodsFor: 'arithmetic operations - private' stamp: 'HAW 5/3/2017 15:56:36'!
addUno: anAdder 
	
	^ anAdder ! !

!Cero methodsFor: 'arithmetic operations - private' stamp: 'HAW 5/3/2017 15:56:43'!
asDenominatorOf: aNumerator

	self signalCanNotDivideByZero ! !

!Cero methodsFor: 'arithmetic operations - private' stamp: 'HAW 5/3/2017 15:56:50'!
divideCero: aCero 
	
	self signalCanNotDivideByZero ! !

!Cero methodsFor: 'arithmetic operations - private' stamp: 'HAW 5/3/2017 15:50:42'!
divideEnteroMenosUnoYCero: aDividend

	self signalCanNotDivideByZero ! !

!Cero methodsFor: 'arithmetic operations - private' stamp: 'HAW 5/3/2017 15:57:14'!
divideFraccion: aDividend

	self signalCanNotDivideByZero ! !

!Cero methodsFor: 'arithmetic operations - private' stamp: 'HAW 5/3/2017 15:49:51'!
divideUno: anUno 
	
	self signalCanNotDivideByZero! !

!Cero methodsFor: 'arithmetic operations - private' stamp: 'HAW 5/3/2017 15:42:18'!
multiplyEnteroMenosUnoYCero: aMultiplier

	^self! !

!Cero methodsFor: 'arithmetic operations - private' stamp: 'HAW 5/2/2017 17:24:17'!
multiplyFraccion: aMultiplier

	^self
	! !

!Cero methodsFor: 'arithmetic operations - private' stamp: 'HAW 5/3/2017 15:50:07'!
signalCanNotDivideByZero
	
	self error: self class canNotDivideByZeroErrorDescription ! !


!Cero methodsFor: 'value' stamp: 'HAW 5/2/2017 17:11:32'!
integerValue

	^0! !


!Cero methodsFor: 'testing' stamp: 'HAW 5/2/2017 17:22:15'!
isOne

	^false! !

!Cero methodsFor: 'testing' stamp: 'HAW 5/2/2017 17:22:09'!
isZero

	^true! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Cero class' category: #'Numero-Solution-4'!
Cero class
	instanceVariableNames: 'uniqueInstance'!

!Cero class methodsFor: 'initialization' stamp: 'HAW 5/3/2017 18:11:21'!
initialize

	uniqueInstance := self basicNew! !


!Cero class methodsFor: 'instance creation' stamp: 'HAW 5/3/2017 18:10:38'!
new

	^uniqueInstance! !


!classDefinition: #EnteroMenosUnoYCero category: #'Numero-Solution-4'!
Entero subclass: #EnteroMenosUnoYCero
	instanceVariableNames: 'value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numero-Solution-4'!

!EnteroMenosUnoYCero methodsFor: 'initialization' stamp: 'HAW 5/3/2017 16:16:41'!
initializeSafeWith: aValue 
	
	value := aValue! !


!EnteroMenosUnoYCero methodsFor: 'arithmetic operations' stamp: 'HAW 5/3/2017 12:53:17'!
* aMultiplier 
	
	^aMultiplier multiplyEnteroMenosUnoYCero: self ! !

!EnteroMenosUnoYCero methodsFor: 'arithmetic operations' stamp: 'HAW 5/3/2017 12:53:34'!
+ anAdder 
	
	^anAdder addEnteroMenosUnoYCero: self.
	! !

!EnteroMenosUnoYCero methodsFor: 'arithmetic operations' stamp: 'HAW 5/3/2017 12:54:09'!
/ aDivisor 
	
	^aDivisor divideEnteroMenosUnoYCero: self! !

!EnteroMenosUnoYCero methodsFor: 'arithmetic operations' stamp: 'HAW 5/2/2017 17:19:26'!
greatestCommonDivisorWith: anEntero 
	
	^self class with: (value gcd: anEntero integerValue)! !


!EnteroMenosUnoYCero methodsFor: 'arithmetic operations - private' stamp: 'HAW 5/3/2017 15:41:51'!
addEnteroMenosUnoYCero: anAdder

	^Entero with: value + anAdder integerValue ! !

!EnteroMenosUnoYCero methodsFor: 'arithmetic operations - private' stamp: 'HAW 5/2/2017 18:03:04'!
addFraccion: anAdder

	^self + anAdder 
	! !

!EnteroMenosUnoYCero methodsFor: 'arithmetic operations - private' stamp: 'HAW 5/3/2017 18:16:35'!
addUno: anAdder 
	
	"Si soy -1 daria 0, por eso envia mensaje a Entero y no a self class - Hernan"
	
	^Entero with: 1 + value ! !

!EnteroMenosUnoYCero methodsFor: 'arithmetic operations - private' stamp: 'HAW 5/3/2017 16:15:34'!
asDenominatorOf: aNumerator

	^Fraccion safeWith: aNumerator over: self
! !

!EnteroMenosUnoYCero methodsFor: 'arithmetic operations - private' stamp: 'HAW 5/3/2017 15:59:15'!
divideCero: aDividend 
	
	^ aDividend ! !

!EnteroMenosUnoYCero methodsFor: 'arithmetic operations - private' stamp: 'HAW 5/3/2017 13:03:14'!
divideEnteroMenosUnoYCero: aDividend 
	
	| denominator greatestCommonDivisor numerator |
	
	greatestCommonDivisor := aDividend greatestCommonDivisorWith: self. 
	numerator := aDividend // greatestCommonDivisor.
	denominator := self // greatestCommonDivisor.
	
	^denominator asDenominatorOf: numerator	! !

!EnteroMenosUnoYCero methodsFor: 'arithmetic operations - private' stamp: 'HAW 5/2/2017 17:55:17'!
divideFraccion: aDividend

	^aDividend numerator / (aDividend denominator * self) ! !

!EnteroMenosUnoYCero methodsFor: 'arithmetic operations - private' stamp: 'HAW 5/3/2017 16:15:13'!
divideUno: aDividend
	
	^Fraccion safeWith: aDividend over: self! !

!EnteroMenosUnoYCero methodsFor: 'arithmetic operations - private' stamp: 'HAW 5/3/2017 18:16:01'!
multiplyEnteroMenosUnoYCero: aMultiplier

	^self class safeWith: value * aMultiplier integerValue ! !

!EnteroMenosUnoYCero methodsFor: 'arithmetic operations - private' stamp: 'HAW 5/2/2017 17:24:10'!
multiplyFraccion: aMultiplier

	^self * aMultiplier ! !


!EnteroMenosUnoYCero methodsFor: 'comparing' stamp: 'HAW 5/2/2017 17:15:56'!
= anObject

	^(anObject isKindOf: self class) and: [ value = anObject integerValue ]! !

!EnteroMenosUnoYCero methodsFor: 'comparing' stamp: 'HAW 5/2/2017 17:20:18'!
hash

	^value hash! !


!EnteroMenosUnoYCero methodsFor: 'value' stamp: 'HAW 5/2/2017 17:21:33'!
integerValue
	
	^value! !


!EnteroMenosUnoYCero methodsFor: 'testing' stamp: 'HAW 5/2/2017 17:22:30'!
isOne

	^false! !

!EnteroMenosUnoYCero methodsFor: 'testing' stamp: 'HAW 5/2/2017 17:22:23'!
isZero

	^false! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'EnteroMenosUnoYCero class' category: #'Numero-Solution-4'!
EnteroMenosUnoYCero class
	instanceVariableNames: ''!

!EnteroMenosUnoYCero class methodsFor: 'instance creation - private' stamp: 'HAW 5/3/2017 18:11:33'!
safeWith: anIntegerValue

	"Solo debe ser enviado este mensaje cuando es seguro que anIntegerValue es distinto de 0 y 1,
	y solo debe ser enviado desde la misma jerarquia - Hernan"
	
	^self new initializeSafeWith: anIntegerValue ! !


!classDefinition: #Uno category: #'Numero-Solution-4'!
Entero subclass: #Uno
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numero-Solution-4'!

!Uno methodsFor: 'arithmetic operations' stamp: 'HAW 5/2/2017 17:33:00'!
* aMultiplier 
	
	^aMultiplier ! !

!Uno methodsFor: 'arithmetic operations' stamp: 'HAW 5/3/2017 12:55:55'!
+ anAdder 
	
	^anAdder addUno: self.
	! !

!Uno methodsFor: 'arithmetic operations' stamp: 'HAW 5/3/2017 12:56:15'!
/ aDivisor 
	
	^aDivisor divideUno: self! !

!Uno methodsFor: 'arithmetic operations' stamp: 'HAW 5/2/2017 17:15:00'!
greatestCommonDivisorWith: anEntero 
	
	^self 
	! !


!Uno methodsFor: 'arithmetic operations - private' stamp: 'HAW 5/3/2017 18:17:07'!
addEnteroMenosUnoYCero: anAdder

	^Entero with: 1 + anAdder integerValue ! !

!Uno methodsFor: 'arithmetic operations - private' stamp: 'HAW 5/2/2017 18:05:31'!
addFraccion: anAdder

	^ anAdder denominator + anAdder numerator / anAdder denominator ! !

!Uno methodsFor: 'arithmetic operations - private' stamp: 'HAW 5/3/2017 16:14:11'!
addUno: anAdder

	^EnteroMenosUnoYCero safeWith: 2! !

!Uno methodsFor: 'arithmetic operations - private' stamp: 'HAW 5/2/2017 17:42:16'!
asDenominatorOf: aNumerator

	^aNumerator ! !

!Uno methodsFor: 'arithmetic operations - private' stamp: 'HAW 5/3/2017 16:03:52'!
divideCero: aDividend 
	
	^aDividend ! !

!Uno methodsFor: 'arithmetic operations - private' stamp: 'HAW 5/3/2017 15:48:26'!
divideEnteroMenosUnoYCero: aDividend

	^aDividend ! !

!Uno methodsFor: 'arithmetic operations - private' stamp: 'HAW 5/2/2017 17:57:49'!
divideFraccion: aDividend

	^aDividend ! !

!Uno methodsFor: 'arithmetic operations - private' stamp: 'HAW 5/3/2017 16:04:05'!
divideUno: aDividend 
	
	^self! !

!Uno methodsFor: 'arithmetic operations - private' stamp: 'HAW 5/3/2017 15:42:36'!
multiplyEnteroMenosUnoYCero: aMultiplier

	^aMultiplier ! !

!Uno methodsFor: 'arithmetic operations - private' stamp: 'HAW 5/2/2017 17:24:01'!
multiplyFraccion: aMultiplier

	^aMultiplier ! !


!Uno methodsFor: 'value' stamp: 'HAW 5/2/2017 17:11:39'!
integerValue

	^1! !


!Uno methodsFor: 'testing' stamp: 'HAW 5/2/2017 17:22:43'!
isOne

	^true! !

!Uno methodsFor: 'testing' stamp: 'HAW 5/2/2017 17:22:39'!
isZero

	^false! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Uno class' category: #'Numero-Solution-4'!
Uno class
	instanceVariableNames: 'uniqueInstance'!

!Uno class methodsFor: 'initialization' stamp: 'HAW 5/3/2017 18:12:13'!
initialize

	uniqueInstance := self basicNew ! !


!Uno class methodsFor: 'instance creation' stamp: 'HAW 5/3/2017 18:11:48'!
new

	^uniqueInstance! !


!classDefinition: #Fraccion category: #'Numero-Solution-4'!
Numero subclass: #Fraccion
	instanceVariableNames: 'numerator denominator'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numero-Solution-4'!

!Fraccion methodsFor: 'initialization' stamp: 'HAW 5/3/2017 16:16:31'!
initializeSafeWith: aNumerator over: aDenominator

	"Estas precondiciones estan por si se comenten errores en la implementacion durante la 
	realizacion del ejercicio, sino por como creacion esto no podria pasar - Hernan"
	aNumerator isZero ifTrue: [ self error: 'una fraccion no puede ser cero' ].
	aDenominator isOne ifTrue: [ self error: 'una fraccion no puede tener denominador 1 porque sino es un entero' ].
	
	numerator := aNumerator.
	denominator := aDenominator ! !


!Fraccion methodsFor: 'arithmetic operations' stamp: 'HernanWilkinson 5/7/2016 23:03'!
* aMultiplier 
	
	^aMultiplier multiplyFraccion: self! !

!Fraccion methodsFor: 'arithmetic operations' stamp: 'HernanWilkinson 5/7/2016 23:04'!
+ anAdder 
	
	^anAdder addFraccion: self! !

!Fraccion methodsFor: 'arithmetic operations' stamp: 'HernanWilkinson 5/7/2016 23:06'!
/ aDivisor 
	
	^aDivisor divideFraccion: self! !


!Fraccion methodsFor: 'arithmetic operations - private' stamp: 'HAW 5/3/2017 15:45:40'!
addEnteroMenosUnoYCero: anAdder

	^anAdder * denominator + numerator / denominator ! !

!Fraccion methodsFor: 'arithmetic operations - private' stamp: 'HernanWilkinson 5/7/2016 23:05'!
addFraccion: anAdder

	| newNumerator newDenominator |
	
	newNumerator := (numerator * anAdder denominator) + (denominator * anAdder numerator).
	newDenominator := denominator * anAdder denominator.
	
	^newNumerator / newDenominator 
! !

!Fraccion methodsFor: 'arithmetic operations - private' stamp: 'HAW 5/3/2017 16:05:06'!
addUno: anAdder 
	
	^ denominator + numerator / denominator ! !

!Fraccion methodsFor: 'arithmetic operations - private' stamp: 'HAW 5/3/2017 16:05:18'!
divideCero: aDividend 
	
	^aDividend ! !

!Fraccion methodsFor: 'arithmetic operations - private' stamp: 'HAW 5/3/2017 15:48:57'!
divideEnteroMenosUnoYCero: aDividend

	^aDividend * denominator / numerator ! !

!Fraccion methodsFor: 'arithmetic operations - private' stamp: 'HernanWilkinson 5/7/2016 23:07'!
divideFraccion: aDividend

	^(aDividend numerator * denominator) / (aDividend denominator * numerator)
	! !

!Fraccion methodsFor: 'arithmetic operations - private' stamp: 'HAW 5/3/2017 16:14:33'!
divideUno: aDividend 
	
	^denominator / numerator ! !

!Fraccion methodsFor: 'arithmetic operations - private' stamp: 'HAW 5/3/2017 15:46:24'!
multiplyEnteroMenosUnoYCero: aMultiplier

	^numerator * aMultiplier / denominator ! !

!Fraccion methodsFor: 'arithmetic operations - private' stamp: 'HernanWilkinson 5/7/2016 23:03'!
multiplyFraccion: aMultiplier

	^(numerator * aMultiplier numerator) / (denominator * aMultiplier denominator)
	! !


!Fraccion methodsFor: 'accessing' stamp: 'HernanWilkinson 5/7/2016 21:56'!
denominator

	^ denominator! !

!Fraccion methodsFor: 'accessing' stamp: 'HernanWilkinson 5/7/2016 21:56'!
numerator

	^ numerator! !


!Fraccion methodsFor: 'comparing' stamp: 'HernanWilkinson 5/7/2016 20:42'!
= anObject

	^(anObject isKindOf: self class) and: [ (numerator * anObject denominator) = (denominator * anObject numerator) ]! !

!Fraccion methodsFor: 'comparing' stamp: 'HernanWilkinson 5/7/2016 20:50'!
hash

	^(numerator hash / denominator hash) hash! !


!Fraccion methodsFor: 'testing' stamp: 'HernanWilkinson 5/7/2016 22:51'!
isOne
	
	^false! !

!Fraccion methodsFor: 'testing' stamp: 'HernanWilkinson 5/7/2016 22:51'!
isZero
	
	^false! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Fraccion class' category: #'Numero-Solution-4'!
Fraccion class
	instanceVariableNames: ''!

!Fraccion class methodsFor: 'instance creation' stamp: 'HAW 5/3/2017 16:15:46'!
safeWith: aNumerator over: aDenominator
 
	^self new initializeSafeWith: aNumerator over: aDenominator ! !

Cero initialize!
Uno initialize!