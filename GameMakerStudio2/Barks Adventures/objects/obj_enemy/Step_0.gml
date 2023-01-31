if place_meeting(x,y,obj_setenemyturn1) and turn != 1{
	turn = 1
}
if place_meeting(x,y,obj_setenemyturn2) and turn != 2{
	turn = 2
}
if turn = 1 {
	if place_meeting(x+enemyvelo,y,obj_enemyturn1){
		while place_meeting(x+sign(enemyvelo),y,obj_enemyturn1){
		enemyvelo = -enemyvelo
		}
			image_xscale = -sign(enemyvelo)
	}
}
if turn = 2 {
	if place_meeting(x+enemyvelo,y,obj_enemyturn2){
		while place_meeting(x+sign(enemyvelo),y,obj_enemyturn2){
		enemyvelo = -enemyvelo
		}
			image_xscale = -sign(enemyvelo)
	}
}
// AMOGUS
if place_meeting(x,y,obj_marco) {
	if obj_marco.y < other.y - obj_enemy.sprite_height/2 and obj_marco.grav > 0 {
		if keyboard_check(ord("Z")){
			obj_marco.grav = -7
		}
		else {
			obj_marco.grav = -4
		}
		other.hp -= 1
	}
	else {
		obj_marco.hp -= 1
	}
}
if hp = 0 {
	instance_destroy()
}
x += enemyvelo
if oGame.morto = 1 {
	image_index = 3
	image_speed = 0
	enemyvelo = 0
}