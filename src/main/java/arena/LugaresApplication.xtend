package arena

import org.uqbar.arena.Application
import appModel.LugaresModel
import carmenSanDiego.Lugar
import carmenSanDiego.Caso
import carmenSanDiego.Biblioteca
import utils.DummyData

class LugaresApplication extends Application {
	
	override protected createMainWindow() {
		val model = new LugaresModel => [
			lugar = new Biblioteca()
			caso = DummyData.crearCasoDummy()
		]
		new LugarWindow(this, model) 
	}
	
	def static void main(String[] args) {
		new LugaresApplication().start()
	}
	
}