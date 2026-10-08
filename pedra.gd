extends Area3D

func _ready() -> void:
	body_entered.connect(_on_body_entered)

func _on_body_entered(body: Node3D) -> void:
	if body.name != "Player":
		return
	Inventory.add_item("pedra", 1)
	queue_free()
