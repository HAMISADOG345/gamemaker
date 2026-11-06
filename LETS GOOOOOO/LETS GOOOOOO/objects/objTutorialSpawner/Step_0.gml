if startTutorialSpawner {
	//tutorial wave 1
	if tutorial1stspawn {
		if amount1st > 0 {
			amount1st--
			var varSpawnEnemy = instance_create_layer(x,y,"riftLayer",objSmartEnemy)
		}
	}
	//tutorial wave 2
	if amount1st <= 0 or instance_exists(objEnemyParent) {
		if amount2nd > 0 {
			amount2nd--
			var varSpawnEnemy = instance_create_layer(x,y,"riftLayer",objSmartEnemy)
		}
	}
}

if objGame.varDeath = true {
	instance_destroy(objEnemyParent)
	amount1st = 10
	tutorial1stspawn = true
	amount2nd = 3
}
