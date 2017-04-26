package arena

import appModel.MenuDeAccionesAppModel
import carmenSanDiego.CarmenSanDiegoRepo
import org.uqbar.arena.Application

/**
 * Punto de entrada de la aplicación
 */
class CarmenSanDiegoApplication extends Application {
	
	override protected createMainWindow() {
		
		new MenuAccionesWindow(this, new MenuDeAccionesAppModel(new CarmenSanDiegoRepo))
	}
	
	def static main(String[] args) {
		new CarmenSanDiegoApplication().start
	}
}