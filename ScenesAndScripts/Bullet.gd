extends Area2D

@export var speed: float = 1200.0
@export var lifeTime: int = 10
@onready var direction: Vector2 = Vector2.RIGHT.rotated(rotation)
@onready var A_fire = $AnimatedFire
var velocity


func _ready() -> void:
	print("BULLET ENTERED THE SCENE")
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

func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		return
	if body.has_method("hurt"):
		body.hurt()
	else:
		queue_free()
