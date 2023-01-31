//geral
velo = 0
grav = 0
velomax = 1.0
acelerate = 0.5
maxgrav = -30
velocamera = velo
podepular = false
hp = 1
cancelapulo = 0
//teclas
esquerda = -1
direita = 1
apertaZ = keyboard_check(ord("Z"))
direitaPressionada = keyboard_check(vk_right) and !keyboard_check(vk_left)
esquerdaPressionada = keyboard_check(vk_left) and !keyboard_check(vk_right)
botaoSolto = !(keyboard_check(vk_right) or keyboard_check(vk_left))
ambosPressionados = keyboard_check(vk_right) and keyboard_check(vk_left)
ladoPressionado = direitaPressionada - esquerdaPressionada

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
//camera
_ver = keyboard_check(vk_down) - keyboard_check(vk_up);
_viewX = camera_get_view_x(view_camera[0]);
_viewY = camera_get_view_y(view_camera[0]);
_viewW = camera_get_view_width(view_camera[0]);
_viewH = camera_get_view_height(view_camera[0]);
_gotoX = x + (velocamera) - (_viewW * 0.5);
_gotoY = y + (_ver * 10) - (_viewH * 0.60);
_newX = lerp(_viewX, _gotoX, 0.1);
_newY = lerp(_viewY, _gotoY, 0.1);