extends Area2D
class_name HitBoxComponent

@export var health_component: HealthComponent
@export var stateMachine: StateMachine

func damage(attack):
	if health_component:
		health_component.damage(attack)


func _on_body_entered(body):
	if body.is_in_group("player_attack"):
		var current_state = stateMachine.current_state
		var currentStateNode = stateMachine.get_node("%s" % current_state)
		currentStateNode.Transition.emit(currentStateNode, "Follow")
		
