extends CharacterBody3D

@onready var navigation_agent_3d: NavigationAgent3D = $NavigationAgent3D

@export var speed: float = 2.0


func move_to_target_position(target_position: Vector3):
	navigation_agent_3d.target_position = target_position


func _ready() -> void:
	pass

func _physics_process(delta: float) -> void:
	var next_position = navigation_agent_3d.get_next_path_position()
	var direction = global_position.direction_to(next_position)
	
	if direction:
		velocity.x = direction.x * speed
		velocity.z = direction.z * speed
		
		move_and_slide()
