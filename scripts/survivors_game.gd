extends Node2D

@onready var path_follow: PathFollow2D = %PathFollow2D
@onready var game_over: CanvasLayer = $GameOver

func spawn_mob() -> void:
	const MOB = preload("res://scenes/mob.tscn")
	var new_mob = MOB.instantiate()
	
	path_follow.progress_ratio = randf()
	new_mob.global_position = path_follow.global_position
	add_child(new_mob)


func _on_timer_timeout() -> void:
	spawn_mob()

func _on_player_health_depleted() -> void:
	game_over.visible = true
	get_tree().paused = true
