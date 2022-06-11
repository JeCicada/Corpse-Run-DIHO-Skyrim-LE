Scriptname aaaHijackDeathAlias extends ReferenceAlias

Actor Property pBones  Auto   
Actor Property PlayerRef  Auto 
Armor Property pAmulet  Auto  
Book Property pTome  Auto 
EffectShader Property decayEffect  Auto  
EffectShader Property decayEffect2  Auto
GlobalVariable Property pLostSouls  Auto  
Quest Property pMainQuest  Auto
Quest Property pMQSovngarde  Auto 
Quest Property pMQSovngarde2  Auto
Quest Property pWerewolfQuest  Auto 
Quest Property pMyQuest  Auto 
Sound Property pDeathFXSound  Auto 
SPELL Property pPower  Auto   
Idle property idlestoploose auto
Idle property bleedoutstart auto
Idle property bleedoutstop auto
ObjectReference Property fallBackSite  Auto 
ObjectReference Property fallBackSovn  Auto  
ObjectReference Property pSpawnPoint  Auto  
ObjectReference Property pDeathStorage  Auto  
ObjectReference Property pPanicStorage  Auto  
ObjectReference Property pDeathMark  Auto  
ObjectReference Property pDeathMarkFX  Auto    
ObjectReference Property pDeathMarkFX2  Auto  
ObjectReference Property pDeathMark2  Auto  
GlobalVariable Property pDeathVessel  Auto  
GlobalVariable Property pDeathVessel2  Auto  
ObjectReference Property pDeathStorage2  Auto  
GlobalVariable Property pLostSouls2  Auto  
GlobalVariable Property pLostSouls3  Auto  
GlobalVariable Property pLostSouls4  Auto  
GlobalVariable Property pLostSouls5  Auto  
ObjectReference Property pDeathMark3  Auto  
ObjectReference Property pDeathMark4  Auto  
ObjectReference Property pDeathMark5  Auto  
ObjectReference Property pDeathMarkFX3  Auto  
ObjectReference Property pDeathMarkFX4  Auto  
ObjectReference Property pDeathMarkFX5  Auto  
GlobalVariable Property pDeathVessel3  Auto  
GlobalVariable Property pDeathVessel4  Auto  
GlobalVariable Property pDeathVessel5  Auto  
ObjectReference Property pDeathStorage3  Auto  
ObjectReference Property pDeathStorage4  Auto  
ObjectReference Property pDeathStorage5  Auto  

Event OnInit()
	GetActorReference().StartDeferredKill()
	RegisterForSingleUpdate(1.0)
	Debug.Notification("You have been cursed...")
	pSpawnPoint.MoveTo(fallBackSite)
	If !pMyQuest.IsObjectiveDisplayed(10)
		pMyQuest.SetObjectiveDisplayed(10, True, False)
	EndIf
	GetActorReference().AddItem(pTome, 1)
EndEvent

Event OnPlayerLoadGame()
	If !GetActorReference().HasSpell(pPower)
		GetActorReference().AddSpell(pPower)
	EndIf
EndEvent

Event OnUpdate()
	If GetActorReference().GetAV("Health") <= 0
		Ded()
	Else
		RegisterForSingleUpdate(1.0)
		;Debug.Notification("Registering again...")
	EndIf
EndEvent

Function Ded()
	If pMainQuest.IsRunning()
		Debug.MessageBox("You haven't even finished the intro yet, dummy!")
		GetActorReference().EndDeferredKill()
	Else
		If pMQSovngarde.IsRunning() || pMQSovngarde2.IsRunning()
			pSpawnPoint.MoveTo(fallBackSovn)
		EndIf
		deathFX()
		Utility.Wait(5)
		If (Game.GetPlayer().GetItemCount(pAmulet) > 0)
			GetActorReference().RemoveItem(pAmulet, 1, true)
			reBirth(10)
			Debug.Notification("Your Amulet of Arkay crumbles to dust.")
		Else
			Death()
		EndIf
	EndIf
EndFunction

Function Death()
     If (pDeathVessel.GetValue() as Int == 0)
	 pDeathVessel.SetValue(1)
	 DeathVessel(1)
	 ElseIf (pDeathVessel2.GetValue() as Int == 0)
	 pDeathVessel2.SetValue(1)
	 DeathVessel(2)
	 ElseIf (pDeathVessel3.GetValue() as Int == 0)
	 pDeathVessel3.SetValue(1)
	 DeathVessel(3)
	 ElseIf (pDeathVessel4.GetValue() as Int == 0)
	 pDeathVessel4.SetValue(1)
	 DeathVessel(4)
	 ElseIf (pDeathVessel5.GetValue() as Int == 0)
	 pDeathVessel5.SetValue(1)
	 DeathVessel(5)
	 Else
	 DeathVessel(0)
	 EndIf
EndFunction

Function DeathVessel(Int Vessel)
            Int numSouls = GetActorReference().GetActorValue("dragonsouls") as Int
            If (Vessel == 1)	
			 If (numSouls > 0)
			     pLostSouls.SetValue(numSouls)
			     Game.GetPlayer().DamageActorValue("dragonsouls", numSouls)
			 EndIf
     		pDeathStorage.RemoveAllItems(pPanicStorage, true)
			GetActorReference().RemoveAllItems(pDeathStorage, true)
			pDeathMark.MoveTo(GetActorReference(), abMatchRotation = false)
			pDeathMarkFX.MoveTo(GetActorReference(), abMatchRotation = false) 
			pBones.MoveTo(pDeathMarkFX)
			pBones.Kill()
			reBirth(1)
			
			ElseIf (Vessel == 2)
			If (numSouls > 0)
			     pLostSouls2.SetValue(numSouls)
			     Game.GetPlayer().DamageActorValue("dragonsouls", numSouls)
			 EndIf
			pDeathStorage2.RemoveAllItems(pPanicStorage, true)
			GetActorReference().RemoveAllItems(pDeathStorage2, true)
			pDeathMark2.MoveTo(GetActorReference(), abMatchRotation = false)
			pDeathMarkFX2.MoveTo(GetActorReference(), abMatchRotation = false) 
			pBones.MoveTo(pDeathMarkFX)
			pBones.Kill()
			reBirth(2)
			
			ElseIf (Vessel == 3)
			If (numSouls > 0)
			     pLostSouls3.SetValue(numSouls)
			     Game.GetPlayer().DamageActorValue("dragonsouls", numSouls)
			 EndIf
			pDeathStorage3.RemoveAllItems(pPanicStorage, true)
			GetActorReference().RemoveAllItems(pDeathStorage3, true)
			pDeathMark3.MoveTo(GetActorReference(), abMatchRotation = false)
			pDeathMarkFX3.MoveTo(GetActorReference(), abMatchRotation = false) 
			pBones.MoveTo(pDeathMarkFX)
			pBones.Kill()
			reBirth(3)
			
			ElseIf (Vessel == 4)
			If (numSouls > 0)
			     pLostSouls4.SetValue(numSouls)
			     Game.GetPlayer().DamageActorValue("dragonsouls", numSouls)
			 EndIf
			pDeathStorage4.RemoveAllItems(pPanicStorage, true)
			GetActorReference().RemoveAllItems(pDeathStorage4, true)
			pDeathMark4.MoveTo(GetActorReference(), abMatchRotation = false)
			pDeathMarkFX4.MoveTo(GetActorReference(), abMatchRotation = false) 
			pBones.MoveTo(pDeathMarkFX)
			pBones.Kill()
			reBirth(4)
			
			ElseIf (Vessel == 5)
			If (numSouls > 0)
			     pLostSouls5.SetValue(numSouls)
			     Game.GetPlayer().DamageActorValue("dragonsouls", numSouls)
			 EndIf
			pDeathStorage5.RemoveAllItems(pPanicStorage, true)
			GetActorReference().RemoveAllItems(pDeathStorage5, true)
			pDeathMark5.MoveTo(GetActorReference(), abMatchRotation = false)
			pDeathMarkFX5.MoveTo(GetActorReference(), abMatchRotation = false) 
			pBones.MoveTo(pDeathMarkFX)
			pBones.Kill()
			reBirth(5)
			
			Else 
			If (numSouls > 0)
			     Game.GetPlayer().DamageActorValue("dragonsouls", numSouls)
			 EndIf
			GetActorReference().RemoveAllItems(pPanicStorage, true)
			reBirth(0)
			
			EndIf
EndFunction

Function deathFX()
	;Debug.MessageBox("Starting Death Effects")
	Game.DisablePlayerControls()	
	Game.ForceThirdPerson()
	If (pWerewolfQuest.GetCurrentStageID() < 100 && pWerewolfQuest.isRunning())
		pWerewolfQuest.SetCurrentStageID(100)
	ElseIf (pWerewolfQuest.isRunning())
		;I guess it will fix itself or something?
	EndIf
	GetActorReference().PlayIdle(bleedoutstart)
	Utility.Wait(3.5)	
	Debug.Notification("The barriers between worlds are no match for the soul of a Dragon!")
	GetActorReference().SetAlpha(0, true)
	decayEffect.Play(GetActorReference())
	Utility.Wait(2.0)
	decayEffect2.Play(GetActorReference(), 5.0)
	pDeathFXSound.Play(GetActorReference())
	Game.FadeOutGame(true, true, 5.0, 5.0)
EndFunction

Function reBirth(Int VesselMarker)
	GetActorReference().RestoreAV("Health", 9999999)
	;Debug.MessageBox("You should now be reborn")
	GetActorReference().MoveTo(pSpawnPoint)
	GetActorReference().PlayIdle(bleedoutstop)
	Game.GetPlayer().StopCombat()
	Game.GetPlayer().StopCombatAlarm()
	Utility.Wait(2)
	Game.EnablePlayerControls()	
	decayEffect.Stop(GetActorReference())
	decayEffect2.Stop(GetActorReference())
	GetActorReference().PlayIdle(idlestoploose)
	RegisterForSingleUpdate(1.0)
	;Debug.MessageBox("Update Registered.")
	Utility.Wait(10)
	GetActorReference().SetAlpha(1, true)
	
	    If (VesselMarker == 1)
		     pMyQuest.SetObjectiveDisplayed(21, True, True)
		ElseIf (VesselMarker == 2)
		     pMyQuest.SetObjectiveDisplayed(22, True, True)
		ElseIf (VesselMarker == 3)
		     pMyQuest.SetObjectiveDisplayed(23, True, True)
		ElseIf (VesselMarker == 4)
		     pMyQuest.SetObjectiveDisplayed(24, True, True)
		ElseIf (VesselMarker == 5)
		     pMyQuest.SetObjectiveDisplayed(25, True, True)
	    ElseIf(VesselMarker == 0)
		     Debug.MessageBox("You don't have any vacant Vessel. All your current Items has been lost.")
		EndIf
		
	    If (pDeathVessel.GetValue() as Int == 1 && pDeathVessel2.GetValue() as Int  == 1 && pDeathVessel3.GetValue() as Int == 1 && pdeathVessel4.GetValue() as Int == 1 && pDeathVessel5.GetValue() as Int == 1)
		 Debug.MessageBox("All your Vessels has been used. If you die without recovering a Vessel, you will lose your current Items.")
	EndIf
EndFunction

