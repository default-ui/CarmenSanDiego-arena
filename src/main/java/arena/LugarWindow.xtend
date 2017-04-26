package arena

import appModel.CarmenSanDiegoAppModel
import components.CustomSimpleWindow
import components.Titulo
import org.uqbar.arena.layout.VerticalLayout
import org.uqbar.arena.widgets.Button
import org.uqbar.arena.widgets.Label
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.windows.WindowOwner

class LugarWindow extends CustomSimpleWindow<CarmenSanDiegoAppModel> {
	
	new(WindowOwner parent, CarmenSanDiegoAppModel model) {
		super(parent, model)
	}
	
	override addActions(Panel actionsPanel) {

		new Button(actionsPanel) => [
			caption = "Continuar"
			setAsDefault 
			onClick [ | this.close ]
		]
	}
	
	override createFormPanel(Panel mainPanel) {

		mainPanel.layout = new VerticalLayout		
		new Titulo(mainPanel, "Estas visitando: " + modelObject.lugarAbierto.nombre)

		new Label(mainPanel) => [
			text = modelObject.pistaActual
		]
	}

}