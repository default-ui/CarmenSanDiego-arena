package arena

import org.uqbar.arena.Application
import org.uqbar.arena.windows.Window

class PaisesApplication extends Application {
	
	static def void main(String[] args) { 
		new PaisesApplication().start()
	}

	override protected Window<?> createMainWindow() {
		return new VerPaisesWindow(this, new VerPaises())
	}
	
}
