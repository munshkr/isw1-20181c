Object subclass: #Address
	
	self subclassResponsibility! !
	self subclassResponsibility! !
	self subclassResponsibility! !
	self subclassResponsibility! !
	self subclassResponsibility! !
	self subclassResponsibility! !
	self subclassResponsibility! !
	^customers detect: [ :aCustomer | aCustomer identifiedAs: anIdentifycationType numbered: anIdentificationNumber ] ifNone: aBlockClosure! !