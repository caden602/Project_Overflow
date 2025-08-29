extends ProgressBar

@export var player : Player
@export var gameTime : GameTime

func _ready():
	player.manaChanged.connect(update)
	update()

func update():
	value = player.currentMana * 100 / player.maxMana
