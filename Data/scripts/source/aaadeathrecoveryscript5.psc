Scriptname aaaDeathRecoveryScript5 extends ObjectReference  

ObjectReference Property pDeathMarkFX5  Auto  
Actor Property PlayerRef  Auto 
Explosion Property pTouchFX  Auto 
ObjectReference Property pDeathMark5  Auto  
GlobalVariable Property pLostSouls5  Auto
GlobalVariable Property pDeathVessel5  Auto  
ObjectReference Property pDeathStorage5  Auto  
Quest Property pMyQuest  Auto  

Event OnActivate(ObjectReference akActionRef)
     Int numLostSouls = pLostSouls5.GetValue() as Int
     If akActionRef == PlayerRef
	 PlayerRef.ModActorValue("dragonsouls", numLostSouls)
	 pLostSouls5.SetValue(0)
	 pDeathVessel5.SetValue(0)
	 pDeathMarkFX5.PlaceAtMe(pTouchFX)
	 pDeathStorage5.RemoveAllItems(Game.GetPlayer(), true)
	 pDeathMarkFX5.MoveToMyEditorLocation()
	 self.MoveToMyEditorLocation()
	 Debug.Notification("Anything your former vessel was carrying has been returned to you.")
	 debug.notification("YOU RECOVERED")
	 Utility.Wait(1)
	 pMyQuest.SetObjectiveDisplayed(25, False, True)
	 EndIf
EndEvent