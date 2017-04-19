package arena

import appModel.CarmenSanDiegoAppModel
import components.CustomSimpleWindow
import org.uqbar.arena.widgets.Button
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.windows.WindowOwner
import org.uqbar.arena.widgets.Label
import org.uqbar.arena.graphics.Image


/**
 * Ventana de menu principal de la aplicación
 */
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
			onClick [ | new MapamundiComponentizadoWindow(this, this.modelObject).open ]
		]

		new Button(actionsPanel) => [
			caption = "Expedientes"
		]

	}
	
	override createFormPanel(Panel mainPanel) {
		
		new Label(mainPanel) => [
			
			bindImageToProperty("pathImagenIntro", [ imagePath |
				new Image(imagePath)
			])
			
		]
		
		new Label(mainPanel).text = "¿Qué haremos ahora, Detective?"
	}
	
}