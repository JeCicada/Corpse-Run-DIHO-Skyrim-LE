Scriptname aaaSetRespawnScript extends ObjectReference  

ObjectReference Property pSpawnPoint  Auto  
ObjectReference Property pSpawnPointFX  Auto  
Message Property pChoose  Auto  

Event OnActivate(ObjectReference akActionRef)
	If akActionRef == Game.GetPlayer()
		Int choice = pChoose.Show()
		If choice == 0
			pSpawnPoint.MoveTo(akActionRef)
			pSpawnPointFX.MoveTo(pSpawnPoint, abMatchRotation = false)
			Debug.Notification("A gap in the flow of time has been opened for your soul to seek refuge.")
			Debug.Notification("SOUL BOUND")
		Else
			;fuck it
		EndIf
	EndIf
EndEvent


