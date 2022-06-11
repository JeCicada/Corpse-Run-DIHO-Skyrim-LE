Scriptname aaaDeathRecoveryScript3 extends ObjectReference  

ObjectReference Property pDeathMarkFX3  Auto  
Actor Property PlayerRef  Auto 
Explosion Property pTouchFX  Auto 
ObjectReference Property pDeathMark3  Auto  
GlobalVariable Property pLostSouls3  Auto
GlobalVariable Property pDeathVessel3  Auto  
ObjectReference Property pDeathStorage3  Auto  
Quest Property pMyQuest  Auto  

Event OnActivate(ObjectReference akActionRef)
     Int numLostSouls = pLostSouls3.GetValue() as Int
     If akActionRef == PlayerRef
	 PlayerRef.ModActorValue("dragonsouls", numLostSouls)
	 pLostSouls3.SetValue(0)
	 pDeathVessel3.SetValue(0)
	 pDeathMarkFX3.PlaceAtMe(pTouchFX)
	 pDeathStorage3.RemoveAllItems(Game.GetPlayer(), true)
	 pDeathMarkFX3.MoveToMyEditorLocation()
	 self.MoveToMyEditorLocation()
	 Debug.Notification("Anything your former vessel was carrying has been returned to you.")
	 debug.notification("YOU RECOVERED")
	 Utility.Wait(1)
	 pMyQuest.SetObjectiveDisplayed(23, False, True)
	 EndIf
EndEvent