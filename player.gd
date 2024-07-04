extends KinematicBody2D


var speed = 15
var jumpForce = 400
var gravity = 400
var vel = Vector2()
var dm = "res://lose.tscn"
onready var imageplayer = get_node("Player")

func _physics_process(delta):
	if Input.is_action_pressed("player_left"):
		vel.x -= speed
	elif Input.is_action_pressed("player_right"):
		vel.x += speed
		
	vel.y += gravity * delta
	
	if Input.is_action_pressed("player_jump") and is_on_floor():
		vel.y -= jumpForce
	vel = move_and_slide(vel, Vector2.UP)

	if vel.x <0:
		imageplayer.flip_h = true
	if vel.x >0:
		imageplayer.flip_h = false
	
func on_death():
	get_tree().change_scene(dm)
	self.queue_free()
