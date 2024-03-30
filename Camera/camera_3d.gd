extends Camera3D


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
