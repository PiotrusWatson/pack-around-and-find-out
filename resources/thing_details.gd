extends Resource
class_name WeightData
enum MaterialType {BOWL, FRUIT, PAPER, PLANT, TUNGSTEN, PLASTIC, CAST_IRON, RUBBER}

var material_to_density = {
	MaterialType.BOWL: 1.5,
	MaterialType.FRUIT: 0.01,
	MaterialType.PAPER: 0.4,
	MaterialType.PLANT: 2,
	MaterialType.TUNGSTEN: 4,
	MaterialType.PLASTIC: 0.5,
	MaterialType.CAST_IRON: 3,
	MaterialType.RUBBER: 0.2
}

@export var kilos: float
@export var material: MaterialType

func get_weight_from_size(scale_multiplier):
	return kilos + material_to_density[material] * scale_multiplier
	
func _init(kilos = 0, material = MaterialType.BOWL):
	self.kilos = kilos
	self.material = material
