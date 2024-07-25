extends Area2D


func _on_body_entered(body):
	$CanvasLayer.show()



func _on_body_exited(body):
	$CanvasLayer.hide()
