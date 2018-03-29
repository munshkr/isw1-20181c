!classDefinition: #I category: #'Quinta Actividad'!
DenotativeObject subclass: #I
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Quinta Actividad'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'I class' category: #'Quinta Actividad'!
I class
	instanceVariableNames: ''!

!I class methodsFor: 'as yet unclassified' stamp: 'DS 3/22/2018 21:05:30'!
+ unNumeroDePeano

	^unNumeroDePeano next! !

!I class methodsFor: 'as yet unclassified' stamp: 'DS 3/29/2018 10:13:05'!
- unNumeroDePeano

	self error: 'Al número uno no se le puede restar'! !

!I class methodsFor: 'as yet unclassified' stamp: 'DS 3/22/2018 21:00:44'!
next

	^II! !

!I class methodsFor: 'as yet unclassified' stamp: 'DS 3/22/2018 21:03:44'!
previous

	self error: 'El número uno no tiene previo'! !

!I class methodsFor: 'as yet unclassified' stamp: 'DS 3/29/2018 11:31:06'!
reverseSubstraction: unNumeroDePeano
	^ unNumeroDePeano previous.! !


!classDefinition: #II category: #'Quinta Actividad'!
DenotativeObject subclass: #II
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Quinta Actividad'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'II class' category: #'Quinta Actividad'!
II class
	instanceVariableNames: 'next previous'!

!II class methodsFor: 'as yet unclassified' stamp: 'DS 3/22/2018 21:09:12'!
+ unNumeroDePeano

	^self previous + unNumeroDePeano next! !

!II class methodsFor: 'as yet unclassified' stamp: 'DS 3/29/2018 11:31:06'!
- unNumeroDePeano
	^ unNumeroDePeano reverseSubstraction: self.! !

!II class methodsFor: 'as yet unclassified' stamp: 'DS 3/22/2018 21:23:49'!
next

	next ifNil:
	[
		next := self cloneNamed: (self name, 'I').
		next previous: self
	].
	^next.! !

!II class methodsFor: 'as yet unclassified' stamp: 'DS 3/26/2018 20:53:01'!
next: aNumber
	next := aNumber! !

!II class methodsFor: 'as yet unclassified' stamp: 'DS 3/29/2018 09:54:43'!
previous

	^previous! !

!II class methodsFor: 'as yet unclassified' stamp: 'DS 3/22/2018 21:20:54'!
previous: unNumeroDePeano

	previous := unNumeroDePeano! !

!II class methodsFor: 'as yet unclassified' stamp: 'DS 3/26/2018 20:50:54'!
removeAllNext
	next ifNotNil:
	[
		next removeAllNext.
		next removeFromSystem.
		next := nil.
	]! !

!II class methodsFor: 'as yet unclassified' stamp: 'DS 3/29/2018 11:31:06'!
reverseSubstraction: unNumeroDePeano
	^ self previous reverseSubstraction: unNumeroDePeano previous.! !

II instVarNamed: 'next' put: III!
II instVarNamed: 'previous' put: I!

!classDefinition: #III category: #'Quinta Actividad'!
DenotativeObject subclass: #III
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Quinta Actividad'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'III class' category: #'Quinta Actividad'!
III class
	instanceVariableNames: 'next previous'!

!III class methodsFor: 'as yet unclassified' stamp: 'DS 3/29/2018 11:34:06'!
+ unNumeroDePeano

	^self previous + unNumeroDePeano next! !

!III class methodsFor: 'as yet unclassified' stamp: 'DS 3/29/2018 11:34:06'!
- unNumeroDePeano
	^ unNumeroDePeano reverseSubstraction: self.! !

!III class methodsFor: 'as yet unclassified' stamp: 'DS 3/29/2018 11:34:06'!
next

	next ifNil:
	[
		next := self cloneNamed: (self name, 'I').
		next previous: self
	].
	^next.! !

!III class methodsFor: 'as yet unclassified' stamp: 'DS 3/29/2018 11:34:06'!
next: aNumber
	next := aNumber! !

!III class methodsFor: 'as yet unclassified' stamp: 'DS 3/29/2018 11:34:06'!
previous

	^previous! !

!III class methodsFor: 'as yet unclassified' stamp: 'DS 3/29/2018 11:34:06'!
previous: unNumeroDePeano

	previous := unNumeroDePeano! !

!III class methodsFor: 'as yet unclassified' stamp: 'DS 3/29/2018 11:34:06'!
removeAllNext
	next ifNotNil:
	[
		next removeAllNext.
		next removeFromSystem.
		next := nil.
	]! !

!III class methodsFor: 'as yet unclassified' stamp: 'DS 3/29/2018 11:34:06'!
reverseSubstraction: unNumeroDePeano
	^ self previous reverseSubstraction: unNumeroDePeano previous.! !

III instVarNamed: 'next' put: IIII!
III instVarNamed: 'previous' put: II!

!classDefinition: #IIII category: #'Quinta Actividad'!
DenotativeObject subclass: #IIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Quinta Actividad'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'IIII class' category: #'Quinta Actividad'!
IIII class
	instanceVariableNames: 'next previous'!

!IIII class methodsFor: 'as yet unclassified' stamp: 'DS 3/29/2018 11:34:06'!
+ unNumeroDePeano

	^self previous + unNumeroDePeano next! !

!IIII class methodsFor: 'as yet unclassified' stamp: 'DS 3/29/2018 11:34:06'!
- unNumeroDePeano
	^ unNumeroDePeano reverseSubstraction: self.! !

!IIII class methodsFor: 'as yet unclassified' stamp: 'DS 3/29/2018 11:34:06'!
next

	next ifNil:
	[
		next := self cloneNamed: (self name, 'I').
		next previous: self
	].
	^next.! !

!IIII class methodsFor: 'as yet unclassified' stamp: 'DS 3/29/2018 11:34:06'!
next: aNumber
	next := aNumber! !

!IIII class methodsFor: 'as yet unclassified' stamp: 'DS 3/29/2018 11:34:06'!
previous

	^previous! !

!IIII class methodsFor: 'as yet unclassified' stamp: 'DS 3/29/2018 11:34:06'!
previous: unNumeroDePeano

	previous := unNumeroDePeano! !

!IIII class methodsFor: 'as yet unclassified' stamp: 'DS 3/29/2018 11:34:06'!
removeAllNext
	next ifNotNil:
	[
		next removeAllNext.
		next removeFromSystem.
		next := nil.
	]! !

!IIII class methodsFor: 'as yet unclassified' stamp: 'DS 3/29/2018 11:34:06'!
reverseSubstraction: unNumeroDePeano
	^ self previous reverseSubstraction: unNumeroDePeano previous.! !

IIII instVarNamed: 'next' put: nil!
IIII instVarNamed: 'previous' put: III!