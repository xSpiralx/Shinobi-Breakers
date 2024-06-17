puppet
	parent_type = /mob
	var/
		list/components = list("larm","rarm","lleg","rleg","core","head")

	proc/
		can_remove(component_type)
			if(component_type == "core")
				if(find_component("rarm") || find_component("rleg") ||find_component("larm") \
				|| find_component("lleg") || find_component("head")) return 0
			return 1

		find_component(component_type)
			return components[component_type]

		add_component(puppet_components/component)
			components[component.component_type] = component

		remove_component(puppet_components/component)
			components[component.component_type] = null

		calculate_stats()
			for(var/puppet_components/component in components)
				strength += component.strength
				endurance += component.endurance
				speed += component.speed
				agility += component.agility
				stamina += component.stamina
				control += component.control

puppet_components
	var/
		component_type
		list/additional_components = list()
		list/substitute_components = list()
	proc/
		add(puppet/body)
			if(!body.components.len) return
			if(!body.find_component(component_type)) return
			var/body_component = body.find_component(component_type)
			if(body_component != null) return
			body.add_component(src)
			body.calculate_stats()

		remove()
			if(!body.components.len) return
			if(!body.components.Find(component_type)) return
			var/body_component = body.find_component(component_type)
			if(!body_component) return
			body.remove_component(src)
			body.calculate_stats()
