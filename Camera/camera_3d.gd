extends Camera3D

@onready var ray_cast_3d: RayCast3D = $RayCast3D
@onready var ray_cast_distance: float = 100.0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_pressed("CameraLeft"):
		global_position -= Vector3(1, 0, 0)
	if Input.is_action_pressed("CameraRight"):
		global_position += Vector3(1, 0, 0)
	if Input.is_action_pressed("CameraForward"):
		global_position -= Vector3(0, 0, 1)
	if Input.is_action_pressed("CameraBack"):
		global_position += Vector3(0, 0, 1)
	if Input.is_action_pressed("CameraZoomIn"):
		global_position -= Vector3(0, 1, 0)
		print("zoom in")
	if Input.is_action_pressed("CameraZoomOut"):
		global_position += Vector3(0, 1, 0)
		
	var mouse_position: Vector2 = get_viewport().get_mouse_position()
	ray_cast_3d.target_position = project_local_ray_normal(mouse_position) * ray_cast_distance
	ray_cast_3d.force_raycast_update()
	
	if ray_cast_3d.is_colliding():
		var collision_point = ray_cast_3d.get_collision_point()
		print("collision point", collision_point)
