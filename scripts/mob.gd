extends CharacterBody2D

const SPEED = 300
var health = 3

@onready var player: CharacterBody2D = $"/root/Game/Player"
@onready var slime: Node2D = $Slime

func _ready() -> void:
	slime.play_walk()

func _physics_process(delta: float) -> void:
	var direction = global_position.direction_to(player.global_position)
	velocity = direction * SPEED
	move_and_slide()

func take_damage():
	const SMOKE_EXPLOSION = preload("res://smoke_explosion/smoke_explosion.tscn")
	
	health -= 1
	slime.play_hurt()
	
	if health == 0:
		var smoke = SMOKE_EXPLOSION.instantiate()
		smoke.global_position = global_position
		get_parent().add_child(smoke)
		queue_free()
