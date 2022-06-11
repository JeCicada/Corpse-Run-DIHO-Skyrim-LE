Scriptname aaaDispenserScript extends ObjectReference  


Armor Property toAdd  Auto  

Event OnActivate(ObjectReference akActionRef)
	Game.GetPlayer().AddItem(toAdd, 1)
endEvent