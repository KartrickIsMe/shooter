extends Area2D

@export var speed = 1200
@export var lifeTime = 10
var direction
var velocity
var A_fire

func _ready() -> void:
	print("BULLET ENTERED THE SCENE")
	direction = Vector2.RIGHT.rotated(rotation)
	A_fire = $AnimatedFire
	velocity = direction * speed
	A_fire.play("default")
	var life_timer = Timer.new()
	life_timer.wait_time = lifeTime
	add_child(life_timer)
	life_timer.start()
	life_timer.timeout.connect(remove)

func _physics_process(delta: float) -> void:
	position += velocity * delta

func remove() -> void:
	queue_free()
