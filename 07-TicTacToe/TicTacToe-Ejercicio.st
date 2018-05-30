!classDefinition: #TicTacToeTest category: #'TicTacToe-Ejercicio'!
TestCase subclass: #TicTacToeTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TicTacToe-Ejercicio'!

!TicTacToeTest methodsFor: 'as yet unclassified' stamp: 'DS 5/30/2018 13:59:30'!
test01NewGameIsEmpty
	| game |
	game _ TicTacToe new.
	self assert: game Xs isEmpty.
	self assert: game Os isEmpty.! !

!TicTacToeTest methodsFor: 'as yet unclassified' stamp: 'DS 5/28/2018 18:31:14'!
test02PuttingXIncrementsXsNotOs
	| game |
	game _ TicTacToe new.
	game putXAt: 1 @ 1.
	self
		assert: 1
		equals: game Xs size.
	self assert: (game Xs includes: 1 @ 1).
	self assert: game Os isEmpty.! !

!TicTacToeTest methodsFor: 'as yet unclassified' stamp: 'DS 5/28/2018 18:32:27'!
test03CanPutOAfterX
	| game |
	game _ TicTacToe new.
	game putXAt: 1 @ 1.
	game putOAt: 2 @ 2.
	self
		assert: 1
		equals: game Xs size.
	self assert: (game Xs includes: 1 @ 1).
	self
		assert: 1
		equals: game Os size.
	self assert: (game Os includes: 2 @ 2).! !

!TicTacToeTest methodsFor: 'as yet unclassified' stamp: 'DS 5/28/2018 18:32:02'!
test04CannotPutXInOTurn
	| game |
	game _ TicTacToe new.
	game putXAt: 1 @ 1.
	self
		should: [ game putXAt: 2 @ 2 ]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError |
			self
				assert: TicTacToe notXTurnErrorMessage
				equals: anError messageText.
			self
				assert: 1
				equals: game Xs size.
			self assert: (game Xs includes: 1 @ 1).
			self assert: game Os isEmpty ].! !

!TicTacToeTest methodsFor: 'as yet unclassified' stamp: 'DS 5/28/2018 20:48:28'!
test05CannotPutOInXTurn
	| game |
	game _ TicTacToe new.
	game putXAt: 1 @ 1.
	game putOAt: 2 @ 2.
	self
		should: [ game putOAt: 3 @ 3 ]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError |
			self
				assert: TicTacToe notOTurnErrorMessage
				equals: anError messageText.
			self
				assert: 1
				equals: game Xs size.
			self assert: (game Xs includes: 1 @ 1).
			self
				assert: 1
				equals: game Os size.
			self assert: (game Os includes: 2 @ 2) ].! !

!TicTacToeTest methodsFor: 'as yet unclassified' stamp: 'DS 5/30/2018 14:00:19'!
test06CannotPutXAtPositionTakenByX
	| game |
	game _ TicTacToe new.
	game putXAt: 1 @ 1.
	game putOAt: 2 @ 2.
	self
		should: [ game putXAt: 1 @ 1 ]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError |
			self
				assert: TicTacToe positionTakenErrorMessage
				equals: anError messageText.
			self
				assert: 1
				equals: game Xs size.
			self assert: (game Xs includes: 1 @ 1).
			self
				assert: 1
				equals: game Os size.
			self assert: (game Os includes: 2 @ 2) ].! !

!TicTacToeTest methodsFor: 'as yet unclassified' stamp: 'DS 5/30/2018 14:00:37'!
test07CannotPutXAtPositionTakenByO
	| game |
	game _ TicTacToe new.
	game putXAt: 1 @ 1.
	game putOAt: 2 @ 2.
	self
		should: [ game putXAt: 2 @ 2 ]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError |
			self
				assert: TicTacToe positionTakenErrorMessage
				equals: anError messageText.
			self
				assert: 1
				equals: game Xs size.
			self assert: (game Xs includes: 1 @ 1).
			self
				assert: 1
				equals: game Os size.
			self assert: (game Os includes: 2 @ 2) ].! !

!TicTacToeTest methodsFor: 'as yet unclassified' stamp: 'DS 5/30/2018 14:01:00'!
test08CannotPutOAtPositionTakenByX
	| game |
	game _ TicTacToe new.
	game putXAt: 1 @ 1.
	self
		should: [ game putOAt: 1 @ 1 ]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError |
			self
				assert: TicTacToe positionTakenErrorMessage
				equals: anError messageText.
			self
				assert: 1
				equals: game Xs size.
			self assert: (game Xs includes: 1 @ 1).
			self assert: game Os isEmpty ].! !

!TicTacToeTest methodsFor: 'as yet unclassified' stamp: 'DS 5/30/2018 14:01:16'!
test09CannotPutOAtPositionTakenByO
	| game |
	game _ TicTacToe new.
	game putXAt: 1 @ 1.
	game putOAt: 2 @ 2.
	game putXAt: 3 @ 3.
	self
		should: [ game putOAt: 2 @ 2 ]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError |
			self
				assert: TicTacToe positionTakenErrorMessage
				equals: anError messageText.
			self
				assert: 2
				equals: game Xs size.
			self assert: (game Xs includes: 1 @ 1).
			self assert: (game Xs includes: 3 @ 3).
			self
				assert: 1
				equals: game Os size.
			self assert: (game Os includes: 2 @ 2) ].! !

!TicTacToeTest methodsFor: 'as yet unclassified' stamp: 'DS 5/30/2018 14:01:47'!
test10GameCanBeTied
	| game |
	game _ TicTacToe new.
	game putXAt: 1 @ 1.
	game putOAt: 2 @ 1.
	game putXAt: 2 @ 2.
	game putOAt: 3 @ 3.
	self deny: game OHasWon.
	self deny: game XHasWon.! !

!TicTacToeTest methodsFor: 'as yet unclassified' stamp: 'DS 5/30/2018 14:02:15'!
test11XCanWinByTakingRow
	| game |
	game _ TicTacToe new.
	game putXAt: 1 @ 1.
	game putOAt: 2 @ 1.
	game putXAt: 1 @ 2.
	game putOAt: 3 @ 3.
	game putXAt: 1 @ 3.
	self assert: game XHasWon.
	self deny: game OHasWon.! !

!TicTacToeTest methodsFor: 'as yet unclassified' stamp: 'DS 5/30/2018 14:05:33'!
test12XCanWinByTakingSecondRow
	| game |
	game _ TicTacToe new.
	game putXAt: 2 @ 1.
	game putOAt: 1 @ 1.
	game putXAt: 2 @ 2.
	game putOAt: 3 @ 1.
	game putXAt: 2 @ 3.
	self assert: game XHasWon.
	self deny: game OHasWon.! !

!TicTacToeTest methodsFor: 'as yet unclassified' stamp: 'DS 5/30/2018 14:05:49'!
test13XCanWinByTakingThirdRow
	| game |
	game _ TicTacToe new.
	game putXAt: 3 @ 1.
	game putOAt: 1 @ 1.
	game putXAt: 3 @ 2.
	game putOAt: 2 @ 1.
	game putXAt: 3 @ 3.
	self assert: game XHasWon.
	self deny: game OHasWon.! !

!TicTacToeTest methodsFor: 'as yet unclassified' stamp: 'DS 5/30/2018 15:13:16'!
test14XCanWinByTakingFirstColumn
	| game |
	game _ TicTacToe new.
	game putXAt: 1 @ 1.
	game putOAt: 2 @ 2.
	game putXAt: 2 @ 1.
	game putOAt: 3 @ 3.
	game putXAt: 3 @ 1.
	self assert: game XHasWon.
	self deny: game OHasWon.! !

!TicTacToeTest methodsFor: 'as yet unclassified' stamp: 'DS 5/30/2018 15:13:40'!
test15XCanWinByTakingDownDiagonal
	| game |
	game _ TicTacToe new.
	game putXAt: 1 @ 1.
	game putOAt: 2 @ 1.
	game putXAt: 2 @ 2.
	game putOAt: 2 @ 3.
	game putXAt: 3 @ 3.
	self assert: game XHasWon.
	self deny: game OHasWon.! !

!TicTacToeTest methodsFor: 'as yet unclassified' stamp: 'DS 5/30/2018 15:14:15'!
test16XCanWinByTakingUpDiagonal
	| game |
	game _ TicTacToe new.
	game putXAt: 3 @ 1.
	game putOAt: 2 @ 1.
	game putXAt: 2 @ 2.
	game putOAt: 1 @ 2.
	game putXAt: 1 @ 3.
	self assert: game XHasWon.
	self deny: game OHasWon.! !

!TicTacToeTest methodsFor: 'as yet unclassified' stamp: 'DS 5/30/2018 15:14:33'!
test17OCanWinByTakingFirstRow
	| game |
	game _ TicTacToe new.
	game putXAt: 3 @ 1.
	game putOAt: 1 @ 1.
	game putXAt: 2 @ 2.
	game putOAt: 1 @ 2.
	game putXAt: 3 @ 3.
	game putOAt: 1 @ 3.
	self assert: game OHasWon.
	self deny: game XHasWon.! !

!TicTacToeTest methodsFor: 'as yet unclassified' stamp: 'DS 5/30/2018 15:15:54'!
test18OCannotPlayWhenXWonGame
	| game |
	game _ TicTacToe new.
	game putXAt: 1 @ 1.
	game putOAt: 2 @ 1.
	game putXAt: 1 @ 2.
	game putOAt: 3 @ 1.
	game putXAt: 1 @ 3.
	self
		should: [ game putOAt: 3 @ 1 ]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError |
			self
				assert: TicTacToe canNotPlayWhenGameIsOverErrorMessage
				equals: anError messageText.
			self
				assert: 2
				equals: game Os size.
			self assert: (game Os includes: 2 @ 1).
			self assert: (game Os includes: 3 @ 1) ].! !

!TicTacToeTest methodsFor: 'as yet unclassified' stamp: 'DS 5/30/2018 15:17:28'!
test19XCannotPlayWhenOWonGame
	| game |
	game _ TicTacToe new.
	game putXAt: 2 @ 2.
	game putOAt: 1 @ 1.
	game putXAt: 2 @ 1.
	game putOAt: 1 @ 2.
	game putXAt: 3 @ 1.
	game putOAt: 1 @ 3.
	self
		should: [ game putXAt: 3 @ 2 ]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError |
			self
				assert: TicTacToe canNotPlayWhenGameIsOverErrorMessage
				equals: anError messageText.
			self
				assert: 3
				equals: game Xs size.
			self assert: (game Xs includes: 2 @ 2).
			self assert: (game Xs includes: 2 @ 1).
			self assert: (game Xs includes: 3 @ 1) ].! !

!TicTacToeTest methodsFor: 'as yet unclassified' stamp: 'DS 5/30/2018 15:19:23'!
test20GameIsTiedAfterPlaying
	| game |
	game _ TicTacToe new.
	game putXAt: 2 @ 2.
	game putOAt: 1 @ 1.
	game putXAt: 1 @ 3.
	game putOAt: 3 @ 1.
	game putXAt: 2 @ 1.
	game putOAt: 2 @ 3.
	game putXAt: 1 @ 2.
	game putOAt: 3 @ 2.
	game putXAt: 3 @ 3.
	self assert: game isOver.
	self deny: game XHasWon.
	self deny: game OHasWon.
	self assert: game isTied.! !

!TicTacToeTest methodsFor: 'as yet unclassified' stamp: 'DS 5/30/2018 15:19:08'!
test21XWinsAfterPlaying
	| game |
	game _ TicTacToe new.
	game putXAt: 2 @ 2.
	game putOAt: 1 @ 2.
	game putXAt: 1 @ 1.
	game putOAt: 2 @ 1.
	game putXAt: 1 @ 3.
	game putOAt: 2 @ 3.
	game putXAt: 3 @ 2.
	game putOAt: 3 @ 1.
	game putXAt: 3 @ 3.
	self assert: game isOver.
	self assert: game XHasWon.
	self deny: game OHasWon.
	self deny: game isTied.! !


!classDefinition: #TicTacToe category: #'TicTacToe-Ejercicio'!
Object subclass: #TicTacToe
	instanceVariableNames: 'state'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TicTacToe-Ejercicio'!

!TicTacToe methodsFor: 'initializing' stamp: 'DS 5/28/2018 20:49:45'!
initialize
	state _ TicTacToePlayingXTurnState empty.! !


!TicTacToe methodsFor: 'inspecting' stamp: 'DS 5/28/2018 20:01:41'!
OHasWon
	
	^state OHasWon! !

!TicTacToe methodsFor: 'inspecting' stamp: 'DS 5/28/2018 19:41:18'!
Os

	^state Os! !

!TicTacToe methodsFor: 'inspecting' stamp: 'DS 5/28/2018 20:01:48'!
XHasWon
	
	^state XHasWon! !

!TicTacToe methodsFor: 'inspecting' stamp: 'DS 5/28/2018 19:41:15'!
Xs

	^state Xs! !

!TicTacToe methodsFor: 'inspecting' stamp: 'DS 5/28/2018 20:01:58'!
isGameOver
	
	^state isGameOver! !

!TicTacToe methodsFor: 'inspecting' stamp: 'DS 5/28/2018 20:02:05'!
isOver
	
	^state isOver
! !

!TicTacToe methodsFor: 'inspecting' stamp: 'DS 5/28/2018 20:02:18'!
isPlayingO
	
	^state isPlayingO! !

!TicTacToe methodsFor: 'inspecting' stamp: 'DS 5/28/2018 20:02:28'!
isPlayingX
	
	^state isPlayingX! !

!TicTacToe methodsFor: 'inspecting' stamp: 'DS 5/28/2018 20:13:56'!
isTied
	
	^state isTied! !


!TicTacToe methodsFor: 'accessing' stamp: 'DS 5/28/2018 19:34:41'!
putOAt: aPosition

	state _ state putOAt: aPosition! !

!TicTacToe methodsFor: 'accessing' stamp: 'DS 5/28/2018 19:34:35'!
putXAt: aPosition

	state _ state putXAt: aPosition! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'TicTacToe class' category: #'TicTacToe-Ejercicio'!
TicTacToe class
	instanceVariableNames: ''!

!TicTacToe class methodsFor: 'as yet unclassified' stamp: 'jg 5/22/2018 13:15:31'!
canNotPlayWhenGameIsOverErrorMessage
	
	^'Can not play when game is over'! !

!TicTacToe class methodsFor: 'as yet unclassified' stamp: 'DS 5/28/2018 19:10:37'!
notOTurnErrorMessage

	^'Not O turn'! !

!TicTacToe class methodsFor: 'as yet unclassified' stamp: 'jg 5/22/2018 10:26:38'!
notXTurnErrorMessage

	^'Not X turn'! !

!TicTacToe class methodsFor: 'as yet unclassified' stamp: 'jg 5/22/2018 11:20:12'!
positionTakenErrorMessage
	
	^'Position taken'! !


!classDefinition: #TicTacToeState category: #'TicTacToe-Ejercicio'!
Object subclass: #TicTacToeState
	instanceVariableNames: 'os xs'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TicTacToe-Ejercicio'!

!TicTacToeState methodsFor: 'as yet unclassified' stamp: 'DS 5/28/2018 20:43:52'!
OHasWon
	
	^self hasWin: os! !

!TicTacToeState methodsFor: 'as yet unclassified' stamp: 'DS 5/28/2018 19:42:00'!
Os

	^ os copy! !

!TicTacToeState methodsFor: 'as yet unclassified' stamp: 'DS 5/28/2018 20:43:58'!
XHasWon
	
	^self hasWin: xs! !

!TicTacToeState methodsFor: 'as yet unclassified' stamp: 'DS 5/28/2018 19:42:03'!
Xs

	^ xs copy! !

!TicTacToeState methodsFor: 'as yet unclassified' stamp: 'DS 5/28/2018 20:42:54'!
isGameOver
	
	^self OHasWon or: [self XHasWon]! !

!TicTacToeState methodsFor: 'as yet unclassified' stamp: 'DS 5/28/2018 19:46:19'!
isOver
	
	^self XHasWon or: [ self OHasWon or: [ self isTied ]]! !

!TicTacToeState methodsFor: 'as yet unclassified' stamp: 'DS 5/28/2018 19:43:07'!
isPlayingO

	self subclassResponsibility ! !

!TicTacToeState methodsFor: 'as yet unclassified' stamp: 'DS 5/28/2018 19:43:08'!
isPlayingX

	self subclassResponsibility ! !

!TicTacToeState methodsFor: 'as yet unclassified' stamp: 'DS 5/28/2018 19:46:35'!
isTied
	
	^xs size = 5 and: [ os size = 4 and: [ self XHasWon not ]]! !


!TicTacToeState methodsFor: 'private' stamp: 'DS 5/28/2018 19:35:59'!
hasCompletedColumn: positions
	
	^(1 to: 3) anySatisfy: [ :y | (positions count: [ :position | position y = y ]) = 3 ]! !

!TicTacToeState methodsFor: 'private' stamp: 'DS 5/28/2018 19:36:07'!
hasCompletedRow: positions

	^(1 to: 3) anySatisfy: [ :x | (positions count: [ :position | position x = x ]) = 3 ]! !

!TicTacToeState methodsFor: 'private' stamp: 'DS 5/28/2018 19:36:13'!
hasDownDiagonal: positions

	^(1 to: 3) allSatisfy: [ :n | positions includes: n@n ]
! !

!TicTacToeState methodsFor: 'private' stamp: 'DS 5/28/2018 19:36:21'!
hasUpDiagonal: positions

	^(1 to: 3) allSatisfy: [ :n | positions includes: n@(4-n) ]! !

!TicTacToeState methodsFor: 'private' stamp: 'DS 5/28/2018 19:36:32'!
hasWin: positions

	^(self hasCompletedRow: positions)
		or: [(self hasCompletedColumn: positions) 
			or: [(self hasDownDiagonal: positions)
				or: [(self hasUpDiagonal: positions)]]]! !

!TicTacToeState methodsFor: 'private' stamp: 'DS 5/28/2018 20:55:21'!
isPositionTaken: aPosition
	
	^(xs includes: aPosition) or: [os includes: aPosition]! !


!TicTacToeState methodsFor: 'initializing' stamp: 'DS 5/28/2018 19:36:41'!
initializeWithXs: xSet withOs: oSet

	xs _ xSet.
	os _ oSet.! !


!TicTacToeState methodsFor: 'accessing' stamp: 'DS 5/28/2018 18:59:04'!
putOAt: aPosition

	self subclassResponsibility ! !

!TicTacToeState methodsFor: 'accessing' stamp: 'DS 5/28/2018 18:59:09'!
putXAt: aPosition

	self subclassResponsibility ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'TicTacToeState class' category: #'TicTacToe-Ejercicio'!
TicTacToeState class
	instanceVariableNames: ''!

!TicTacToeState class methodsFor: 'as yet unclassified' stamp: 'DS 5/28/2018 19:03:14'!
empty

	^self withXs: Set new withOs: Set new! !

!TicTacToeState class methodsFor: 'as yet unclassified' stamp: 'DS 5/28/2018 19:02:55'!
withXs: xSet withOs: oSet

	^self new
		initializeWithXs: xSet
		withOs: oSet.! !


!classDefinition: #TicTacToeFinishedState category: #'TicTacToe-Ejercicio'!
TicTacToeState subclass: #TicTacToeFinishedState
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TicTacToe-Ejercicio'!

!TicTacToeFinishedState methodsFor: 'as yet unclassified' stamp: 'DS 5/28/2018 19:06:51'!
putOAt: aPosition

	self error: TicTacToe canNotPlayWhenGameIsOverErrorMessage! !

!TicTacToeFinishedState methodsFor: 'as yet unclassified' stamp: 'DS 5/28/2018 19:06:54'!
putXAt: aPosition

	self error: TicTacToe canNotPlayWhenGameIsOverErrorMessage! !


!classDefinition: #TicTacToeFinishedOTurnState category: #'TicTacToe-Ejercicio'!
TicTacToeFinishedState subclass: #TicTacToeFinishedOTurnState
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TicTacToe-Ejercicio'!

!TicTacToeFinishedOTurnState methodsFor: 'as yet unclassified' stamp: 'DS 5/28/2018 20:45:12'!
isPlayingO

	^true! !

!TicTacToeFinishedOTurnState methodsFor: 'as yet unclassified' stamp: 'DS 5/28/2018 20:45:07'!
isPlayingX

	^false! !


!classDefinition: #TicTacToeFinishedXTurnState category: #'TicTacToe-Ejercicio'!
TicTacToeFinishedState subclass: #TicTacToeFinishedXTurnState
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TicTacToe-Ejercicio'!

!TicTacToeFinishedXTurnState methodsFor: 'as yet unclassified' stamp: 'DS 5/28/2018 20:45:23'!
isPlayingO

	^false! !

!TicTacToeFinishedXTurnState methodsFor: 'as yet unclassified' stamp: 'DS 5/28/2018 20:45:27'!
isPlayingX

	^true! !


!classDefinition: #TicTacToePlayingState category: #'TicTacToe-Ejercicio'!
TicTacToeState subclass: #TicTacToePlayingState
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TicTacToe-Ejercicio'!


!classDefinition: #TicTacToePlayingOTurnState category: #'TicTacToe-Ejercicio'!
TicTacToePlayingState subclass: #TicTacToePlayingOTurnState
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TicTacToe-Ejercicio'!

!TicTacToePlayingOTurnState methodsFor: 'as yet unclassified' stamp: 'DS 5/28/2018 20:45:53'!
isPlayingO

	^true! !

!TicTacToePlayingOTurnState methodsFor: 'as yet unclassified' stamp: 'DS 5/28/2018 20:45:48'!
isPlayingX

	^false! !

!TicTacToePlayingOTurnState methodsFor: 'as yet unclassified' stamp: 'DS 5/28/2018 20:54:22'!
putOAt: aPosition
	| newOs |

	(self isPositionTaken: aPosition) ifTrue: [ self error: TicTacToe positionTakenErrorMessage ].

	newOs _ os copy
		add: aPosition;
		yourself.

	^ (self hasWin: newOs)
		ifTrue: [
			TicTacToeFinishedXTurnState
				withXs: xs
				withOs: newOs ]
		ifFalse: [
			TicTacToePlayingXTurnState
				withXs: xs
				withOs: newOs ].! !

!TicTacToePlayingOTurnState methodsFor: 'as yet unclassified' stamp: 'DS 5/28/2018 19:58:17'!
putXAt: aPosition

	self error: TicTacToe notXTurnErrorMessage.! !


!classDefinition: #TicTacToePlayingXTurnState category: #'TicTacToe-Ejercicio'!
TicTacToePlayingState subclass: #TicTacToePlayingXTurnState
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TicTacToe-Ejercicio'!

!TicTacToePlayingXTurnState methodsFor: 'as yet unclassified' stamp: 'DS 5/28/2018 20:46:02'!
isPlayingO

	^false! !

!TicTacToePlayingXTurnState methodsFor: 'as yet unclassified' stamp: 'DS 5/28/2018 20:46:05'!
isPlayingX

	^true! !

!TicTacToePlayingXTurnState methodsFor: 'as yet unclassified' stamp: 'DS 5/28/2018 19:56:48'!
putOAt: aPosition

	self error: TicTacToe notOTurnErrorMessage.! !

!TicTacToePlayingXTurnState methodsFor: 'as yet unclassified' stamp: 'DS 5/28/2018 20:56:09'!
putXAt: aPosition
	| newXs |

	(self isPositionTaken: aPosition) ifTrue: [ self error: TicTacToe positionTakenErrorMessage ].

	newXs _ xs copy
		add: aPosition;
		yourself.

	^ (self hasWin: newXs)
		ifTrue: [
			TicTacToeFinishedOTurnState
				withXs: newXs
				withOs: os ]
		ifFalse: [
			TicTacToePlayingOTurnState
				withXs: newXs
				withOs: os ].! !
