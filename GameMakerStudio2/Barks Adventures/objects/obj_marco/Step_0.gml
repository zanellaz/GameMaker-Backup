x = x + velo
esquerda = -1
direita = 1

if hp = 0 {
	instance_destroy(obj_marco)
}
if keyboard_check(ord("O")){
	hp -= 1
}

apertaZ = keyboard_check(ord("Z"))
direitaPressionada = keyboard_check(vk_right) and !keyboard_check(vk_left)
esquerdaPressionada = keyboard_check(vk_left) and !keyboard_check(vk_right)
botaoSolto = !(keyboard_check(vk_right) or keyboard_check(vk_left))
ambosPressionados = keyboard_check(vk_right) and keyboard_check(vk_left)
ladoPressionado = direitaPressionada - esquerdaPressionada
if keyboard_check(ord("X")){
	velomax = 4.0
	//if place_meeting(x+velo*sign(velo)+2,y,obj_chao) or place_meeting(x+velo*sign(velo)-2,y,obj_chao){
	//	spriteatual = spr_marcowall
	//}
	//else {
		spriteatual = spr_marcospeed
	//}
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
if place_meeting (x+velo+ladoPressionado,y,obj_chao){
	while place_meeting (x+sign(velo),y,obj_chao){
		x -= sign(velo)
	}
	velo = 0
	sprite_index = spriteatual
}
if !place_meeting (x,y+grav,obj_chao){
	if grav > maxgrav{
		grav += 0.3
	}
}
if place_meeting (x,y+grav,obj_chao) or place_meeting (x,y+grav,obj_rampa){
	grav = 0
	cancelapulo = 1
	if !apertaZ {
		podepular = true
	}
}
if !apertaZ {
	if grav < 0 and cancelapulo = 1{
		grav = grav/2
		cancelapulo = 0
	}
}
if apertaZ {
	if podepular = true {
		grav = -7
		podepular = false
	}
}
y += grav

// camera
_ver = keyboard_check(vk_down) - keyboard_check(vk_up);

if velo < -1.9 or velo > 1.9 {
	if direitaPressionada {
		if velocamera < 100 {
			velocamera += 2
		}
	}
	else if esquerdaPressionada{
		if velocamera > -100 {
		velocamera -= 2
		}
	}
}

_viewX = camera_get_view_x(view_camera[0]);
_viewY = camera_get_view_y(view_camera[0]);
_viewW = camera_get_view_width(view_camera[0]);
_viewH = camera_get_view_height(view_camera[0]);
_gotoX = x + (velocamera) - (_viewW * 0.5);
_gotoY = y + (_ver * 10) - (_viewH * 0.60);
_newX = lerp(_viewX, _gotoX, 0.1);
_newY = lerp(_viewY, _gotoY, 0.1);
if hp > 0 {
	camera_set_view_pos(view_camera[0], _newX, _newY);
}