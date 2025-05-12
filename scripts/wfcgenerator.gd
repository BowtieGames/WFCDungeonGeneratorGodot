class_name WFCGenerator extends TileMapLayer

## Array of Cells with information connecting sprite and sockets
## MUST be ordered the same as the TileSet
@export var cell_set: Array[Cell]


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	for y in range(20):
		for x in range(20):
			collapse(Vector2i(x, y))
	#set_cell(Vector2i(0,0), 0, Vector2i(randi_range(0, cell_set.size()), 0))
	# surface_tile_data.set_custom_data("ElementalState", new_element)
	#get_neighbor_cell(coords: Vector2i, neighbor: TileSet.CellNeighbor)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func collapse(coords: Vector2i, options: Array = range(cell_set.size())) -> void:
	var bad_options: Array[int]
	# Check north socket
	var north_neighbor = get_neighbor_cell(coords, TileSet.CELL_NEIGHBOR_TOP_SIDE)
	var index = get_cell_atlas_coords(north_neighbor).x
	if index != -1: 
		for option in options:
			# If the option doesn't match north_neighbor, remove it
			if !Cell.match(cell_set[option].north_socket, cell_set[index].south_socket):
				bad_options.append(option)
	# Remove bad_options from options
	for bad_option in bad_options:
			options.erase(bad_option)
	# Check east socket
	var east_neighbor = get_neighbor_cell(coords, TileSet.CELL_NEIGHBOR_RIGHT_SIDE)
	index = get_cell_atlas_coords(east_neighbor).x
	if index != -1: 
		for option in options:
			# If the option doesn't match north_neighbor, remove it
			if !Cell.match(cell_set[option].east_socket, cell_set[index].west_socket):
				bad_options.append(option)
	# Remove bad_options from options
	for bad_option in bad_options:
			options.erase(bad_option)
	# Check south socket
	var south_neighbor = get_neighbor_cell(coords, TileSet.CELL_NEIGHBOR_BOTTOM_SIDE)
	index = get_cell_atlas_coords(south_neighbor).x
	if index != -1: 
		for option in options:
			# If the option doesn't match north_neighbor, remove it
			if !Cell.match(cell_set[option].south_socket, cell_set[index].north_socket):
				bad_options.append(option)
	# Remove bad_options from options
	for bad_option in bad_options:
			options.erase(bad_option)
	# Check west socket
	var west_neighbor = get_neighbor_cell(coords, TileSet.CELL_NEIGHBOR_LEFT_SIDE)
	index = get_cell_atlas_coords(west_neighbor).x
	if index != -1: 
		for option in options:
			# If the option doesn't match north_neighbor, remove it
			if !Cell.match(cell_set[option].west_socket, cell_set[index].east_socket):
				bad_options.append(option)
	# Remove bad_options from options
	for bad_option in bad_options:
			options.erase(bad_option)
	# Randomly select from remaining options
	if options.size():
		set_cell(coords, 0, Vector2i(options.pick_random(), 0))

# Takes a list of possible Cells and selects one
func determine_cell(coords: Vector2i, options: Array[Cell]) -> void:
	set_cell(coords, 0, Vector2i(cell_set.find(options.pick_random()), 0))
