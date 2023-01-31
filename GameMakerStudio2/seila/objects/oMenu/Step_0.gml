if keyboard_check_pressed(vk_up) {
	if opcao != 1 {
		opcao -= 1
	}
}
if keyboard_check_pressed(vk_down) {
	if opcao != 2 {
		opcao += 1
	}
}
if keyboard_check_pressed(ord("Z")) {
	if opcao = 1 {
		room_goto(Fase1)
	}
}
