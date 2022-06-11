Scriptname aaaSacrificeScript extends activemagiceffect  

ObjectReference Property pSpawnPoint  Auto  
Explosion Property SuccessFX  Auto  
Sound Property pSuccessSFX  Auto  
ObjectReference Property pSpawnPointFX  Auto  

Event OnEffectStart(Actor akTarget, Actor akCaster)
	If (Game.GetPlayer().GetAV("dragonsouls") > 2)
		pSpawnPoint.MoveTo(Game.GetPlayer())
		pSpawnPoint.PlaceAtMe(SuccessFX)
		pSpawnPointFX.MoveTo(pSpawnPoint, abMatchRotation = false)
		Utility.Wait(0.3)
		pSuccessSFX.Play(pSpawnPoint)
		Debug.Notification("The flow of time has been disrupted, opening a path back into Mundus.")
		Debug.Notification("DRAGON BREAK")
		Game.GetPlayer().DamageActorValue("dragonsouls", 3.0)
	Else
		Debug.Notification("You must capture more Dragon's soul to use Dragon Break.")
	EndIf
EndEvent



