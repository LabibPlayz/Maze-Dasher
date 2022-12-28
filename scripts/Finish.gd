extends Area2D


func _ready():
	pass



func _on_Finish_body_entered(body):
	if body.name == "Player1":
		get_tree().change_scene("res://Level2.tscn")
	if body.name == "Player2":
		get_tree().change_scene("res://Level3.tscn")
	if body.name == "Player3":
		get_tree().change_scene("res://GameOver.tscn")
