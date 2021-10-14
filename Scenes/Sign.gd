extends Area2D

onready var scene_tree: = get_tree()
onready var text_overlay: = $CanvasLayer/ColorRect

var condition = false

func _input(event):
	if overlaps_body($"/root/Global".player):
		if event.is_action_pressed("dive"):
			if condition == true:
				get_tree().paused = false
				text_overlay.visible = false
				condition = false
				$"/root/Global".player.Pause._on_restore_pause()
			else:
				condition = true
				get_tree().paused = true
				scene_tree.set_input_as_handled()
				text_overlay.visible = true
				$"/root/Global".player.Pause._on_pause_disable()
		
		if event.is_action_pressed("pause") and condition == true:
			get_tree().paused = false
			text_overlay.visible = false
			condition = false
			$"/root/Global".player.Pause._on_restore_pause()
			