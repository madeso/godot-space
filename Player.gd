extends KinematicBody2D

var motion = Vector2()
var last_animation = 0

func _physics_process(delta):
	motion.x = 0
	motion.y = 0
	var moved = false
	var anim = 5
	if Input.is_action_pressed("ui_right"):
		motion.x = 1
		moved = true
		anim = 6
	if Input.is_action_pressed("ui_left"):
		motion.x = -1
		moved = true
		anim = 4
	if Input.is_action_pressed("ui_up"):
		motion.y = -1
		moved = true
	if Input.is_action_pressed("ui_down"):
		motion.y = 1
		moved = true
	if moved:
		motion = motion.normalized()
	if last_animation != anim:
		last_animation = anim
		if anim == 4:
			$Sprite.animation = "Left"
		if anim == 5:
			$Sprite.animation = "Default"
		if anim == 6:
			$Sprite.animation = "Right"
	move_and_slide(motion * 50)

