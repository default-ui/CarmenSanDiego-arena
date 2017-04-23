package arena

import appModel.CarmenSanDiegoAppModel
import components.Titulo
import org.uqbar.arena.layout.VerticalLayout
import org.uqbar.arena.widgets.Button
import org.uqbar.arena.widgets.Label
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.windows.SimpleWindow
import org.uqbar.arena.windows.WindowOwner

class LugarWindow extends SimpleWindow<CarmenSanDiegoAppModel> {
	
	new(WindowOwner parent, CarmenSanDiegoAppModel model) {
		super(parent, model)
	}
	
	override protected addActions(Panel actionsPanel) {
		throw new UnsupportedOperationException("TODO: auto-generated method stub")
	}
	
	override protected createFormPanel(Panel mainPanel) {
		throw new UnsupportedOperationException("TODO: auto-generated method stub")
	}
	
	override createMainTemplate(Panel mainPanel) {
		this.title = "Resolviendo: Robo del " + modelObject.juego.caso.objeto
		mainPanel.layout = new VerticalLayout
		
		new Titulo(mainPanel, "Estas visitando: " + modelObject.lugarAbierto.nombre)

		new Label(mainPanel) => [
			text = modelObject.juego.pedirPista(
				modelObject.lugarAbierto, 
				modelObject.juego.caso.responsable,
				modelObject.juego.proximoPais,
				modelObject.juego.ordenDeArresto
			)
			height = 150
		]
		
		new Button(mainPanel) => [
			caption = "Continuar"
			setAsDefault 
			onClick [ | this.close ]
			]
	}
}