x = x + velo
y = y - yvelo
esquerda = -1
direita = 1

direitaPressionada = keyboard_check(vk_right) and !keyboard_check(vk_left)
esquerdaPressionada = keyboard_check(vk_left) and !keyboard_check(vk_right)
botaoSolto = !(keyboard_check(vk_right) or keyboard_check(vk_left))
ambosPressionados = keyboard_check(vk_right) and keyboard_check(vk_left)
pulo = keyboard_check(ord("Z"))
if keyboard_check(ord("X")){
	velomax = 4.0
	if place_meeting(x+velo*sign(velo)+2,y,obj_chao) or place_meeting(x+velo*sign(velo)-2,y,obj_chao){
		spriteatual = spr_marcowall
	}
	else {
		spriteatual = spr_marcospeed
	}
}
else {
	velomax = 2.0
	spriteatual = spr_marcorunnin
}
if botaoSolto or ambosPressionados {
	if velo > 0 {
		velo -= acelerate
	} else if velo != 0 {
		velo += acelerate
	}
	sprite_index = spr_marco
}

if direitaPressionada  {
	movePersonagem(direita)
}

if esquerdaPressionada {
	movePersonagem(esquerda)
}

function movePersonagem(lado){
	image_xscale = lado
	sprite_index = spriteatual
	if velo < velomax*lado {
		velo = velo + acelerate
	}
	if velo > velomax*lado {
		velo = velo - acelerate
	}
}
//							colisões
if place_meeting (x+velo,y,obj_chao){
	while place_meeting (x+sign(velo),y,obj_chao){
		x -= sign(velo)
	}
	velo = 0
	sprite_index = spriteatual
}
if !place_meeting (x,y+grav,obj_chao){
	if grav > maxgrav{
		grav += 0.5
	}
}
if place_meeting (x,y+grav+1,obj_rampa){
	while place_meeting (x,y+sign(grav),obj_rampa){
		y -= sign(grav)
	}
	grav = 0
	if pulo {
	grav = -10.0
	}
}
if place_meeting (x,y+grav+1,obj_chao){
	while place_meeting (x,y+sign(grav),obj_chao){
		y -= sign(grav)
	}
	grav = 0
	if pulo {
	grav = -10.0
	}
}
if place_meeting (x,y+grav-1,obj_chao){
	grav = 0
}
y += grav


