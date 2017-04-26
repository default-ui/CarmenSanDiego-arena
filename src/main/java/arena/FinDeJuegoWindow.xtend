package arena

import components.CustomSimpleWindow
import appModel.CarmenSanDiegoAppModel
import org.uqbar.arena.windows.WindowOwner
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.widgets.Label
import org.uqbar.arena.widgets.Button
import java.util.List

class FinDeJuegoWindow extends CustomSimpleWindow<CarmenSanDiegoAppModel> {
	 
	 List<String> result
	 String buttonCaption
	
	new(WindowOwner parent, CarmenSanDiegoAppModel model, List<String> text, String buttonCapt) {
		super(parent, model)
		title = "Robo de " + modelObject.juego.caso.objeto + " - Resuelto"
		result = text
		buttonCaption = buttonCapt
	}
	
	override addActions(Panel actionsPanel) {
		new Button(actionsPanel) => [
			caption = buttonCaption
			setAsDefault 
			onClick [ | this.close

						
			]
		]
	}
	
	override createFormPanel(Panel mainPanel) {
		for (linea : result) {
			new Label(mainPanel) =>[
				text = linea
			]
		}
	}
}