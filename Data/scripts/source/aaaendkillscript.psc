Scriptname aaaEndKillScript extends ObjectReference  

Quest Property pCurseQuest  Auto  
ActorBase Property pPlayer  Auto
Message Property pChoice  Auto 

Event OnActivate(ObjectReference akActionRef)
	If akActionRef == Game.GetPlayer()
		Int choose = pChoice.Show()
		If choose == 0
			Game.DisablePlayerControls()
			pCurseQuest.Stop()	
			utility.wait(1)
			pPlayer.SetEssential(true)
			utility.wait(1)
			Game.GetPlayer().SetNoBleedoutRecovery(true)
			utility.wait(1)
			Game.GetPlayer().EndDeferredKill()
			utility.wait(5)
			Game.GetPlayer().SetNoBleedoutRecovery(false)
			Game.GetPlayer().damageAV("Health", 1)
			Game.GetPlayer().restoreAV("Health", 999)
			utility.wait(3)
			pPlayer.SetEssential(false)
			Game.EnablePlayerControls()
			Debug.MessageBox("The curse has been broken.  Return to Tamriel and save your game!")
		Else
			;break the script instead lol
		EndIf
	EndIf
endEvent


 
