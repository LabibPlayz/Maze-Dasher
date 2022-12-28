extends Area2D


func _ready():
	pass


func _on_Obstacles_body_entered(body):
	if body.name == "Player1":
		get_tree().reload_current_scene()
	if body.name == "Player2":
		get_tree().reload_current_scene()
	if body.name == "Player3":
		get_tree().reload_current_scene()


func _on_Obstacles2_body_entered(body):
	if body.name == "Player2":
		get_tree().reload_current_scene()
