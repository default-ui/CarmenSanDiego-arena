package arena

import org.uqbar.arena.Application
import appModel.CarmenSanDiegoAppModel
import utils.DummyData

/**
 * Punto de entrada de la aplicación
 */
class CarmenSanDiegoApplication extends Application {
	
	override protected createMainWindow() {
		
		new MenuAccionesWindow(this, new CarmenSanDiegoAppModel)
	}
	
	def static main(String[] args) {
		new CarmenSanDiegoApplication().start
	}
}