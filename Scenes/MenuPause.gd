extends Control

onready var scene_tree: = get_tree()
onready var pause_overlay: = get_node("ColorRect")
onready var pause_main = $ColorRect
onready var pause_controls = $ColorRect3

var paused: = false setget set_paused

func _unhandled_input(event):
	if event.is_action_pressed("pause"):
		$UseSfx.play()
		self.paused = not paused
		pause_controls.visible = false
		scene_tree.set_input_as_handled()

func set_paused(value: bool):
	paused = value
	scene_tree.paused = value
	pause_overlay.visible = value

func _on_pause_disable():
	set_process_unhandled_input(false)
	self.visible = false

func _on_restore_pause():
	set_process_unhandled_input(true)

func _process(delta):
	if paused == true:
		self.visible = true
	else:
		self.visible = false
