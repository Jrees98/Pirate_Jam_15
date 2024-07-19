extends Area2D

signal wagon_entered

func _on_body_entered(body):
	wagon_entered.emit() 
