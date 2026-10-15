if startTutorialSpawner {
	//tutorial wave 1
	if tutorial1stspawn {
		if amount1st > 0 {
			amount1st--
			var varSpawnEnemy = instance_create_layer(x,y,"riftLayer",objSmartEnemy)
			varSpawnEnemy.varWillSpawnNone = true
			varSpawnEnemy.tutorial = true
		}
	}
	//tutorial wave 2
	if amount1st <= 0 or variable_instance_exists(objSmartEnemy,tutorial) {
		if amount2nd > 0 {
			amount2nd--
			var varSpawnEnemy = instance_create_layer(x,y,"riftLayer",objSmartEnemy)
			varSpawnEnemy.varWillSpawnHelmet = true
			varSpawnEnemy.tutorial = true
		}
	}
}

//pls add textbox
//on variable_instance_exists(<enemy>,tutorial) <-------