extends StaticBody2D

var Bullet = preload("res://RedBullet.tscn")
var bulletDamage = 5
var pathName
var currTargets = []
var curr


func _on_tower_body_entered(body:Node2D) -> void:
	if body.name == "Solider A":
		var tempArray = []
		currTargets = get_node("Tower").get_overlapping_bodies()

		for i in currTargets:
			if "Solider" in i.name:
				tempArray.append(i)

		var currTarget = null

		for i in tempArray:
			if currTarget == null:
				currTarget = i.get_node("../")
			else:
				if i.get_parent().get_progress() > currTarget.get_progress():
					currTarget = i.get_node("../")

		curr = currTarget
		pathName = currTarget.get_parent().name

		var tempBullet = Bullet.instantiate()
		tempBullet.pathName = pathName
		tempBullet.bulletDamage = bulletDamage
		get_node("BulletContainer").add_child(tempBullet)
		tempBullet.global_position = $Aim.global_position


func _on_tower_body_exited(_body:Node2D) -> void:
	pass
