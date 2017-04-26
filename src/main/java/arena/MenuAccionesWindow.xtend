package arena

import appModel.InicioDeJuegoAppModel
import appModel.MapamundiAppModel
import appModel.MenuDeAccionesAppModel
import components.CustomSimpleWindow
import mapamundi.MapamundiWindow
import org.uqbar.arena.graphics.Image
import org.uqbar.arena.widgets.Button
import org.uqbar.arena.widgets.Label
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.windows.WindowOwner

/**
 * Ventana de menu principal de la aplicación
 */
class MenuAccionesWindow extends CustomSimpleWindow<MenuDeAccionesAppModel> {
	
	new(WindowOwner parent, MenuDeAccionesAppModel model) {
		super(parent, model)
		title = "¿Dónde Está Carmen SanDiego?"
	}
	
	override addActions(Panel actionsPanel) {
		
		new Button(actionsPanel) => [
			caption = "Resolver Misterio"
			onClick [
				modelObject.iniciarNuevaPartida
				new InicioDeJuegoWindow(this, new InicioDeJuegoAppModel(modelObject.repo)).open 
			]
			setAsDefault
		]

		new Button(actionsPanel) => [
			caption = "Mapamundi"
			onClick [
				val mapamundiAppModel=new MapamundiAppModel(modelObject.repo)
				new MapamundiWindow(this, mapamundiAppModel).open
			]
		]

		new Button(actionsPanel) => [
			caption = "Expedientes"
			onClick [
				//new ExpedienteEditableWindow(this, this.modelObject.expedienteAppModel).open
			]
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