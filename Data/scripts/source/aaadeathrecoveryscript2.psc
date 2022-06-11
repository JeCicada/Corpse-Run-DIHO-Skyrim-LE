Scriptname aaaDeathRecoveryScript2 extends ObjectReference  

ObjectReference Property pDeathMarkFX2  Auto  
Actor Property PlayerRef  Auto 
Explosion Property pTouchFX  Auto 
ObjectReference Property pDeathMark2  Auto  
GlobalVariable Property pLostSouls2  Auto
GlobalVariable Property pDeathVessel2  Auto  
ObjectReference Property pDeathStorage2  Auto  
Quest Property pMyQuest  Auto  

Event OnActivate(ObjectReference akActionRef)
     Int numLostSouls = pLostSouls2.GetValue() as Int
     If akActionRef == PlayerRef
	 PlayerRef.ModActorValue("dragonsouls", numLostSouls)
	 pLostSouls2.SetValue(0)
	 pDeathVessel2.SetValue(0)
	 pDeathMarkFX2.PlaceAtMe(pTouchFX)
	 pDeathStorage2.RemoveAllItems(Game.GetPlayer(), true)
	 pDeathMarkFX2.MoveToMyEditorLocation()
	 self.MoveToMyEditorLocation()
	 Debug.Notification("Anything your former vessel was carrying has been returned to you.")
	 debug.notification("YOU RECOVERED")
	 Utility.Wait(1)
	 pMyQuest.SetObjectiveDisplayed(22, False, True)
	 EndIf
EndEvent
  


