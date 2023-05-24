extends Area2D
@export var speed= 400.0
var screen_size=Vector2.ZERO

signal hit

func _ready():
	screen_size=get_viewport_rect().size
	hide()	
	
func _process(delta):
	var direction = Vector2.ZERO
	#create custome keyboard input entry 
	# move_left = keyboard( A )
	if Input.is_action_pressed('move_left'):
		direction.x-=1

	# move_right = keyboard( D )
	if Input.is_action_pressed('move_right'):
		direction.x+=1
	# move_up = keyboard( w )
	if Input.is_action_pressed('move_up'):
		direction.y-=1
	# move_up = keyboard( s )	
	if Input.is_action_pressed('move_down'):
		direction.y+=1
						
	if direction.length()>0:
		direction=direction.normalized()
		$AnimatedSprite2D.play()
	else:
		$AnimatedSprite2D.stop()
	# with this code we move the player without using the rotation
	position += direction * speed * delta
	position.x=clamp(position.x,0,screen_size.x)
	position.y=clamp(position.y,0,screen_size.y)
	if direction.x!=0:
		$AnimatedSprite2D.animation='right'
		$AnimatedSprite2D.flip_h = direction.x < 0 
		$AnimatedSprite2D.flip_v = false
	elif direction.y !=0:
		$AnimatedSprite2D.animation='up'
		$AnimatedSprite2D.flip_v = direction.y > 0
		
func start(new_position):
	position=new_position
	show()
	$CollisionShape2D.disabled=false
	
func _on_body_entered(body):
	hide()
	$CollisionShape2D.set_deferred("disabled",true)
	emit_signal("hit")
