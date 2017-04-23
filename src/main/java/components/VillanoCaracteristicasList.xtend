package components

import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.widgets.Container
import org.uqbar.arena.widgets.List
import carmenSanDiego.Villano
import static extension org.uqbar.arena.xtend.ArenaXtendExtensions.*
import org.uqbar.arena.bindings.PropertyAdapter

/*
 * Lista de caracteristicas de villamnos (hobbies o senas particulares). Se factorizan porque se usan en varias
 * vistas.
 */

class VillanoCaracteristicasList extends Panel{
	
	new(Container container, String itemsList) {
		super(container)
		new List<Villano>(container) => [
			items <=> itemsList
			value <=> "villanoCaracSeleccionada"
			height = 100
			width = 100
		]
	
	
	}
	
	
}