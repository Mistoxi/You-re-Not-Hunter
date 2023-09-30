extends TileMap

func _ready():
	self.queue_free()
	
func randomQuadrantOrder():
	var rQO = ["playerSpawn", "SafeZone", "mobSpawn", "exit"]
	for _i in range(4):
		rQO.insert(randi()%4, rQO[-1])
		rQO.resize(rQO.size() - 1)
	print(rQO)
