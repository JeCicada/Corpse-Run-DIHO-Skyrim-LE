Scriptname aaaDeathRecoveryScript extends ObjectReference  

Actor Property PlayerRef  Auto 
Actor Property pBones  Auto  
ObjectReference Property pDeathStorage  Auto   
ObjectReference Property pDeathMarkFX  Auto
Explosion Property pTouchFX  Auto  
GlobalVariable Property pLostSouls  Auto
Quest Property pMyQuest  Auto  
GlobalVariable Property pDeathVessel  Auto  

Event OnActivate(ObjectReference akActionRef)
	Int numLostSouls = pLostSouls.GetValue() as Int
	If akActionRef == PlayerRef
		PlayerRef.ModActorValue("dragonsouls", numLostSouls)
		pLostSouls.SetValue(0)
		pDeathVessel.SetValue(0)
		pDeathMarkFX.PlaceAtMe(pTouchFX)
		pDeathStorage.RemoveAllItems(Game.GetPlayer(), true)
		pDeathMarkFX.MoveToMyEditorLocation()
		self.MoveToMyEditorLocation()
		Debug.Notification("Anything your former vessel was carrying has been returned to you.")
		debug.notification("YOU RECOVERED")
		Utility.Wait(1)
		pBones.Resurrect()
		pBones.MoveToMyEditorLocation()
		pMyQuest.SetObjectiveDisplayed(21, False, True)
	Endif
Endevent 
