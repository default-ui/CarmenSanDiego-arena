package arena

import appModel.CarmenSanDiegoAppModel
import components.CustomSimpleWindow
import org.uqbar.arena.graphics.Image
import org.uqbar.arena.widgets.Button
import org.uqbar.arena.widgets.Label
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.windows.WindowOwner

/**
 * Ventana de menu principal de la aplicación
 */
class MenuAccionesWindow extends CustomSimpleWindow<CarmenSanDiegoAppModel> {
	
	new(WindowOwner parent, CarmenSanDiegoAppModel model) {
		super(parent, model)
		title = "¿Dónde Está Carmen SanDiego?"
	}
	
	override addActions(Panel actionsPanel) {
		
		new Button(actionsPanel) => [
			caption = "Resolver Misterio"
			onClick [ | 
				modelObject.juego.crearCaso()
				new InicioDeJuegoWindow(this, this.modelObject).open 
			]
			setAsDefault
		]

		new Button(actionsPanel) => [
			caption = "Mapamundi"
			onClick [ | new MapamundiWindow(this, this.modelObject.mapamundiAppModel).open ]
		]

		new Button(actionsPanel) => [
			caption = "Expedientes"
			onClick [ | new ExpedienteEditableWindow(this, this.modelObject.expedienteAppModel).open ]
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