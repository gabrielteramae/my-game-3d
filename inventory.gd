extends Node

var items: Dictionary = {}

signal item_added(item_name, total)

func add_item(item_name: String, amount: int = 1):
	if items.has(item_name):
		items[item_name] += amount
	else:
		items[item_name] = amount
	emit_signal("item_added", item_name, items[item_name])
	print("Inventário: ", items)
