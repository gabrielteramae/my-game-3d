extends CanvasLayer

@onready var inventory_label = $InventoryLabel

func _ready():
	Inventory.item_added.connect(_on_item_added)
	update_label()

func _on_item_added(item_name, total):
	update_label()

func update_label():
	var pedra_count = Inventory.items.get("pedra", 0)
	inventory_label.text = "Pedra: " + str(pedra_count)
