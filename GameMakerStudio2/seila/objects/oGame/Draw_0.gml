cameraX = camera_get_view_x(view_camera[0])
cameraY = camera_get_view_y(view_camera[0])
if morto = 1{
	draw_sprite(spr_respawntext,image_index,cameraX + cameraW /2, cameraY + cameraH/2)
	draw_text(cameraX + cameraW /2 - 5, cameraY + cameraH/2 + cameraH/15, "F")
	if keyboard_check(ord("F")){
		room_restart()
		morto = 0
	}
}