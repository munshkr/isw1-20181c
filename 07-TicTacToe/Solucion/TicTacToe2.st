!classDefinition: #TicTacToeTest category: #TicTacToe!
TestCase subclass: #TicTacToeTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TicTacToe'!

!TicTacToeTest methodsFor: 'as yet unclassified' stamp: 'HAW 10/25/2017 16:16:59'!
test01
	| game |
	game _ TicTacToe new.
	self assert: game playerXPositions isEmpty.
	self assert: game playerOPositions isEmpty.
	
	self assert: game isPlayingX.
	self deny: game isPlayingO.
	
	self deny: game isOver.
	self deny: game hasPlayerXWon.
	self deny: game hasPlayerOWon.
	self deny: game isTied.! !

!TicTacToeTest methodsFor: 'as yet unclassified' stamp: 'HAW 10/25/2017 16:18:18'!
test02
	| game |
	game _ TicTacToe new.
	game putXAt: 1 @ 1.
	self
		assert: 1
		equals: game playerXPositions size.
	self assert: (game playerXPositions includes: 1 @ 1).
	self assert: game playerOPositions isEmpty.
	
	self deny: game isPlayingX.
	self assert: game isPlayingO.
	
	self deny: game isOver.
	self deny: game hasPlayerXWon.
	self deny: game hasPlayerOWon.
	self deny: game isTied.! !

!TicTacToeTest methodsFor: 'as yet unclassified' stamp: 'HAW 10/25/2017 15:56:32'!
test03
	| game |
	game _ TicTacToe new.
	game putXAt: 1 @ 1.
	game putOAt: 2 @ 2.
	self
		assert: 1
		equals: game playerXPositions size.
	self assert: (game playerXPositions includes: 1 @ 1).
	self
		assert: 1
		equals: game playerOPositions size.
	self assert: (game playerOPositions includes: 2 @ 2).! !

!TicTacToeTest methodsFor: 'as yet unclassified' stamp: 'HAW 10/25/2017 15:56:32'!
test04
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
				equals: game playerXPositions size.
			self assert: (game playerXPositions includes: 1 @ 1).
			self assert: game playerOPositions isEmpty ].! !

!TicTacToeTest methodsFor: 'as yet unclassified' stamp: 'HAW 10/25/2017 15:56:32'!
test05
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
				equals: game playerXPositions size.
			self assert: (game playerXPositions includes: 1 @ 1).
			self
				assert: 1
				equals: game playerOPositions size.
			self assert: (game playerOPositions includes: 2 @ 2) ].! !

!TicTacToeTest methodsFor: 'as yet unclassified' stamp: 'HAW 10/25/2017 15:56:32'!
test06
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
				equals: game playerXPositions size.
			self assert: (game playerXPositions includes: 1 @ 1).
			self
				assert: 1
				equals: game playerOPositions size.
			self assert: (game playerOPositions includes: 2 @ 2) ].! !

!TicTacToeTest methodsFor: 'as yet unclassified' stamp: 'HAW 10/25/2017 15:56:32'!
test07
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
				equals: game playerXPositions size.
			self assert: (game playerXPositions includes: 1 @ 1).
			self
				assert: 1
				equals: game playerOPositions size.
			self assert: (game playerOPositions includes: 2 @ 2) ].! !

!TicTacToeTest methodsFor: 'as yet unclassified' stamp: 'HAW 10/25/2017 15:56:32'!
test08
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
				equals: game playerXPositions size.
			self assert: (game playerXPositions includes: 1 @ 1).
			self assert: game playerOPositions isEmpty ].! !

!TicTacToeTest methodsFor: 'as yet unclassified' stamp: 'HAW 10/25/2017 15:56:32'!
test09
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
				equals: game playerXPositions size.
			self assert: (game playerXPositions includes: 1 @ 1).
			self assert: (game playerXPositions includes: 3 @ 3).
			self
				assert: 1
				equals: game playerOPositions size.
			self assert: (game playerOPositions includes: 2 @ 2) ].! !

!TicTacToeTest methodsFor: 'as yet unclassified' stamp: 'HAW 10/25/2017 16:14:31'!
test10
	| game |
	game _ TicTacToe new.
	game putXAt: 1 @ 1.
	game putOAt: 2 @ 1.
	game putXAt: 1 @ 2.
	game putOAt: 3 @ 1.
	self deny: game hasPlayerXWon.
	self deny: game hasPlayerOWon.! !

!TicTacToeTest methodsFor: 'as yet unclassified' stamp: 'HAW 10/25/2017 16:20:51'!
test11
	| game |
	game _ TicTacToe new.
	game putXAt: 1 @ 1.
	game putOAt: 2 @ 1.
	game putXAt: 1 @ 2.
	game putOAt: 3 @ 1.
	game putXAt: 1 @ 3.
	
	self assert: game isOver.
	self assert: game hasPlayerXWon.
	self deny: game hasPlayerOWon.
	self deny: game isTied.
		
	self deny: game isPlayingX.
	self deny: game isPlayingO.
	
! !

!TicTacToeTest methodsFor: 'as yet unclassified' stamp: 'HAW 10/25/2017 16:14:31'!
test12
	| game |
	game _ TicTacToe new.
	game putXAt: 2 @ 1.
	game putOAt: 1 @ 1.
	game putXAt: 2 @ 2.
	game putOAt: 3 @ 1.
	game putXAt: 2 @ 3.
	self assert: game hasPlayerXWon.
	self deny: game hasPlayerOWon.! !

!TicTacToeTest methodsFor: 'as yet unclassified' stamp: 'HAW 10/25/2017 16:14:31'!
test13
	| game |
	game _ TicTacToe new.
	game putXAt: 3 @ 1.
	game putOAt: 1 @ 1.
	game putXAt: 3 @ 2.
	game putOAt: 2 @ 1.
	game putXAt: 3 @ 3.
	self assert: game hasPlayerXWon.
	self deny: game hasPlayerOWon.! !

!TicTacToeTest methodsFor: 'as yet unclassified' stamp: 'HAW 10/25/2017 16:14:31'!
test14
	| game |
	game _ TicTacToe new.
	game putXAt: 1 @ 1.
	game putOAt: 2 @ 2.
	game putXAt: 2 @ 1.
	game putOAt: 3 @ 3.
	game putXAt: 3 @ 1.
	self assert: game hasPlayerXWon.
	self deny: game hasPlayerOWon.! !

!TicTacToeTest methodsFor: 'as yet unclassified' stamp: 'HAW 10/25/2017 16:14:31'!
test15
	| game |
	game _ TicTacToe new.
	game putXAt: 1 @ 1.
	game putOAt: 1 @ 2.
	game putXAt: 2 @ 2.
	game putOAt: 1 @ 3.
	game putXAt: 3 @ 3.
	self assert: game hasPlayerXWon.
	self deny: game hasPlayerOWon.! !

!TicTacToeTest methodsFor: 'as yet unclassified' stamp: 'HAW 10/25/2017 16:14:31'!
test16
	| game |
	game _ TicTacToe new.
	game putXAt: 1 @ 3.
	game putOAt: 1 @ 2.
	game putXAt: 2 @ 2.
	game putOAt: 2 @ 1.
	game putXAt: 3 @ 1.
	self assert: game hasPlayerXWon.
	self deny: game hasPlayerOWon.! !

!TicTacToeTest methodsFor: 'as yet unclassified' stamp: 'HAW 10/25/2017 16:14:31'!
test17
	| game |
	game _ TicTacToe new.
	game putXAt: 2 @ 1.
	game putOAt: 1 @ 1.
	game putXAt: 2 @ 2.
	game putOAt: 1 @ 2.
	game putXAt: 3 @ 1.
	game putOAt: 1 @ 3.
	self deny: game hasPlayerXWon.
	self assert: game hasPlayerOWon.! !

!TicTacToeTest methodsFor: 'as yet unclassified' stamp: 'HAW 10/25/2017 15:56:16'!
test18
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
				equals: game playerOPositions size.
			self assert: (game playerOPositions includes: 2 @ 1).
			self assert: (game playerOPositions includes: 3 @ 1) ].! !

!TicTacToeTest methodsFor: 'as yet unclassified' stamp: 'HAW 10/25/2017 15:56:32'!
test19
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
				equals: game playerXPositions size.
			self assert: (game playerXPositions includes: 2 @ 2).
			self assert: (game playerXPositions includes: 2 @ 1).
			self assert: (game playerXPositions includes: 3 @ 1) ].! !

!TicTacToeTest methodsFor: 'as yet unclassified' stamp: 'HAW 10/25/2017 16:21:53'!
test20
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
	self deny: game hasPlayerXWon.
	self deny: game hasPlayerOWon.
	self assert: game isTied.
	
	self deny: game isPlayingX.
	self deny: game isPlayingO.
	! !

!TicTacToeTest methodsFor: 'as yet unclassified' stamp: 'HAW 10/25/2017 16:14:31'!
test21
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
	self assert: game hasPlayerXWon.
	self deny: game hasPlayerOWon.
	self deny: game isTied.! !

!TicTacToeTest methodsFor: 'as yet unclassified' stamp: 'HAW 10/25/2017 16:23:43'!
test22
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
	
	self 
		should: [game putOAt: 1@1 ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: TicTacToe canNotPlayWhenGameIsOverErrorMessage equals: anError messageText ]! !

!TicTacToeTest methodsFor: 'as yet unclassified' stamp: 'HAW 10/25/2017 16:24:35'!
test23

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
	
	self 
		should: [game putXAt: 1@1 ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: TicTacToe canNotPlayWhenGameIsOverErrorMessage equals: anError messageText ]! !

!TicTacToeTest methodsFor: 'as yet unclassified' stamp: 'HAW 10/25/2017 16:26:23'!
test24
	| game |
	game _ TicTacToe new.
	game putXAt: 2 @ 1.
	game putOAt: 1 @ 1.
	game putXAt: 2 @ 2.
	game putOAt: 3 @ 1.
	game putXAt: 2 @ 3.

	self 
		should: [ game  putXAt: 2 @ 3 ] 
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: TicTacToe canNotPlayWhenGameIsOverErrorMessage equals: anError messageText ]
		! !


!classDefinition: #TicTacToe category: #TicTacToe!
Object subclass: #TicTacToe
	instanceVariableNames: 'state playerOPositions playerXPositions'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TicTacToe'!

!TicTacToe methodsFor: 'as yet unclassified' stamp: 'HAW 10/25/2017 15:41:25'!
add: aPosition to: positions nextPlayerState: nextPlayingState winnerState: winnerState

	positions add: aPosition.
	state := (self stateAfterAddingTo: positions with: nextPlayingState and: winnerState) for: self
	! !

!TicTacToe methodsFor: 'as yet unclassified' stamp: 'HAW 10/25/2017 15:35:08'!
assertIsFree: aPosition

	(self isTaken: aPosition) ifTrue: [ self error: self class positionTakenErrorMessage ].
! !

!TicTacToe methodsFor: 'as yet unclassified' stamp: 'HAW 10/25/2017 16:10:30'!
has: positions threeOf: aPositionComponent

	^positions size >= 3 and: [ (positions collect: aPositionComponent) asBag contents values includes: 3 ]
	! !

!TicTacToe methodsFor: 'as yet unclassified' stamp: 'jg 5/20/2018 14:48:37'!
hasCompletedColumn: positions
	^ self
		has: positions
		threeOf: [ :aPosition |
			aPosition y ].! !

!TicTacToe methodsFor: 'as yet unclassified' stamp: 'jg 5/20/2018 14:47:42'!
hasCompletedRow: positions
	^ self
		has: positions
		threeOf: [ :aPosition |
			aPosition x ].! !

!TicTacToe methodsFor: 'as yet unclassified' stamp: 'HAW 5/31/2018 00:15:47'!
hasDownDiagonal: positions

	^ (1 to: 3) allSatisfy: [ :n | positions includes: n @ (4-n) ].! !

!TicTacToe methodsFor: 'as yet unclassified' stamp: 'HAW 10/25/2017 16:14:31'!
hasPlayerOWon
	^ state hasPlayerOWon.! !

!TicTacToe methodsFor: 'as yet unclassified' stamp: 'HAW 10/25/2017 15:51:46'!
hasPlayerXWon
	^ state hasPlayerXWon.! !

!TicTacToe methodsFor: 'as yet unclassified' stamp: 'HAW 5/31/2018 00:15:59'!
hasUpDiagonal: positions

	^ (1 to: 3) allSatisfy: [ :n | positions includes: n @ n ].! !

!TicTacToe methodsFor: 'as yet unclassified' stamp: 'HAW 5/31/2018 00:16:26'!
hasWin: positions

	^ (self hasCompletedRow: positions) 
		or: [ (self hasCompletedColumn: positions) 
		or: [ (self hasUpDiagonal: positions) 
		or: [ self hasDownDiagonal: positions ]]].! !

!TicTacToe methodsFor: 'as yet unclassified' stamp: 'HAW 5/31/2018 00:16:39'!
initialize

	playerXPositions := OrderedCollection new.
	playerOPositions := OrderedCollection new.
	state := PlayingX for: self.! !

!TicTacToe methodsFor: 'as yet unclassified' stamp: 'HAW 10/25/2017 13:32:14'!
isOver
	
	^state isOver! !

!TicTacToe methodsFor: 'as yet unclassified' stamp: 'HAW 10/25/2017 16:17:38'!
isPlayingO
	
	^state isPlayingO! !

!TicTacToe methodsFor: 'as yet unclassified' stamp: 'HAW 10/25/2017 16:17:14'!
isPlayingX
	
	^state isPlayingX ! !

!TicTacToe methodsFor: 'as yet unclassified' stamp: 'HAW 5/31/2018 00:16:45'!
isTaken: aPosition

	^ (playerXPositions includes: aPosition) or: [ playerOPositions includes: aPosition ].! !

!TicTacToe methodsFor: 'as yet unclassified' stamp: 'HAW 10/25/2017 15:24:01'!
isTied
	
	^ state isTied! !

!TicTacToe methodsFor: 'as yet unclassified' stamp: 'HAW 10/25/2017 15:56:16'!
playerOPositions
	^ playerOPositions copy.! !

!TicTacToe methodsFor: 'as yet unclassified' stamp: 'HAW 10/25/2017 15:56:32'!
playerXPositions
	^ playerXPositions copy.! !

!TicTacToe methodsFor: 'as yet unclassified' stamp: 'HAW 10/25/2017 13:08:26'!
putOAt: aPosition

	state putOAt: aPosition! !

!TicTacToe methodsFor: 'as yet unclassified' stamp: 'jg 5/20/2018 14:46:22'!
putOWhenPlayingOAt: aPosition
	self assertIsFree: aPosition.
	self
		add: aPosition
		to: playerOPositions
		nextPlayerState: PlayingX
		winnerState: PlayerOWon.! !

!TicTacToe methodsFor: 'as yet unclassified' stamp: 'HAW 10/25/2017 13:10:00'!
putOWhenPlayingXAt: aPosition

	self error: self class notOTurnErrorMessage ! !

!TicTacToe methodsFor: 'as yet unclassified' stamp: 'HAW 10/25/2017 13:04:12'!
putXAt: aPosition

	state putXAt: aPosition! !

!TicTacToe methodsFor: 'as yet unclassified' stamp: 'HAW 10/25/2017 13:07:27'!
putXWhenPlayingOAt: aPoint 
	
	self error: self class notXTurnErrorMessage! !

!TicTacToe methodsFor: 'as yet unclassified' stamp: 'HAW 10/25/2017 15:50:52'!
putXWhenPlayingXAt: aPosition
	self assertIsFree: aPosition.
	self
		add: aPosition
		to: playerXPositions
		nextPlayerState: PlayingO
		winnerState: PlayerXWon.! !

!TicTacToe methodsFor: 'as yet unclassified' stamp: 'HAW 5/31/2018 00:17:14'!
shouldBeTied

	^ playerXPositions size = 5 
		and: [ playerOPositions size = 4 
		and: [ self hasPlayerXWon not
		" and: [ self YHasWon not ]]]" ]].! !

!TicTacToe methodsFor: 'as yet unclassified' stamp: 'HAW 10/25/2017 15:42:22'!
stateAfterAddingTo: positions with: nextPlayingState and: winnerState

	(self hasWin: positions) ifTrue: [^winnerState ].
	self shouldBeTied ifTrue: [ ^GameTied ].
	
	^nextPlayingState 
	! !

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


!classDefinition: #TicTacToeState category: #TicTacToe!
Object subclass: #TicTacToeState
	instanceVariableNames: 'game'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TicTacToe'!

!TicTacToeState methodsFor: 'as yet unclassified' stamp: 'HAW 10/25/2017 13:05:13'!
initializeFor: aGame

	game := aGame ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'TicTacToeState class' category: #TicTacToe!
TicTacToeState class
	instanceVariableNames: ''!

!TicTacToeState class methodsFor: 'as yet unclassified' stamp: 'HAW 10/25/2017 13:05:29'!
for: aTicTacToe 
	
	^self new initializeFor: aTicTacToe ! !


!classDefinition: #GameOverState category: #TicTacToe!
TicTacToeState subclass: #GameOverState
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TicTacToe'!


!classDefinition: #GameTied category: #TicTacToe!
GameOverState subclass: #GameTied
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TicTacToe'!

!GameTied methodsFor: 'as yet unclassified' stamp: 'HAW 10/25/2017 16:14:31'!
hasPlayerOWon
	^ false.! !

!GameTied methodsFor: 'as yet unclassified' stamp: 'HAW 10/25/2017 15:51:46'!
hasPlayerXWon
	^ false.! !

!GameTied methodsFor: 'as yet unclassified' stamp: 'HAW 10/25/2017 15:24:19'!
isOver
	
	^true! !

!GameTied methodsFor: 'as yet unclassified' stamp: 'HAW 10/25/2017 16:22:10'!
isPlayingO
	
	^false! !

!GameTied methodsFor: 'as yet unclassified' stamp: 'HAW 10/25/2017 16:22:02'!
isPlayingX
	
	^false! !

!GameTied methodsFor: 'as yet unclassified' stamp: 'HAW 10/25/2017 15:24:49'!
isTied
	
	^true! !

!GameTied methodsFor: 'as yet unclassified' stamp: 'HAW 10/25/2017 16:24:23'!
putOAt: aPosition

	game error: game class canNotPlayWhenGameIsOverErrorMessage ! !

!GameTied methodsFor: 'as yet unclassified' stamp: 'HAW 10/25/2017 16:25:03'!
putXAt: aPosition

	game error: game class canNotPlayWhenGameIsOverErrorMessage ! !


!classDefinition: #PlayerOWon category: #TicTacToe!
GameOverState subclass: #PlayerOWon
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TicTacToe'!

!PlayerOWon methodsFor: 'as yet unclassified' stamp: 'HAW 10/25/2017 16:14:31'!
hasPlayerOWon
	^ true.! !

!PlayerOWon methodsFor: 'as yet unclassified' stamp: 'HAW 10/25/2017 15:51:46'!
hasPlayerXWon
	^ false.! !

!PlayerOWon methodsFor: 'as yet unclassified' stamp: 'HAW 10/25/2017 13:15:14'!
putXAt: aPosition

	game error: game class canNotPlayWhenGameIsOverErrorMessage ! !


!classDefinition: #PlayerXWon category: #TicTacToe!
GameOverState subclass: #PlayerXWon
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TicTacToe'!

!PlayerXWon methodsFor: 'as yet unclassified' stamp: 'HAW 10/25/2017 16:14:31'!
hasPlayerOWon
	^ false.! !

!PlayerXWon methodsFor: 'as yet unclassified' stamp: 'HAW 10/25/2017 15:51:46'!
hasPlayerXWon
	^ true.! !

!PlayerXWon methodsFor: 'as yet unclassified' stamp: 'HAW 10/25/2017 15:25:33'!
isOver
	
	^true! !

!PlayerXWon methodsFor: 'as yet unclassified' stamp: 'HAW 10/25/2017 16:21:10'!
isPlayingO
	
	^false! !

!PlayerXWon methodsFor: 'as yet unclassified' stamp: 'HAW 10/25/2017 16:21:01'!
isPlayingX
	
	^false! !

!PlayerXWon methodsFor: 'as yet unclassified' stamp: 'HAW 10/25/2017 15:25:44'!
isTied
	
	^false! !

!PlayerXWon methodsFor: 'as yet unclassified' stamp: 'HAW 10/25/2017 13:14:04'!
putOAt: aPosition

	game error: game class canNotPlayWhenGameIsOverErrorMessage ! !

!PlayerXWon methodsFor: 'as yet unclassified' stamp: 'HAW 10/25/2017 16:26:45'!
putXAt: aPosition

	game error: game class canNotPlayWhenGameIsOverErrorMessage ! !


!classDefinition: #PlayingO category: #TicTacToe!
TicTacToeState subclass: #PlayingO
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TicTacToe'!

!PlayingO methodsFor: 'as yet unclassified' stamp: 'HAW 10/25/2017 16:14:31'!
hasPlayerOWon
	^ false.! !

!PlayingO methodsFor: 'as yet unclassified' stamp: 'HAW 10/25/2017 15:51:46'!
hasPlayerXWon
	^ false.! !

!PlayingO methodsFor: 'as yet unclassified' stamp: 'HAW 10/25/2017 13:31:36'!
isOver
	
	^false! !

!PlayingO methodsFor: 'as yet unclassified' stamp: 'HAW 10/25/2017 16:18:36'!
isPlayingO
	
	^true! !

!PlayingO methodsFor: 'as yet unclassified' stamp: 'HAW 10/25/2017 16:18:27'!
isPlayingX
	
	^false! !

!PlayingO methodsFor: 'as yet unclassified' stamp: 'HAW 10/25/2017 16:18:44'!
isTied
	
	^false! !

!PlayingO methodsFor: 'as yet unclassified' stamp: 'HAW 10/25/2017 13:08:45'!
putOAt: aPosition

	game putOWhenPlayingOAt: aPosition ! !

!PlayingO methodsFor: 'as yet unclassified' stamp: 'HAW 10/25/2017 13:06:42'!
putXAt: aPosition

	game putXWhenPlayingOAt: aPosition ! !


!classDefinition: #PlayingX category: #TicTacToe!
TicTacToeState subclass: #PlayingX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TicTacToe'!

!PlayingX methodsFor: 'as yet unclassified' stamp: 'HAW 10/25/2017 16:14:31'!
hasPlayerOWon
	^ false.! !

!PlayingX methodsFor: 'as yet unclassified' stamp: 'HAW 10/25/2017 15:51:46'!
hasPlayerXWon
	^ false.! !

!PlayingX methodsFor: 'as yet unclassified' stamp: 'HAW 10/25/2017 13:31:46'!
isOver
	
	^false! !

!PlayingX methodsFor: 'as yet unclassified' stamp: 'HAW 10/25/2017 16:17:50'!
isPlayingO
	
	^false! !

!PlayingX methodsFor: 'as yet unclassified' stamp: 'HAW 10/25/2017 16:17:23'!
isPlayingX
	
	^true! !

!PlayingX methodsFor: 'as yet unclassified' stamp: 'HAW 10/25/2017 16:14:14'!
isTied
	
	^false! !

!PlayingX methodsFor: 'as yet unclassified' stamp: 'HAW 10/25/2017 13:09:39'!
putOAt: aPosition

	game putOWhenPlayingXAt: aPosition ! !

!PlayingX methodsFor: 'as yet unclassified' stamp: 'HAW 10/25/2017 13:06:03'!
putXAt: aPosition

	game putXWhenPlayingXAt: aPosition ! !
