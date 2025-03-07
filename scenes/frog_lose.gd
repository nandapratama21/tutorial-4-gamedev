extends RigidBody2D

@export var sceneName = "LoseScreen"


func _ready():
	# Make sure the fish can detect collisions
	contact_monitor = true
	max_contacts_reported = 4


func _on_body_entered(body):
	if body.name == "Player":
		get_tree().change_scene_to_file("res://scenes/LoseScreen.tscn")

	if body is TileMapLayer:
		queue_free()
