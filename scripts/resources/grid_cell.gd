## Resource for holding Cell data
class_name Cell extends Resource

## List of Faces
enum Face {
	NORTH,	#0
	EAST,	#1
	SOUTH,	#2
	WEST	#3
}

## List of Terrains
enum Terrain {
	GRASS,	#0
	ROAD,	#1
	SAND,	#2
	WATER	#3
}

@export var img: Texture2D

@export var north_socket: Array[Terrain] = [
	Terrain.GRASS, Terrain.GRASS, Terrain.GRASS
]

@export var east_socket: Array[Terrain] = [
	Terrain.GRASS, Terrain.GRASS, Terrain.GRASS
]

@export var south_socket: Array[Terrain] = [
	Terrain.GRASS, Terrain.GRASS, Terrain.GRASS
]

@export var west_socket: Array[Terrain] = [
	Terrain.GRASS, Terrain.GRASS, Terrain.GRASS
]

## Sockets ordered clockwise
var faces : Array[Array] = [
	north_socket, east_socket, south_socket, west_socket
]

## Checks if this face matches the other's socket
## Other should be the other cell's list of faces
## Face should be the face on self that we are matching with
static func match(this: Array[Terrain], other: Array[Terrain]) -> bool: #TODO: CHANGE CELL, CAUSING DEFAULTS
	# Get the opposite face on the other cell
	var reverse: Array[Terrain] = other.duplicate(true)
	reverse.reverse()
	var pair: bool = this == reverse
	return this == reverse
