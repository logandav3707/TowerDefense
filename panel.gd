extends Panel


@onready var tower = preload("res://RedBulletTower.tscn")
var currTile

func _on_gui_input(event:InputEvent) -> void:
	var tempTower = tower.instantiate()
	if event is InputEventMouseButton and event.button_mask == 1 and event.button_index == 1:
		
		add_child(tempTower)
		tempTower.process_mode = Node.PROCESS_MODE_DISABLED
		#Left click down
		tempTower.global_position = event.global_position
	elif event is InputEventMouseButton and event.button_mask == 0 and event.button_index == 1:
		#left click drag
		get_child(1).global_position = event.global_position

	elif event is InputEventMouseButton and event.button_mask == 0 and event.button_index == 1:
		#left click drag
		print("Left button Up")
