package arena

import org.uqbar.arena.windows.WindowOwner
import appModel.CarmenSanDiegoAppModel
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.layout.ColumnLayout
import org.uqbar.arena.widgets.Button
import org.uqbar.arena.Application
import carmenSanDiego.Villano
import org.uqbar.arena.widgets.Label
import org.uqbar.arena.graphics.Image

class ExpedienteEditableWindow extends ExpedienteWindow{
	
	new(WindowOwner parent, CarmenSanDiegoAppModel model) {
		super(parent, model)
	}
	
	override createFormPanel(Panel mainPanel){
		mainPanel.layout = new ColumnLayout(2)
		mainPanel.width  = 500
		
		createMainPanelVillanos(mainPanel)
		// Nuevo villano button
		new Button(editableLeftPanel) => [
			caption = "Nuevo"
			onClick[|
				this.modelObject.villanoTemp = new Villano("")
				new EditarVillanoWindow(this, modelObject, "Expediente - Nuevo villano").open
			]
		]
		// Editar villano button
		new Button(editableLeftPanel) => [
			caption = "Editar"
			onClick[|
				new EditarVillanoWindow(this, modelObject, "Expediente - Editar villano").open
			]
		]
		
	}
	
	override windowTitle(){
		"Expedientes"
	}
	
}

//////////////TODO: ESTO VUELAAAAAAAAAAAAAAAA

class VilExpApp extends Application{
	
	override protected createMainWindow() {
		var appModel  = new CarmenSanDiegoAppModel
		new ExpedienteEditableWindow(this, appModel)
		
	}
	
	def static main(String[] args) {
		new VilExpApp().start
	}
	

	
	}