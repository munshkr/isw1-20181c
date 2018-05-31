!classDefinition: #TicTacToeTest category: #TicTacToe!
TestCase subclass: #TicTacToeTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TicTacToe'!

!TicTacToeTest methodsFor: 'as yet unclassified' stamp: 'HAW 10/24/2017 17:16:09'!
test01

	| game |
	game := TicTacToe new.
	
	self assert: game Xs isEmpty.
	self assert: game Os isEmpty! !

!TicTacToeTest methodsFor: 'as yet unclassified' stamp: 'HAW 10/24/2017 17:16:11'!
test02

	| game |
	
	game := TicTacToe new.
	
	game putXAt: 1@1.
	
	self assert: 1 equals: game Xs size.
	self assert: (game Xs includes: 1@1).	
	self assert: game Os isEmpty! !

!TicTacToeTest methodsFor: 'as yet unclassified' stamp: 'HAW 10/24/2017 17:16:15'!
test03

	| game |
	
	game := TicTacToe new.
	
	game putXAt: 1@1.
	game putOAt: 2@2.
	
	self assert: 1 equals: game Xs size.
	self assert: (game Xs includes: 1@1).	
	self assert: 1 equals: game Os size.
	self assert: (game Os includes: 2@2).	
! !

!TicTacToeTest methodsFor: 'as yet unclassified' stamp: 'HAW 10/24/2017 17:16:20'!
test04

	| game |
	
	game := TicTacToe new.
	
	game putXAt: 1@1.
	self 
		should: [ game putXAt: 2@2 ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: TicTacToe notXTurnErrorMessage equals: anError messageText.
			self assert: 1 equals: game Xs size.
			self assert: (game Xs includes: 1@1).	
			self assert: game Os isEmpty].
! !

!TicTacToeTest methodsFor: 'as yet unclassified' stamp: 'HAW 10/24/2017 17:16:26'!
test05

	| game |
	
	game := TicTacToe new.
	
	game putXAt: 1@1.
	game putOAt: 2@2.
	
	self 
		should: [ game putOAt: 3@3 ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: TicTacToe notOTurnErrorMessage equals: anError messageText.
			self assert: 1 equals: game Xs size.
			self assert: (game Xs includes: 1@1).	
			self assert: 1 equals: game Os size.
			self assert: (game Os includes: 2@2) ]! !

!TicTacToeTest methodsFor: 'as yet unclassified' stamp: 'HAW 10/24/2017 17:16:32'!
test06

	| game |
	
	game := TicTacToe new.
	
	game putXAt: 1@1.
	game putOAt: 2@2.
	
	self 
		should: [ game putXAt: 1@1 ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: TicTacToe positionTakenErrorMessage equals: anError messageText.
			self assert: 1 equals: game Xs size.
			self assert: (game Xs includes: 1@1).	
			self assert: 1 equals: game Os size.
			self assert: (game Os includes: 2@2) ]! !

!TicTacToeTest methodsFor: 'as yet unclassified' stamp: 'HAW 10/24/2017 17:16:37'!
test07

	| game |
	
	game := TicTacToe new.
	
	game putXAt: 1@1.
	game putOAt: 2@2.
	
	self 
		should: [ game putXAt: 2@2 ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: TicTacToe positionTakenErrorMessage equals: anError messageText.
			self assert: 1 equals: game Xs size.
			self assert: (game Xs includes: 1@1).	
			self assert: 1 equals: game Os size.
			self assert: (game Os includes: 2@2) ]! !

!TicTacToeTest methodsFor: 'as yet unclassified' stamp: 'HAW 10/24/2017 17:16:43'!
test08

	| game |
	
	game := TicTacToe new.
	
	game putXAt: 1@1.	
	
	self 
		should: [ game putOAt: 1@1.]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: TicTacToe positionTakenErrorMessage equals: anError messageText.
			self assert: 1 equals: game Xs size.
			self assert: (game Xs includes: 1@1).	
			self assert: game Os isEmpty ]! !

!TicTacToeTest methodsFor: 'as yet unclassified' stamp: 'HAW 10/24/2017 17:16:48'!
test09

	| game |
	
	game := TicTacToe new.
	
	game putXAt: 1@1.	
	game putOAt: 2@2.
	game putXAt: 3@3.
	
	self 
		should: [ game putOAt: 2@2.]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: TicTacToe positionTakenErrorMessage equals: anError messageText.
			self assert: 2 equals: game Xs size.
			self assert: (game Xs includes: 1@1).	
			self assert: (game Xs includes: 3@3).	
			self assert: 1 equals: game Os size.
			self assert: (game Os includes: 2@2) ].	
! !

!TicTacToeTest methodsFor: 'as yet unclassified' stamp: 'jg 5/19/2018 18:50:30'!
test10

	| game |
	
	game := TicTacToe new.
	
	game putXAt: 1@1.	
	game putOAt: 2@1.
	game putXAt: 1@2.
	game putOAt: 3@1.	

	self deny: game XHasWon.
	self deny: game OHasWon.! !

!TicTacToeTest methodsFor: 'as yet unclassified' stamp: 'jg 5/19/2018 18:50:46'!
test11

	| game |
	
	game := TicTacToe new.
	
	game putXAt: 1@1.	
	game putOAt: 2@1.
	game putXAt: 1@2.
	game putOAt: 3@1.	
	game putXAt: 1@3.

	self assert: game XHasWon.
	self deny: game OHasWon.! !

!TicTacToeTest methodsFor: 'as yet unclassified' stamp: 'jg 5/19/2018 18:50:54'!
test12

	| game |
	
	game := TicTacToe new.
	
	game putXAt: 2@1.	
	game putOAt: 1@1.
	game putXAt: 2@2.
	game putOAt: 3@1.	
	game putXAt: 2@3.

	self assert: game XHasWon.
	self deny: game OHasWon.! !

!TicTacToeTest methodsFor: 'as yet unclassified' stamp: 'jg 5/19/2018 18:51:01'!
test13

	| game |
	
	game := TicTacToe new.
	
	game putXAt: 3@1.	
	game putOAt: 1@1.
	game putXAt: 3@2.
	game putOAt: 2@1.	
	game putXAt: 3@3.

	self assert: game XHasWon.
	self deny: game OHasWon.! !

!TicTacToeTest methodsFor: 'as yet unclassified' stamp: 'jg 5/19/2018 18:51:09'!
test14

	| game |
	
	game := TicTacToe new.
	
	game putXAt: 1@1.	
	game putOAt: 2@2.
	game putXAt: 2@1.
	game putOAt: 3@3.	
	game putXAt: 3@1.

	self assert: game XHasWon.
	self deny: game OHasWon.! !

!TicTacToeTest methodsFor: 'as yet unclassified' stamp: 'jg 5/19/2018 18:51:16'!
test15

	| game |
	
	game := TicTacToe new.
	
	game putXAt: 1@1.	
	game putOAt: 1@2.
	game putXAt: 2@2.
	game putOAt: 1@3.	
	game putXAt: 3@3.

	self assert: game XHasWon.
	self deny: game OHasWon.! !

!TicTacToeTest methodsFor: 'as yet unclassified' stamp: 'jg 5/19/2018 18:51:24'!
test16

	| game |
	
	game := TicTacToe new.
	
	game putXAt: 1@3.	
	game putOAt: 1@2.
	game putXAt: 2@2.
	game putOAt: 2@1.	
	game putXAt: 3@1.

	self assert: game XHasWon.
	self deny: game OHasWon.! !

!TicTacToeTest methodsFor: 'as yet unclassified' stamp: 'jg 5/19/2018 18:51:31'!
test17

	| game |
	
	game := TicTacToe new.
	
	game putXAt: 2@1.	
	game putOAt: 1@1.
	game putXAt: 2@2.
	game putOAt: 1@2.	
	game putXAt: 3@1.
	game putOAt: 1@3.

	self deny: game XHasWon.
	self assert: game OHasWon.! !

!TicTacToeTest methodsFor: 'as yet unclassified' stamp: 'jg 5/28/2018 18:30:31'!
test18

	| game |
	
	game := TicTacToe new.
	
	game putXAt: 1@1.	
	game putOAt: 2@1.
	game putXAt: 1@2.
	game putOAt: 3@1.	
	game putXAt: 1@3.

	self 
		should: [ game putOAt: 2@2 ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: TicTacToe canNotPlayWhenGameIsOverErrorMessage equals: anError messageText.
			self assert: 2 equals: game Os size.
			self assert: (game Os includes: 2@1).
			self assert: (game Os includes: 3@1) ]
			
			! !

!TicTacToeTest methodsFor: 'as yet unclassified' stamp: 'HAW 10/24/2017 17:27:02'!
test19

	| game |
	
	game := TicTacToe new.
	
	game putXAt: 2@2.
	game putOAt: 1@1.	
	game putXAt: 2@1.
	game putOAt: 1@2.
	game putXAt: 3@1.	
	game putOAt: 1@3.

	self 
		should: [ game putXAt: 3@2 ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: TicTacToe canNotPlayWhenGameIsOverErrorMessage equals: anError messageText.
			self assert: 3 equals: game Xs size.
			self assert: (game Xs includes: 2@2).
			self assert: (game Xs includes: 2@1).
			self assert: (game Xs includes: 3@1) ]
			
			! !

!TicTacToeTest methodsFor: 'as yet unclassified' stamp: 'jg 5/19/2018 18:51:46'!
test20

	| game |
	
	game := TicTacToe new.
	
	game putXAt: 2@2.
	game putOAt: 1@1.	
	game putXAt: 1@3.
	game putOAt: 3@1.
	game putXAt: 2@1.	
	game putOAt: 2@3.
	game putXAt: 1@2.	
	game putOAt: 3@2.
	game putXAt: 3@3.
	
	self assert: game isOver.
	self deny: game XHasWon. 
	self deny: game OHasWon. 
	self assert: game isTied
! !

!TicTacToeTest methodsFor: 'as yet unclassified' stamp: 'jg 5/19/2018 18:51:52'!
test21

	| game |
	
	game := TicTacToe new.
	
	game putXAt: 2@2.
	game putOAt: 1@2.	
	game putXAt: 1@1.
	game putOAt: 2@1.
	game putXAt: 1@3.	
	game putOAt: 2@3.
	game putXAt: 3@2.	
	game putOAt: 3@1.
	game putXAt: 3@3.
	
	self assert: game isOver.
	self assert: game XHasWon. 
	self deny: game OHasWon. 
	self deny: game isTied
! !


!classDefinition: #TicTacToe category: #TicTacToe!
Object subclass: #TicTacToe
	instanceVariableNames: 'xs os turn winner'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TicTacToe'!

!TicTacToe methodsFor: 'as yet unclassified' stamp: 'jg 5/19/2018 18:50:04'!
OHasWon
	
	^winner = #o! !

!TicTacToe methodsFor: 'as yet unclassified' stamp: 'HAW 10/24/2017 17:12:48'!
Os

	^ os copy.! !

!TicTacToe methodsFor: 'as yet unclassified' stamp: 'HAW 10/24/2017 17:12:48'!
XHasWon
	
	^winner = #x! !

!TicTacToe methodsFor: 'as yet unclassified' stamp: 'HAW 10/24/2017 17:12:48'!
Xs
	
	^xs copy! !

!TicTacToe methodsFor: 'as yet unclassified' stamp: 'jg 5/19/2018 17:29:31'!
hasCompletedColumn: positions
	
	^ (1 to: 3) anySatisfy: [ :y | (positions count: [ :position | position y = y ]) = 3 ]! !

!TicTacToe methodsFor: 'as yet unclassified' stamp: 'jg 5/19/2018 17:29:07'!
hasCompletedRow: positions
	
	^ (1 to: 3) anySatisfy: [ :x | (positions count: [ :position | position x = x ]) = 3 ]! !

!TicTacToe methodsFor: 'as yet unclassified' stamp: 'HAW 5/31/2018 00:11:50'!
hasDownDiagonal: positions

	^(1 to: 3) allSatisfy: [ :n | positions includes: n@(4-n) ]! !

!TicTacToe methodsFor: 'as yet unclassified' stamp: 'HAW 5/31/2018 00:11:59'!
hasUpDiagonal: positions

	^(1 to: 3) allSatisfy: [ :n | positions includes: n@n ]! !

!TicTacToe methodsFor: 'as yet unclassified' stamp: 'jg 5/19/2018 17:29:43'!
hasWin: positions

	^(self hasCompletedColumn: positions) 
		or: [(self hasCompletedRow: positions) 
		or: [(self hasUpDiagonal: positions)
		or: [self hasDownDiagonal: positions]]]! !

!TicTacToe methodsFor: 'as yet unclassified' stamp: 'HAW 10/24/2017 17:12:48'!
initialize

	xs := Set new.
	os := Set new.
	
	turn := #x! !

!TicTacToe methodsFor: 'as yet unclassified' stamp: 'HAW 10/24/2017 17:12:48'!
isGameOver
	
	^winner = #x or: [ winner = #o ]! !

!TicTacToe methodsFor: 'as yet unclassified' stamp: 'jg 5/19/2018 18:54:03'!
isOver
	
	^self XHasWon or: [ self OHasWon or: [ self isTied ]]! !

!TicTacToe methodsFor: 'as yet unclassified' stamp: 'HAW 10/24/2017 17:12:48'!
isTied
	
	^xs size = 5 and: [ os size = 4 and: [ self XHasWon not ]] " and: [ self YHasWon not ]]]"! !

!TicTacToe methodsFor: 'as yet unclassified' stamp: 'HAW 10/24/2017 17:12:48'!
putOAt: aPosition

	self isGameOver ifTrue: [ self error: self class canNotPlayWhenGameIsOverErrorMessage ].
	turn = #o ifFalse: [ self error: self class notOTurnErrorMessage ].
	(xs includes: aPosition) ifTrue: [ self error: self class positionTakenErrorMessage ].
	(os includes: aPosition) ifTrue: [ self error: self class positionTakenErrorMessage ].

	os add: aPosition.
	
	(self hasWin: os) ifTrue: [^winner := #o ].
	
	turn := #x! !

!TicTacToe methodsFor: 'as yet unclassified' stamp: 'HAW 10/24/2017 17:12:48'!
putXAt: aPosition

	self isGameOver ifTrue: [ self error: self class canNotPlayWhenGameIsOverErrorMessage ].
	turn = #x ifFalse: [ self error: self class notXTurnErrorMessage ].
	(xs includes: aPosition) ifTrue: [ self error: self class positionTakenErrorMessage ].
	(os includes: aPosition) ifTrue: [ self error: self class positionTakenErrorMessage ].
	
	xs add: aPosition.
	
	(self hasWin: xs) ifTrue: [ ^winner := #x ].
		
	turn := #o! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'TicTacToe class' category: #TicTacToe!
TicTacToe class
	instanceVariableNames: ''!

!TicTacToe class methodsFor: 'as yet unclassified' stamp: 'HAW 10/24/2017 17:12:48'!
canNotPlayWhenGameIsOverErrorMessage
	
	^'Can not play when game is over'! !

!TicTacToe class methodsFor: 'as yet unclassified' stamp: 'HAW 10/24/2017 17:12:48'!
notOTurnErrorMessage
	
	^'Not O''s turn'! !

!TicTacToe class methodsFor: 'as yet unclassified' stamp: 'HAW 10/24/2017 17:12:48'!
notXTurnErrorMessage
	
	^'Not X''s turn'! !

!TicTacToe class methodsFor: 'as yet unclassified' stamp: 'HAW 10/24/2017 17:12:48'!
positionTakenErrorMessage
	
	^'Position taken'! !
