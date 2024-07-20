extends Area2D

var backpack1_cost := 50



func _on_backpack_1_mouse_entered():
	$CanvasLayer/Panel/Backpack1/ButtonSprite/Border1.show()
	$CanvasLayer/Panel/Backpack1/Timer.start()


func _on_backpack_1_mouse_exited():
	var border1 = $CanvasLayer/Panel/Backpack1/ButtonSprite/Border1
	border1.visible = not border1.visible
	$CanvasLayer/Panel/Backpack1/Timer.stop()


func _on_backpack_1_pressed():
	if  Global.total_coins >= backpack1_cost:
		Global.personal_inventory_size = 10
		$CanvasLayer/Panel/Backpack1.queue_free()


func _on_timer_timeout():
	var border1 = $CanvasLayer/Panel/Backpack1/ButtonSprite/Border1
	border1.visible = not border1.visible


func _on_body_entered(body):
	$CanvasLayer.show()


func _on_body_exited(body):
	$CanvasLayer.hide()
