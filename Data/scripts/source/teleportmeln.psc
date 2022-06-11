Scriptname TeleportMELN extends ObjectReference  

ObjectReference Property pDestn  Auto  

Event OnActivate(ObjectReference akActionRef)
	game.GetPlayer().MoveTo(pDestn)
EndEvent