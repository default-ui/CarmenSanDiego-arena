package arena

import org.uqbar.arena.windows.SimpleWindow
import appModel.LugaresModel
import org.uqbar.arena.windows.WindowOwner
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.layout.VerticalLayout
import org.uqbar.arena.widgets.Label
import components.Titulo
import static extension org.uqbar.arena.xtend.ArenaXtendExtensions.*

class LugarWindow extends SimpleWindow<LugaresModel> {
	
	new(WindowOwner parent, LugaresModel model) {
		super(parent, model)
	}
	
	override protected addActions(Panel actionsPanel) {
		throw new UnsupportedOperationException("TODO: auto-generated method stub")
	}
	
	override protected createFormPanel(Panel mainPanel) {
		throw new UnsupportedOperationException("TODO: auto-generated method stub")
	}
	
	override createMainTemplate(Panel mainPanel) {
		this.title = "Resolviendo: Robo del " + modelObject.caso.objeto
		mainPanel.layout = new VerticalLayout
		
		new Titulo(mainPanel, "Estas visitando: " + modelObject.lugar.nombre)

		//TODO pedir la pista del ocupante del pais actual.
		new Label(mainPanel) => [
			value <=> "juego"
		]
		
	}
}