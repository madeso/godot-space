extends KinematicBody2D

var motion = Vector2()

func _physics_process(delta):
	motion.x = 0
	motion.y = 0
	var moved = false
	if Input.is_action_pressed("ui_right"):
		motion.x = 1
		moved = true
	if Input.is_action_pressed("ui_left"):
		motion.x = -1
		moved = true
	if Input.is_action_pressed("ui_up"):
		motion.y = -1
		moved = true
	if Input.is_action_pressed("ui_down"):
		motion.y = 1
		moved = true
	if moved:
		motion = motion.normalized()
	
	move_and_slide(motion * 50)

