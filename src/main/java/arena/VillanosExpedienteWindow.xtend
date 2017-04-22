package arena

import org.uqbar.arena.windows.WindowOwner
import appModel.CarmenSanDiegoAppModel
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.layout.ColumnLayout
import org.uqbar.arena.widgets.Button
import org.uqbar.arena.Application

class VillanosExpedienteWindow extends VillanosWindow{
	
	new(WindowOwner parent, CarmenSanDiegoAppModel model) {
		super(parent, model)
	}
	
	override createFormPanel(Panel mainPanel){
		mainPanel.layout = new ColumnLayout(2)
		mainPanel.width  = 400
		createMainPanelVillanos(mainPanel)
		// Nuevo villano button
		new Button(editableLeftPanel) => [
			caption = "Nuevo"
		]
		// Editar villano button
		new Button(editableLeftPanel) => [
			caption = "Editar"
		]
		
	
		
	}
}

//////////////TODO: ESTO VUELAAAAAAAAAAAAAAAA

class VilExpApp extends Application{
	
	override protected createMainWindow() {
		var appModel  = new CarmenSanDiegoAppModel
		new VillanosExpedienteWindow(this, appModel)
		
	}
	
	def static main(String[] args) {
		new VilExpApp().start
	}
	

	
	}