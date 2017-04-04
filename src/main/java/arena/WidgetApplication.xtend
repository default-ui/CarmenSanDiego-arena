package arena

import org.uqbar.arena.Application
import org.uqbar.arena.windows.Window
import arena.MenuPrincipalWindow
import arena.MenuPrincipalModel

class WidgetApplication extends Application {
	
	static def void main(String[] args) { 
		new WidgetApplication().start()
	}

	override protected Window<?> createMainWindow() {
		return new MenuPrincipalWindow(this, new MenuPrincipalModel(this))
	}
	
}
