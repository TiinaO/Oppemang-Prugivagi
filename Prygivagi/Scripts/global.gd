extends Node2D

var is_dragging = false
var skoor=0

var player_inventory: Inventory = preload("res://Inventory/InventoryItems/playerInventory.tres")
var picked_items: Array = []

#Sorteerimise taseme esemete koguse visualiseerimine
var total_items_collected := 0
var items_sorted := 0


