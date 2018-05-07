!classDefinition: #NumeroTest category: #'Numero-Prototipo-DDEnEntero'!
DenotativeObject subclass: #NumeroTest
	instanceVariableNames: 'zero one two four oneFifth oneHalf five twoFifth twoTwentyfifth fiveHalfs'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numero-Prototipo-DDEnEntero'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'NumeroTest class' category: #'Numero-Prototipo-DDEnEntero'!
NumeroTest class
	instanceVariableNames: 'zero one two four oneFifth oneHalf five twoFifth twoTwentyfifth fiveHalfs'!

!NumeroTest class methodsFor: 'setup' stamp: 'HAW 9/13/2017 19:19:27'!
setUp
	zero _ Cero.
	one _ Uno.
	two _ EnteroTrait with: 2.
	four _ EnteroTrait with: 4.
	five _ EnteroTrait with: 5.
	oneHalf _ one / two.
	oneFifth _ one / five.
	twoFifth _ two / five.
	twoTwentyfifth _ two / (EnteroTrait with: 25).
	fiveHalfs _ five / two.! !


!NumeroTest class methodsFor: 'assertions' stamp: 'HAW 9/13/2017 16:24:31'!
LEER

	"Cree estos mensajes de asserciones porque los tests los copie de la implementacion con clases, por lo tanto para no tener que
	modificar todos los tests para que usen Assert redefini estos mensajes en base a Assert - Hernan"! !

!NumeroTest class methodsFor: 'assertions' stamp: 'HAW 9/13/2017 14:59:28'!
assert: aBoolean

	Assert isTrue: aBoolean ! !

!NumeroTest class methodsFor: 'assertions' stamp: 'HAW 9/13/2017 15:00:06'!
assert: anObject equals: anotherObject

	Assert that: anObject isEqualTo: anotherObject ! !

!NumeroTest class methodsFor: 'assertions' stamp: 'HAW 9/13/2017 14:59:35'!
deny: aBoolean

	Assert isFalse: aBoolean ! !

!NumeroTest class methodsFor: 'assertions' stamp: 'HAW 9/13/2017 16:25:28'!
shouldRaiseDivideByZeroException: aBlock

	Assert should: aBlock signal: Error - MessageNotUnderstood withDescription: Cero canNotDivideByZeroErrorDescription 
	! !


!NumeroTest class methodsFor: 'tests' stamp: 'HAW 9/13/2017 19:19:27'!
test05EnteroAddsWithEnteroCorrectly
	"Lo correcto seria hacer un test por cada uno de estos asserts ya que son casos distintos.
	Lo hago todo aca para no modificar mucho la estructura del test suite - Hernan"
	self
		assert: zero + zero
		equals: zero.
	self
		assert: zero + one
		equals: one.
	self
		assert: zero + two
		equals: two.
	self
		assert: one + zero
		equals: one.
	self
		assert: one + one
		equals: two.
	self
		assert: one + two
		equals: (EnteroTrait with: 3).
	self
		assert: two + zero
		equals: two.
	self
		assert: two + one
		equals: (EnteroTrait with: 3).
	self
		assert: two + two
		equals: four.! !

!NumeroTest class methodsFor: 'tests' stamp: 'HAW 9/13/2017 14:26:34'!
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

!NumeroTest class methodsFor: 'tests' stamp: 'HAW 9/13/2017 14:26:34'!
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

!NumeroTest class methodsFor: 'tests' stamp: 'HAW 9/13/2017 19:19:27'!
test08FraccionAddsWithFraccionCorrectly
	"
    La suma de fracciones es:
	 
	a/b + c/d = (a.d + c.b) / (b.d)
	 
	SI ESTAN PENSANDO EN LA REDUCCION DE FRACCIONES NO SE PREOCUPEN!!
	TODAVIA NO SE ESTA TESTEANDO ESE CASO
"
	| sevenTenths |
	sevenTenths _ (EnteroTrait with: 7) / (EnteroTrait with: 10).
	self
		assert: oneFifth + oneHalf
		equals: sevenTenths.! !

!NumeroTest class methodsFor: 'tests' stamp: 'HAW 9/13/2017 14:26:34'!
test09FraccionMultipliesWithFraccionCorrectly
"
    La multiplicacion de fracciones es:
	 
	(a/b) * (c/d) = (a.c) / (b.d)
"

	self assert: oneFifth * twoFifth equals: twoTwentyfifth! !

!NumeroTest class methodsFor: 'tests' stamp: 'HAW 9/13/2017 14:26:34'!
test10FraccionDividesFraccionCorrectly
"
    La division de fracciones es:
	 
	(a/b) / (c/d) = (a.d) / (b.c)
"

	self assert: oneHalf / oneFifth equals: fiveHalfs! !

!NumeroTest class methodsFor: 'tests' stamp: 'HAW 9/13/2017 19:19:27'!
test11EnteroAddsFraccionCorrectly
	"Ahora empieza la diversion!!

	Lo correcto seria hacer un test por cada uno de estos asserts ya que son casos distintos.
	Lo hago todo aca para no modificar mucho la estructura del test suite - Hernan"
	self
		assert: zero + oneFifth
		equals: oneFifth.
	self
		assert: one + oneFifth
		equals: (EnteroTrait with: 6) / five.
	self
		assert: two + oneFifth
		equals: (EnteroTrait with: 11) / five.! !

!NumeroTest class methodsFor: 'tests' stamp: 'HAW 9/13/2017 19:19:27'!
test12FraccionAddsEnteroCorrectly
	"Lo correcto seria hacer un test por cada uno de estos asserts ya que son casos distintos.
	Lo hago todo aca para no modificar mucho la estructura del test suite - Hernan"
	self
		assert: oneFifth + zero
		equals: oneFifth.
	self
		assert: oneFifth + one
		equals: (EnteroTrait with: 6) / five.
	self
		assert: oneFifth + two
		equals: (EnteroTrait with: 11) / five.! !

!NumeroTest class methodsFor: 'tests' stamp: 'HAW 9/13/2017 14:26:34'!
test13EnteroMultipliesFraccionCorrectly
	
	"Lo correcto seria hacer un test por cada uno de estos asserts ya que son casos distintos.
	Lo hago todo aca para no modificar mucho la estructura del test suite - Hernan"

	self assert: zero * oneFifth equals: zero.
	self assert: one * oneFifth equals: oneFifth.
	self assert: two * oneFifth equals: twoFifth ! !

!NumeroTest class methodsFor: 'tests' stamp: 'HAW 9/13/2017 14:26:34'!
test14FraccionMultipliesEnteroCorrectly

	"Lo correcto seria hacer un test por cada uno de estos asserts ya que son casos distintos.
	Lo hago todo aca para no modificar mucho la estructura del test suite - Hernan"

	self assert: oneFifth * zero equals: zero.
	self assert: oneFifth * one  equals:  oneFifth.
	self assert: oneFifth * two equals: twoFifth ! !

!NumeroTest class methodsFor: 'tests' stamp: 'HAW 9/13/2017 19:19:27'!
test15EnteroDividesFraccionCorrectly
	"Lo correcto seria hacer un test por cada uno de estos asserts ya que son casos distintos.
	Lo hago todo aca para no modificar mucho la estructura del test suite - Hernan"
	self
		assert: zero / oneFifth
		equals: zero.
	self
		assert: one / oneFifth
		equals: five.
	self
		assert: two / oneFifth
		equals: (EnteroTrait with: 10).! !

!NumeroTest class methodsFor: 'tests' stamp: 'HAW 9/13/2017 19:19:27'!
test16FraccionDividesEnteroCorrectly
	"Lo correcto seria hacer un test por cada uno de estos asserts ya que son casos distintos.
	Lo hago todo aca para no modificar mucho la estructura del test suite - Hernan"
	self shouldRaiseDivideByZeroException: [ oneFifth / zero ].
	self
		assert: oneFifth / one
		equals: oneFifth.
	self
		assert: oneFifth / two
		equals: one / (EnteroTrait with: 10).! !

!NumeroTest class methodsFor: 'tests' stamp: 'HAW 9/13/2017 14:26:34'!
test17AFraccionCanBeEqualToAnEntero

	self assert: two equals: four / two! !

!NumeroTest class methodsFor: 'tests' stamp: 'HAW 9/13/2017 14:26:34'!
test18AparentFraccionesAreEqual

	self assert: oneHalf equals: two / four! !

!NumeroTest class methodsFor: 'tests' stamp: 'HAW 9/13/2017 14:26:34'!
test19AddingFraccionesCanReturnAnEntero

	self assert: oneHalf + oneHalf equals: one! !

!NumeroTest class methodsFor: 'tests' stamp: 'HAW 9/13/2017 14:26:34'!
test20MultiplyingFraccionesCanReturnAnEntero

	self assert: (two/five) * (five/two) equals: one! !

!NumeroTest class methodsFor: 'tests' stamp: 'HAW 9/13/2017 14:26:34'!
test21DividingFraccionesCanReturnAnEntero

	self assert: oneHalf / oneHalf equals: one! !

!NumeroTest class methodsFor: 'tests' stamp: 'HAW 9/13/2017 14:26:34'!
test22DividingEnterosCanReturnAFraccion

	self assert: two / four equals: oneHalf! !

!NumeroTest class methodsFor: 'tests' stamp: 'HAW 9/13/2017 14:26:34'!
test23CanNotDivideEnteroByZero

	"Este test ya no tiene sentido porque se esta verificando en los tests de division.
	Lo dejo solo para que se vea que ya no tiene sentido - Hernan
	self 
		should: [ one / zero ]
		raise: Error
		withExceptionDo: [ :anError | self assert: anError messageText equals: Numero canNotDivideByZeroErrorDescription ]
	"! !

!NumeroTest class methodsFor: 'tests' stamp: 'HAW 9/13/2017 14:26:34'!
test24CanNotDivideFraccionByZero

	"Este test ya no tiene sentido porque se esta verificando en los tests de division.
	Lo dejo solo para que se vea que ya no tiene sentido - Hernan
	self 
		should: [ oneHalf / zero ]
		raise: Error
		withExceptionDo: [ :anError | self assert: anError messageText equals: Numero canNotDivideByZeroErrorDescription ]
	"	! !

NumeroTest instVarNamed: 'zero' put: Cero!
NumeroTest instVarNamed: 'one' put: Uno!
NumeroTest instVarNamed: 'two' put: '2'!
NumeroTest instVarNamed: 'four' put: '4'!
NumeroTest instVarNamed: 'oneFifth' put: '1/5'!
NumeroTest instVarNamed: 'oneHalf' put: '1/2'!
NumeroTest instVarNamed: 'five' put: '5'!
NumeroTest instVarNamed: 'twoFifth' put: '2/5'!
NumeroTest instVarNamed: 'twoTwentyfifth' put: '2/25'!
NumeroTest instVarNamed: 'fiveHalfs' put: '5/2'!

!classDefinition: #NumeroTrait category: #'Numero-Prototipo-DDEnEntero'!
DenotativeObject subclass: #NumeroTrait
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numero-Prototipo-DDEnEntero'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'NumeroTrait class' category: #'Numero-Prototipo-DDEnEntero'!
NumeroTrait class
	instanceVariableNames: ''!

!NumeroTrait class methodsFor: 'arithmetic operations' stamp: 'HAW 9/13/2017 16:20:06'!
* aMultiplier

	self childResponsibility ! !

!NumeroTrait class methodsFor: 'arithmetic operations' stamp: 'HAW 9/13/2017 16:19:35'!
+ anAdder

	self childResponsibility ! !

!NumeroTrait class methodsFor: 'arithmetic operations' stamp: 'HAW 9/13/2017 16:19:39'!
/ aDivisor

	self childResponsibility ! !


!NumeroTrait class methodsFor: 'arithmetic operations - private' stamp: 'HAW 9/13/2017 19:45:46'!
addEntero: anAdder

	self childResponsibility ! !

!NumeroTrait class methodsFor: 'arithmetic operations - private' stamp: 'HAW 9/13/2017 16:21:34'!
addFraccion: anAdder

	self childResponsibility ! !

!NumeroTrait class methodsFor: 'arithmetic operations - private' stamp: 'HAW 9/13/2017 19:45:52'!
divideEntero: aDividend

	self childResponsibility ! !

!NumeroTrait class methodsFor: 'arithmetic operations - private' stamp: 'HAW 9/13/2017 16:22:11'!
divideFraccion: aDividend

	self childResponsibility ! !

!NumeroTrait class methodsFor: 'arithmetic operations - private' stamp: 'HAW 9/13/2017 19:46:03'!
multiplyEntero: aMultiplier

	self childResponsibility ! !

!NumeroTrait class methodsFor: 'arithmetic operations - private' stamp: 'HAW 9/13/2017 16:22:24'!
multiplyFraccion: aMultiplier

	self childResponsibility ! !


!classDefinition: #EnteroTrait category: #'Numero-Prototipo-DDEnEntero'!
NumeroTrait subclass: #EnteroTrait
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numero-Prototipo-DDEnEntero'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'EnteroTrait class' category: #'Numero-Prototipo-DDEnEntero'!
EnteroTrait class
	instanceVariableNames: ''!

!EnteroTrait class methodsFor: 'integer creation' stamp: 'HAW 9/13/2017 20:37:57'!
with: anIntegerValue

	anIntegerValue = 0 ifTrue: [ ^ Cero ].
	anIntegerValue = 1 ifTrue: [ ^ Uno ].

	^ MayorAUnoPrototype cloneWith: anIntegerValue.! !


!EnteroTrait class methodsFor: 'arithmetic operations' stamp: 'HAW 9/13/2017 19:35:14'!
* aMultiplier

	^aMultiplier multiplyEntero: self! !

!EnteroTrait class methodsFor: 'arithmetic operations' stamp: 'HAW 9/13/2017 19:34:56'!
+ anAdder

	^anAdder addEntero: self! !

!EnteroTrait class methodsFor: 'arithmetic operations' stamp: 'HAW 9/13/2017 19:35:40'!
/ aDivisor 
	
	^aDivisor divideEntero: self! !

!EnteroTrait class methodsFor: 'arithmetic operations' stamp: 'HAW 9/13/2017 14:44:52'!
// aDivisor 
	
	^self with: self integerValue // aDivisor integerValue
	! !

!EnteroTrait class methodsFor: 'arithmetic operations' stamp: 'HAW 9/13/2017 16:19:58'!
greatestCommonDivisorWith: anEntero 
	
	self childResponsibility ! !


!EnteroTrait class methodsFor: 'arithmetic operations - private' stamp: 'HAW 9/13/2017 16:19:55'!
asDenominatorOf: aNumerator

	self childResponsibility ! !


!EnteroTrait class methodsFor: 'value' stamp: 'HAW 9/13/2017 16:20:01'!
integerValue

	"Usamos integerValue en vez de value para que no haya problemas con el mensaje value implementado en Object - Hernan"
	
	self childResponsibility ! !


!EnteroTrait class methodsFor: 'assertions' stamp: 'HAW 9/13/2017 19:28:15'!
assertCanBeDenominator

	self childResponsibility ! !

!EnteroTrait class methodsFor: 'assertions' stamp: 'HAW 9/13/2017 19:28:21'!
assertCanBeNumerator

	self childResponsibility ! !


!classDefinition: #Cero category: #'Numero-Prototipo-DDEnEntero'!
EnteroTrait subclass: #Cero
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numero-Prototipo-DDEnEntero'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Cero class' category: #'Numero-Prototipo-DDEnEntero'!
Cero class
	instanceVariableNames: ''!

!Cero class methodsFor: 'arithmetic operations' stamp: 'HAW 9/13/2017 14:26:34'!
// aDivisor

	^self! !

!Cero class methodsFor: 'arithmetic operations' stamp: 'HAW 9/13/2017 14:26:34'!
greatestCommonDivisorWith: anEntero 
	
	^ anEntero ! !


!Cero class methodsFor: 'arithmetic operations - private' stamp: 'HAW 9/13/2017 19:37:30'!
addEntero: anAdder 
	
	^anAdder ! !

!Cero class methodsFor: 'arithmetic operations - private' stamp: 'HAW 9/13/2017 14:26:34'!
addFraccion: anAdder 
	
	^anAdder ! !

!Cero class methodsFor: 'arithmetic operations - private' stamp: 'HAW 9/13/2017 14:26:34'!
asDenominatorOf: aNumerator

	self signalCanNotDivideByZero ! !

!Cero class methodsFor: 'arithmetic operations - private' stamp: 'HAW 9/13/2017 19:38:04'!
divideEntero: aDividend

	self signalCanNotDivideByZero ! !

!Cero class methodsFor: 'arithmetic operations - private' stamp: 'HAW 9/13/2017 14:26:34'!
divideFraccion: aDividend

	self signalCanNotDivideByZero ! !

!Cero class methodsFor: 'arithmetic operations - private' stamp: 'HAW 9/13/2017 19:37:42'!
multiplyEntero: aMultiplier

	^self! !

!Cero class methodsFor: 'arithmetic operations - private' stamp: 'HAW 9/13/2017 14:26:34'!
multiplyFraccion: aMultiplier

	^self
	! !

!Cero class methodsFor: 'arithmetic operations - private' stamp: 'HAW 9/13/2017 14:53:05'!
signalCanNotDivideByZero
	
	self error: self canNotDivideByZeroErrorDescription ! !


!Cero class methodsFor: 'value' stamp: 'HAW 9/13/2017 14:26:34'!
integerValue

	^0! !



!Cero class methodsFor: 'error descriptions' stamp: 'HAW 9/13/2017 16:26:14'!
canNotDivideByZeroErrorDescription

	^'No se puede dividir por cero'! !


!Cero class methodsFor: 'assertions' stamp: 'HAW 9/13/2017 19:30:00'!
assertCanBeDenominator

	self error: self canNotDivideByZeroErrorDescription 
	! !

!Cero class methodsFor: 'assertions' stamp: 'HAW 9/13/2017 19:29:39'!
assertCanBeNumerator

	self error: 'una fraccion no puede ser cero' 
	! !


!Cero class methodsFor: 'printing' stamp: 'HAW 9/13/2017 19:49:44'!
printOn: aStream

	aStream print: 0! !


!classDefinition: #MayorAUnoPrototype category: #'Numero-Prototipo-DDEnEntero'!
EnteroTrait subclass: #MayorAUnoPrototype
	instanceVariableNames: 'value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numero-Prototipo-DDEnEntero'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MayorAUnoPrototype class' category: #'Numero-Prototipo-DDEnEntero'!
MayorAUnoPrototype class
	instanceVariableNames: 'value'!

!MayorAUnoPrototype class methodsFor: 'cloning' stamp: 'HAW 9/13/2017 19:22:07'!
cloneWith: anIntegerValue

	^ self originalSibling replicate initializeWith: anIntegerValue.! !

!MayorAUnoPrototype class methodsFor: 'cloning' stamp: 'HAW 9/13/2017 19:24:05'!
initializeWith: anIntegerValue

	(anIntegerValue isInteger and: [ anIntegerValue > 1]) ifFalse: [ self error: 'Solo se puede clonar con enteros mayores a uno' ].

	value _ anIntegerValue.! !


!MayorAUnoPrototype class methodsFor: 'arithmetic operations' stamp: 'HAW 9/13/2017 14:44:28'!
greatestCommonDivisorWith: anEntero 
	
	^self with: (value gcd: anEntero integerValue)! !


!MayorAUnoPrototype class methodsFor: 'arithmetic operations - private' stamp: 'HAW 9/13/2017 19:40:01'!
addEntero: anAdder

	^ EnteroTrait with: value + anAdder integerValue.! !

!MayorAUnoPrototype class methodsFor: 'arithmetic operations - private' stamp: 'HAW 9/13/2017 14:26:34'!
addFraccion: anAdder

	^self + anAdder 
	! !

!MayorAUnoPrototype class methodsFor: 'arithmetic operations - private' stamp: 'HAW 9/13/2017 19:25:51'!
asDenominatorOf: aNumerator
	^ FraccionPrototype
		cloneWith: aNumerator
		over: self.! !

!MayorAUnoPrototype class methodsFor: 'arithmetic operations - private' stamp: 'HAW 9/13/2017 19:40:57'!
divideEntero: aDividend 
	
	| denominator greatestCommonDivisor numerator |
	
	greatestCommonDivisor := aDividend greatestCommonDivisorWith: self. 
	numerator := aDividend // greatestCommonDivisor.
	denominator := self // greatestCommonDivisor.
	
	^denominator asDenominatorOf: numerator	! !

!MayorAUnoPrototype class methodsFor: 'arithmetic operations - private' stamp: 'HAW 9/13/2017 14:26:34'!
divideFraccion: aDividend

	^aDividend numerator / (aDividend denominator * self) ! !

!MayorAUnoPrototype class methodsFor: 'arithmetic operations - private' stamp: 'HAW 9/13/2017 19:44:34'!
multiplyEntero: aMultiplier

	^ EnteroTrait with: value * aMultiplier integerValue.! !

!MayorAUnoPrototype class methodsFor: 'arithmetic operations - private' stamp: 'HAW 9/13/2017 14:26:34'!
multiplyFraccion: aMultiplier

	^self * aMultiplier ! !


!MayorAUnoPrototype class methodsFor: 'comparing' stamp: 'HAW 9/13/2017 14:26:34'!
hash

	^value hash! !

!MayorAUnoPrototype class methodsFor: 'comparing' stamp: 'HAW 9/13/2017 19:24:19'!
isEqualTo: anObject

	^(anObject isSiblingOf: self) and: [ value isEqualTo: anObject integerValue ]! !


!MayorAUnoPrototype class methodsFor: 'value' stamp: 'HAW 9/13/2017 14:26:34'!
integerValue
	
	^value! !



!MayorAUnoPrototype class methodsFor: 'assertions' stamp: 'HAW 9/13/2017 19:30:33'!
assertCanBeDenominator! !

!MayorAUnoPrototype class methodsFor: 'assertions' stamp: 'HAW 9/13/2017 19:30:37'!
assertCanBeNumerator! !


!MayorAUnoPrototype class methodsFor: 'printing' stamp: 'HAW 9/13/2017 19:47:21'!
printOn: aStream

	aStream print: value ! !

MayorAUnoPrototype instVarNamed: 'value' put: nil!

!classDefinition: #Uno category: #'Numero-Prototipo-DDEnEntero'!
EnteroTrait subclass: #Uno
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numero-Prototipo-DDEnEntero'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Uno class' category: #'Numero-Prototipo-DDEnEntero'!
Uno class
	instanceVariableNames: ''!

!Uno class methodsFor: 'arithmetic operations' stamp: 'HAW 9/13/2017 14:26:34'!
greatestCommonDivisorWith: anEntero 
	
	^self 
	! !


!Uno class methodsFor: 'arithmetic operations - private' stamp: 'HAW 9/13/2017 19:39:00'!
addEntero: anAdder

	^ EnteroTrait with: self integerValue + anAdder integerValue.! !

!Uno class methodsFor: 'arithmetic operations - private' stamp: 'HAW 9/13/2017 14:26:34'!
addFraccion: anAdder

	^ anAdder denominator + anAdder numerator / anAdder denominator ! !

!Uno class methodsFor: 'arithmetic operations - private' stamp: 'HAW 9/13/2017 14:26:34'!
asDenominatorOf: aNumerator

	^aNumerator ! !

!Uno class methodsFor: 'arithmetic operations - private' stamp: 'HAW 9/13/2017 19:39:20'!
divideEntero: aDividend

	^aDividend ! !

!Uno class methodsFor: 'arithmetic operations - private' stamp: 'HAW 9/13/2017 14:26:34'!
divideFraccion: aDividend

	^aDividend ! !

!Uno class methodsFor: 'arithmetic operations - private' stamp: 'HAW 9/13/2017 19:39:31'!
multiplyEntero: aMultiplier

	^aMultiplier ! !

!Uno class methodsFor: 'arithmetic operations - private' stamp: 'HAW 9/13/2017 14:26:34'!
multiplyFraccion: aMultiplier

	^aMultiplier ! !


!Uno class methodsFor: 'value' stamp: 'HAW 9/13/2017 14:26:34'!
integerValue

	^1! !



!Uno class methodsFor: 'assertions' stamp: 'HAW 9/13/2017 19:31:08'!
assertCanBeDenominator

	self error: 'una fraccion no puede tener denominador 1 porque sino es un entero' ! !

!Uno class methodsFor: 'assertions' stamp: 'HAW 9/13/2017 19:31:13'!
assertCanBeNumerator! !


!Uno class methodsFor: 'printing' stamp: 'HAW 9/13/2017 19:49:55'!
printOn: aStream

	aStream print: 1! !


!classDefinition: #FraccionPrototype category: #'Numero-Prototipo-DDEnEntero'!
NumeroTrait subclass: #FraccionPrototype
	instanceVariableNames: 'numerator denominator'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numero-Prototipo-DDEnEntero'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'FraccionPrototype class' category: #'Numero-Prototipo-DDEnEntero'!
FraccionPrototype class
	instanceVariableNames: 'numerator denominator'!

!FraccionPrototype class methodsFor: 'cloning' stamp: 'HAW 9/13/2017 19:26:09'!
cloneWith: aNumerator over: aDenominator
	^ self originalSibling replicate
		initializeWith: aNumerator
		over: aDenominator.! !

!FraccionPrototype class methodsFor: 'cloning' stamp: 'HAW 9/13/2017 19:32:38'!
initializeWith: aNumerator over: aDenominator

	aNumerator assertCanBeNumerator.
	aDenominator assertCanBeDenominator.
	
	numerator _ aNumerator.
	denominator _ aDenominator.! !


!FraccionPrototype class methodsFor: 'arithmetic operations' stamp: 'HAW 9/13/2017 14:26:34'!
* aMultiplier 
	
	^aMultiplier multiplyFraccion: self! !

!FraccionPrototype class methodsFor: 'arithmetic operations' stamp: 'HAW 9/13/2017 14:26:34'!
+ anAdder 
	
	^anAdder addFraccion: self! !

!FraccionPrototype class methodsFor: 'arithmetic operations' stamp: 'HAW 9/13/2017 14:26:34'!
/ aDivisor 
	
	^aDivisor divideFraccion: self! !


!FraccionPrototype class methodsFor: 'arithmetic operations - private' stamp: 'HAW 9/13/2017 19:42:20'!
addEntero: anAdder

	^anAdder * denominator + numerator / denominator ! !

!FraccionPrototype class methodsFor: 'arithmetic operations - private' stamp: 'HAW 9/13/2017 14:26:34'!
addFraccion: anAdder

	| newNumerator newDenominator |
	
	newNumerator := (numerator * anAdder denominator) + (denominator * anAdder numerator).
	newDenominator := denominator * anAdder denominator.
	
	^newNumerator / newDenominator 
! !

!FraccionPrototype class methodsFor: 'arithmetic operations - private' stamp: 'HAW 9/13/2017 19:43:18'!
divideEntero: aDividend

	^aDividend * denominator / numerator ! !

!FraccionPrototype class methodsFor: 'arithmetic operations - private' stamp: 'HAW 9/13/2017 14:26:34'!
divideFraccion: aDividend

	^(aDividend numerator * denominator) / (aDividend denominator * numerator)
	! !

!FraccionPrototype class methodsFor: 'arithmetic operations - private' stamp: 'HAW 9/13/2017 19:43:34'!
multiplyEntero: aMultiplier

	^numerator * aMultiplier / denominator ! !

!FraccionPrototype class methodsFor: 'arithmetic operations - private' stamp: 'HAW 9/13/2017 14:26:34'!
multiplyFraccion: aMultiplier

	^(numerator * aMultiplier numerator) / (denominator * aMultiplier denominator)
	! !


!FraccionPrototype class methodsFor: 'accessing' stamp: 'HAW 9/13/2017 14:26:34'!
denominator

	^ denominator! !

!FraccionPrototype class methodsFor: 'accessing' stamp: 'HAW 9/13/2017 14:26:34'!
numerator

	^ numerator! !


!FraccionPrototype class methodsFor: 'comparing' stamp: 'HAW 9/13/2017 14:26:34'!
hash

	^(numerator hash / denominator hash) hash! !

!FraccionPrototype class methodsFor: 'comparing' stamp: 'HAW 9/13/2017 19:33:26'!
isEqualTo: anObject

	^(anObject isSiblingOf: self) and: [ (numerator * anObject denominator) isEqualTo: (denominator * anObject numerator) ]! !



!FraccionPrototype class methodsFor: 'printing' stamp: 'HAW 9/13/2017 19:46:55'!
printOn: aStream

	aStream 
		print: numerator;
		nextPut: $/;
		print: denominator ! !

FraccionPrototype instVarNamed: 'numerator' put: nil!
FraccionPrototype instVarNamed: 'denominator' put: nil!