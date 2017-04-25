package components

import carmenSanDiego.Villano
import org.uqbar.arena.widgets.Container
import org.uqbar.arena.widgets.List
import org.uqbar.arena.widgets.Panel

import static extension org.uqbar.arena.xtend.ArenaXtendExtensions.*

/*
 * Lista de caracteristicas de villanos (hobbies o senas particulares). Se factorizan porque se usan en varias
 * vistas.
 */

class VillanoCaracteristicasList extends Panel{
	
	new(Container container, String itemsList, String selecValue) {
		super(container)
		new List<Villano>(container) => [
			items <=> itemsList
			value <=> selecValue
			height = 100
			width = 100
		]
	
	
	}
	
	
}