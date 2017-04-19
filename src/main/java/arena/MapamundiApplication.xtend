package arena

import appModel.MapamundiAppModel
import org.uqbar.arena.Application
import utils.DummyData

class MapamundiApplication extends Application {
	
	override protected createMainWindow() {
		val model = new MapamundiAppModel => [
			mapa = new DummyData().crearMapamundiDummy
			paisSeleccionado = mapa.paises.get(5)
		]
		new MapamundiComponentizadoWindow(this, model) 
	}
	
	def static void main(String[] args) {
		new MapamundiApplication().start()
	}
	
}
