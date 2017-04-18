package arena

import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.widgets.TextBox
import org.uqbar.arena.widgets.tables.Column
import org.uqbar.arena.widgets.tables.Table
import org.uqbar.arena.windows.ErrorsPanel
import org.uqbar.arena.windows.Window
import org.uqbar.arena.windows.WindowOwner
import carmenSanDiego.Pais

import static extension org.uqbar.arena.xtend.ArenaXtendExtensions.*

class VerPaisesWindow extends Window<VerPaises>{
	
	new(WindowOwner owner, VerPaises model) {
		super(owner, model)
	}
	
	override createContents(Panel mainPanel) {
		// Como setear un error panel con 2 l�neas
		new ErrorsPanel(mainPanel, "Paises Disponibles\n")
		
		new TextBox(mainPanel) => [
			value <=> "valorNuevo"
			enabled <=> "valorEnabled"	
		]
		
		val table = new Table<Pais>(mainPanel, typeof(Pais)) => [
			items <=> "paises"
			value <=> "paisSeleccionado"
			numberVisibleRows = 10
		]
		
		
		
		new Column<Pais>(table) => [
			title = "Nombre"
			fixedSize = 200
			bindContentsToProperty("nombre")
		]
	}
}