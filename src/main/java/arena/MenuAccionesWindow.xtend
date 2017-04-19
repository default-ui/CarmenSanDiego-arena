package arena

import appModel.CarmenSanDiegoAppModel
import components.CustomSimpleWindow
import org.uqbar.arena.widgets.Button
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.windows.WindowOwner
import org.uqbar.arena.widgets.Label

class MenuAccionesWindow extends CustomSimpleWindow<CarmenSanDiegoAppModel> {
	
	new(WindowOwner owner, CarmenSanDiegoAppModel model) {
		super(owner, model)
		title = "¿Dónde Está Carmen SanDiego?"
	}
	
	override addActions(Panel actionsPanel) {
		
		new Button(actionsPanel) => [
			caption = "Resolver Misterio"
			setAsDefault
		]

		new Button(actionsPanel) => [
			caption = "Mapamundi"
		]

		new Button(actionsPanel) => [
			caption = "Expedientes"
		]

	}
	
	override createFormPanel(Panel mainPanel) {
		new Label(mainPanel).text = "¿Qué haremos ahora, Detective?"
	}
	
}