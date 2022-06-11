Scriptname aaaDeathRecoveryScript4 extends ObjectReference  

ObjectReference Property pDeathMarkFX4  Auto  
Actor Property PlayerRef  Auto 
Explosion Property pTouchFX  Auto 
ObjectReference Property pDeathMark4  Auto  
GlobalVariable Property pLostSouls4  Auto
GlobalVariable Property pDeathVessel4  Auto  
ObjectReference Property pDeathStorage4  Auto  
Quest Property pMyQuest  Auto  

Event OnActivate(ObjectReference akActionRef)
     Int numLostSouls = pLostSouls4.GetValue() as Int
     If akActionRef == PlayerRef
	 PlayerRef.ModActorValue("dragonsouls", numLostSouls)
	 pLostSouls4.SetValue(0)
	 pDeathVessel4.SetValue(0)
	 pDeathMarkFX4.PlaceAtMe(pTouchFX)
	 pDeathStorage4.RemoveAllItems(Game.GetPlayer(), true)
	 pDeathMarkFX4.MoveToMyEditorLocation()
	 self.MoveToMyEditorLocation()
	 Debug.Notification("Anything your former vessel was carrying has been returned to you.")
	 debug.notification("YOU RECOVERED")
	 Utility.Wait(1)
	 pMyQuest.SetObjectiveDisplayed(24, False, True)
	 EndIf
EndEvent