!classDefinition: #NumeroTest category: #'Numero-Solution-3'!
TestCase subclass: #NumeroTest
	instanceVariableNames: 'zero one two four oneFifth oneHalf five twoFifth twoTwentyfifth fiveHalfs'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numero-Solution-3'!

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


!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 20:11'!
test01isCeroReturnsTrueWhenAskToZero

	self assert: zero isZero! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 20:12'!
test02isCeroReturnsFalseWhenAskToOthersButZero

	self deny: one isZero! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 20:13'!
test03isOneReturnsTrueWhenAskToOne

	self assert: one isOne! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 20:13'!
test04isOneReturnsFalseWhenAskToOtherThanOne

	self deny: zero isOne! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 20:14'!
test05EnteroAddsWithEnteroCorrectly

	self assert: one + one equals: two! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 20:18'!
test06EnteroMultipliesWithEnteroCorrectly

	self assert: two * two equals: four! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 20:20'!
test07EnteroDividesEnteroCorrectly

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

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 21:07'!
test11EnteroAddsFraccionCorrectly
"
	Ahora empieza la diversion!!
"

	self assert: one + oneFifth equals: (Entero with: 6) / (Entero with: 5)! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 21:07'!
test12FraccionAddsEnteroCorrectly

	self assert: oneFifth + one equals: (Entero with: 6) / (Entero with: 5)! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 21:50'!
test13EnteroMultipliesFraccionCorrectly

	self assert: two * oneFifth equals: twoFifth ! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 21:52'!
test14FraccionMultipliesEnteroCorrectly

	self assert: oneFifth * two equals: twoFifth ! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 21:57'!
test15EnteroDividesFraccionCorrectly

	self assert: one / twoFifth equals: fiveHalfs  ! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 21:59'!
test16FraccionDividesEnteroCorrectly

	self assert: twoFifth / five equals: twoTwentyfifth ! !

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

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 22:46'!
test23CanNotDivideEnteroByZero

	self 
		should: [ one / zero ]
		raise: Error
		withExceptionDo: [ :anError | self assert: anError messageText equals: Numero canNotDivideByZeroErrorDescription ]
	! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 22:46'!
test24CanNotDivideFraccionByZero

	self 
		should: [ oneHalf / zero ]
		raise: Error
		withExceptionDo: [ :anError | self assert: anError messageText equals: Numero canNotDivideByZeroErrorDescription ]
	! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 22:50'!
test25AFraccionCanNotBeZero

	self deny: oneHalf isZero! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 22:50'!
test26AFraccionCanNotBeOne

	self deny: oneHalf isOne! !

!NumeroTest methodsFor: 'tests' stamp: 'HAW 5/3/2017 19:24:12'!
test27ZeroDivideAnythingIsZero

	self assert: zero / one equals: zero! !


!classDefinition: #Numero category: #'Numero-Solution-3'!
Object subclass: #Numero
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numero-Solution-3'!

!Numero methodsFor: 'arithmetic operations' stamp: 'HernanWilkinson 5/7/2016 22:48'!
* aMultiplier

	self subclassResponsibility ! !

!Numero methodsFor: 'arithmetic operations' stamp: 'HernanWilkinson 5/7/2016 22:49'!
+ anAdder

	self subclassResponsibility ! !

!Numero methodsFor: 'arithmetic operations' stamp: 'HernanWilkinson 5/7/2016 22:49'!
/ aDivisor

	self subclassResponsibility ! !


!Numero methodsFor: 'arithmetic operations - private' stamp: 'HernanWilkinson 5/7/2016 23:09'!
addEntero: anAdder

	self subclassResponsibility ! !

!Numero methodsFor: 'arithmetic operations - private' stamp: 'HernanWilkinson 5/7/2016 23:09'!
addFraccion: anAdder

	self subclassResponsibility ! !

!Numero methodsFor: 'arithmetic operations - private' stamp: 'HernanWilkinson 5/7/2016 23:10'!
divideEntero: aDividend

	self subclassResponsibility ! !

!Numero methodsFor: 'arithmetic operations - private' stamp: 'HernanWilkinson 5/7/2016 23:10'!
divideFraccion: aDividend

	self subclassResponsibility ! !

!Numero methodsFor: 'arithmetic operations - private' stamp: 'HernanWilkinson 5/7/2016 23:09'!
multiplyEntero: aMultiplier

	self subclassResponsibility ! !

!Numero methodsFor: 'arithmetic operations - private' stamp: 'HernanWilkinson 5/7/2016 23:09'!
multiplyFraccion: aMultiplier

	self subclassResponsibility ! !


!Numero methodsFor: 'testing' stamp: 'HAW 5/3/2017 18:30:07'!
isOne

	^false! !

!Numero methodsFor: 'testing' stamp: 'HAW 5/3/2017 18:30:13'!
isZero

	^false! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Numero class' category: #'Numero-Solution-3'!
Numero class
	instanceVariableNames: ''!

!Numero class methodsFor: 'error descriptions' stamp: 'HernanWilkinson 5/7/2016 22:45'!
canNotDivideByZeroErrorDescription

	^'No se puede dividir por cero'! !


!classDefinition: #Entero category: #'Numero-Solution-3'!
Numero subclass: #Entero
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numero-Solution-3'!

!Entero methodsFor: 'arithmetic operations' stamp: 'HernanWilkinson 5/7/2016 22:59'!
* aMultiplier 
	
	^aMultiplier multiplyEntero: self ! !

!Entero methodsFor: 'arithmetic operations' stamp: 'HernanWilkinson 5/7/2016 22:56'!
+ anAdder 
	
	^anAdder addEntero: self.
	! !

!Entero methodsFor: 'arithmetic operations' stamp: 'HernanWilkinson 5/7/2016 23:01'!
/ aDivisor 
	
	^aDivisor divideEntero: self! !

!Entero methodsFor: 'arithmetic operations' stamp: 'HAW 5/3/2017 18:23:59'!
// aDivisor 
	
	^self class with: self integerValue // aDivisor integerValue! !

!Entero methodsFor: 'arithmetic operations' stamp: 'HAW 5/3/2017 18:24:07'!
greatestCommonDivisorWith: anEntero 
	
	^self class with: (self integerValue gcd: anEntero integerValue)! !


!Entero methodsFor: 'arithmetic operations - private' stamp: 'HAW 5/3/2017 18:24:43'!
addEntero: anAdder 
	
	^self class with: self integerValue + anAdder integerValue
! !

!Entero methodsFor: 'arithmetic operations - private' stamp: 'HernanWilkinson 5/7/2016 23:06'!
addFraccion: anAdder

	^self + anAdder 
	! !

!Entero methodsFor: 'arithmetic operations - private' stamp: 'HAW 5/3/2017 19:31:24'!
asDenominatorOf: aNumerator

	^Fraccion safeWith: aNumerator over: self
! !

!Entero methodsFor: 'arithmetic operations - private' stamp: 'HAW 5/3/2017 19:37:54'!
divideEntero: aDividend

	^aDividend over: self! !

!Entero methodsFor: 'arithmetic operations - private' stamp: 'HernanWilkinson 5/7/2016 23:08'!
divideFraccion: aDividend

	^aDividend numerator / (aDividend denominator * self) ! !

!Entero methodsFor: 'arithmetic operations - private' stamp: 'HAW 5/3/2017 18:24:55'!
multiplyEntero: aMultiplier

	^self class with: self integerValue * aMultiplier integerValue ! !

!Entero methodsFor: 'arithmetic operations - private' stamp: 'HernanWilkinson 5/7/2016 23:04'!
multiplyFraccion: aMultiplier

	^self * aMultiplier ! !

!Entero methodsFor: 'arithmetic operations - private' stamp: 'HAW 5/3/2017 19:36:21'!
over: aDivisor
	
	| denominator greatestCommonDivisor numerator |
	
	greatestCommonDivisor := self greatestCommonDivisorWith: aDivisor. 
	numerator := self // greatestCommonDivisor.
	denominator := aDivisor // greatestCommonDivisor.
	
	^denominator asDenominatorOf: numerator	! !


!Entero methodsFor: 'value' stamp: 'HAW 5/3/2017 18:25:39'!
integerValue

	"Usamos integerValue en vez de value para que no haya problemas con el mensaje value implementado en Object - Hernan"
	
	self subclassResponsibility ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Entero class' category: #'Numero-Solution-3'!
Entero class
	instanceVariableNames: ''!

!Entero class methodsFor: 'instance creation' stamp: 'HAW 5/3/2017 19:39:57'!
with: aValue 
	
	"Esta verificacion esta puesta por si se equivocan y quieren crear un Entero pasando otra cosa que un Integer - Hernan"
	aValue isInteger ifFalse: [  self error: 'aValue debe ser anInteger' ].
	
	"Estos ifs no se pueden evitar ya que son los que diferencian la clase a utilizar... si estuvieramos implementando un lenguaje estarian
	en la VM. 
	Notar la implementacion de #new en Cero y Uno, ¿que hace? - Hernan"
	aValue = 0 ifTrue: [ ^Cero new ].
	aValue = 1 ifTrue: [ ^Uno new ].
	
	^EnteroMenosCeroYUno new initalizeWith: aValue! !


!classDefinition: #Cero category: #'Numero-Solution-3'!
Entero subclass: #Cero
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numero-Solution-3'!

!Cero methodsFor: 'value' stamp: 'HAW 5/3/2017 18:25:48'!
integerValue

	^0! !


!Cero methodsFor: 'testing' stamp: 'HAW 5/3/2017 18:30:34'!
isZero

	^true! !


!Cero methodsFor: 'arithmetic operations - private' stamp: 'HAW 5/3/2017 19:34:25'!
divideEntero: aDividend

	self error: self class canNotDivideByZeroErrorDescription
	! !

!Cero methodsFor: 'arithmetic operations - private' stamp: 'HAW 5/3/2017 19:36:27'!
over: aDividend

	^self! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Cero class' category: #'Numero-Solution-3'!
Cero class
	instanceVariableNames: 'uniqueInstance'!

!Cero class methodsFor: 'initialization' stamp: 'HAW 5/3/2017 18:27:46'!
initialize

	uniqueInstance := self basicNew ! !


!Cero class methodsFor: 'instance creation' stamp: 'HAW 5/3/2017 18:27:26'!
new

	^uniqueInstance! !


!classDefinition: #EnteroMenosCeroYUno category: #'Numero-Solution-3'!
Entero subclass: #EnteroMenosCeroYUno
	instanceVariableNames: 'value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numero-Solution-3'!

!EnteroMenosCeroYUno methodsFor: 'initialization' stamp: 'HAW 5/3/2017 18:25:23'!
initalizeWith: aValue 
	
	value := aValue! !


!EnteroMenosCeroYUno methodsFor: 'comparing' stamp: 'HAW 5/3/2017 18:31:02'!
= anObject

	^(anObject isKindOf: self class) and: [ value = anObject integerValue ]! !

!EnteroMenosCeroYUno methodsFor: 'comparing' stamp: 'HAW 5/3/2017 18:31:08'!
hash

	^value hash! !


!EnteroMenosCeroYUno methodsFor: 'value' stamp: 'HAW 5/3/2017 18:26:02'!
integerValue

	^value ! !


!classDefinition: #Uno category: #'Numero-Solution-3'!
Entero subclass: #Uno
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numero-Solution-3'!

!Uno methodsFor: 'value' stamp: 'HAW 5/3/2017 18:26:09'!
integerValue

	^1! !


!Uno methodsFor: 'testing' stamp: 'HAW 5/3/2017 18:30:41'!
isOne

	^true! !


!Uno methodsFor: 'arithmetic operations - private' stamp: 'HAW 5/3/2017 19:28:26'!
asDenominatorOf: aNumerator

	^aNumerator ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Uno class' category: #'Numero-Solution-3'!
Uno class
	instanceVariableNames: 'uniqueInstance'!

!Uno class methodsFor: 'initialization' stamp: 'HAW 5/3/2017 18:29:22'!
initialize

	uniqueInstance := self basicNew ! !


!Uno class methodsFor: 'instance creation' stamp: 'HAW 5/3/2017 18:28:02'!
new

	^uniqueInstance! !


!classDefinition: #Fraccion category: #'Numero-Solution-3'!
Numero subclass: #Fraccion
	instanceVariableNames: 'numerator denominator'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numero-Solution-3'!

!Fraccion methodsFor: 'initialization' stamp: 'HAW 5/3/2017 19:32:45'!
initializeSafeWith: aNumerator over: aDenominator

	"Estas precondiciones estan por si se comenten errores en la implementacion - Hernan"
	aNumerator isZero ifTrue: [ self error: 'una fraccion no puede ser cero' ].
	aDenominator isOne ifTrue: [ self error: 'una fraccion no puede tener denominador 1 porque sino es un entero' ].
	
	numerator := aNumerator.
	denominator := aDenominator ! !


!Fraccion methodsFor: 'accessing' stamp: 'HernanWilkinson 5/7/2016 21:56'!
denominator

	^ denominator! !

!Fraccion methodsFor: 'accessing' stamp: 'HernanWilkinson 5/7/2016 21:56'!
numerator

	^ numerator! !


!Fraccion methodsFor: 'arithmetic operations' stamp: 'HernanWilkinson 5/7/2016 23:03'!
* aMultiplier 
	
	^aMultiplier multiplyFraccion: self! !

!Fraccion methodsFor: 'arithmetic operations' stamp: 'HernanWilkinson 5/7/2016 23:04'!
+ anAdder 
	
	^anAdder addFraccion: self! !

!Fraccion methodsFor: 'arithmetic operations' stamp: 'HernanWilkinson 5/7/2016 23:06'!
/ aDivisor 
	
	^aDivisor divideFraccion: self! !


!Fraccion methodsFor: 'arithmetic operations - private' stamp: 'HernanWilkinson 5/7/2016 22:58'!
addEntero: anAdder

	^anAdder * denominator + numerator / denominator ! !

!Fraccion methodsFor: 'arithmetic operations - private' stamp: 'HernanWilkinson 5/7/2016 23:05'!
addFraccion: anAdder

	| newNumerator newDenominator |
	
	newNumerator := (numerator * anAdder denominator) + (denominator * anAdder numerator).
	newDenominator := denominator * anAdder denominator.
	
	^newNumerator / newDenominator 
! !

!Fraccion methodsFor: 'arithmetic operations - private' stamp: 'HernanWilkinson 5/7/2016 23:02'!
divideEntero: aDividend

	^aDividend * denominator / numerator
	! !

!Fraccion methodsFor: 'arithmetic operations - private' stamp: 'HernanWilkinson 5/7/2016 23:07'!
divideFraccion: aDividend

	^(aDividend numerator * denominator) / (aDividend denominator * numerator)
	! !

!Fraccion methodsFor: 'arithmetic operations - private' stamp: 'HernanWilkinson 5/7/2016 23:01'!
multiplyEntero: aMultiplier

	^aMultiplier * numerator / denominator 
	! !

!Fraccion methodsFor: 'arithmetic operations - private' stamp: 'HernanWilkinson 5/7/2016 23:03'!
multiplyFraccion: aMultiplier

	^(numerator * aMultiplier numerator) / (denominator * aMultiplier denominator)
	! !


!Fraccion methodsFor: 'comparing' stamp: 'HernanWilkinson 5/7/2016 20:42'!
= anObject

	^(anObject isKindOf: self class) and: [ (numerator * anObject denominator) = (denominator * anObject numerator) ]! !

!Fraccion methodsFor: 'comparing' stamp: 'HernanWilkinson 5/7/2016 20:50'!
hash

	^(numerator hash / denominator hash) hash! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Fraccion class' category: #'Numero-Solution-3'!
Fraccion class
	instanceVariableNames: ''!

!Fraccion class methodsFor: 'intance creation - private' stamp: 'HAW 5/3/2017 19:32:27'!
safeWith: aDividend over: aDivisor

	"Solo para ser enviado desde los objetos de la jerarquia ya que se asume que aDividend no es 0 y aDivisor no ni 0 ni 1 - Hernan"
	
	^self new initializeSafeWith: aDividend over: aDivisor ! !

Cero initialize!
Uno initialize!