extends Node2D

var dm = "res://lose.tscn"

func _on_Area2D_body_entered(body):
	if body is KinematicBody2D:
		print("mega")
		get_tree().change_scene(dm)
