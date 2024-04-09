extends Camera3D

@onready var ray_cast_3d: RayCast3D = $RayCast3D
@export var ray_cast_distance: float = 100.0

@export var player: Node3D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	if Input.is_action_pressed("CameraLeft"):
		global_position -= Vector3(1, 0, 0)
	if Input.is_action_pressed("CameraRight"):
		global_position += Vector3(1, 0, 0)
	if Input.is_action_pressed("CameraForward"):
		global_position -= Vector3(0, 0, 1)
	if Input.is_action_pressed("CameraBack"):
		global_position += Vector3(0, 0, 1)
	if Input.is_action_just_released("CameraZoomIn"):
		global_position -= Vector3(0, 1, 0)
	if Input.is_action_just_released("CameraZoomOut"):
		global_position += Vector3(0, 1, 0)


	var mouse_position: Vector2 = get_viewport().get_mouse_position()
	ray_cast_3d.target_position = project_local_ray_normal(mouse_position) * ray_cast_distance
	ray_cast_3d.force_raycast_update()
	
	
	if Input.is_action_just_pressed("mouse_left_click") && ray_cast_3d.is_colliding():
		var collision_point = ray_cast_3d.get_collision_point()
		var collider = ray_cast_3d.get_collider()
		
		print(collider)
		
		if "settlement" in collider.get_groups():
			print("going to city: ", collider.name)
		
		player.move_to_target_position(collision_point)
