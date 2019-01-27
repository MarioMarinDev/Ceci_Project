
tag = "btn";

type = button.teleporter;
next_room = global.game_next_room;

if(global.game_state == game.win){
	text = "Continuar";
}else{
	text = "Regresar";
}