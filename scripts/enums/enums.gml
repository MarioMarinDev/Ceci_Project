/// enums

#region Game Enums
enum game {
	stop = -2,
	setup = -1,
	play = 1,
	win = 2,
	lose = 3,
	pre_play = 4,
	finish = 5,
}
#endregion

#region Button Object
enum button {
	simple = 0,
	teleporter = 1,
}
#endregion

#region Statement Object
enum statement {
	generating = 0,
	ready = 1,
	sizing = 2,
}
#endregion

#region Transition Object
enum transition {
	fade_out = 0,
	fade_in = 1,
}
#endregion