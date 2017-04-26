package expediente

import appModel.ExpedienteAppModel
import carmenSanDiego.Villano
import org.uqbar.arena.layout.ColumnLayout
import org.uqbar.arena.widgets.Button
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.windows.WindowOwner
import appModel.ExpedienteAppModelNuevo
import org.uqbar.arena.Application
import carmenSanDiego.CarmenSanDiegoRepo

class ExpedienteEditableWindow extends ExpedienteWindow{
	
	new(WindowOwner parent, ExpedienteAppModelNuevo model) {
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
				this.modelObject.villanoTemp = modelObject.crearNuevoVillano
				new EditarVillanoWindow(this, new ExpedienteAppModel(modelObject.repo.expediente), "Expediente - Nuevo villano").open
			]
		]
		// Editar villano button
		new Button(editableLeftPanel) => [
			caption = "Editar"
			onClick[|
				new EditarVillanoWindow(this, new ExpedienteAppModel(modelObject.repo.expediente), "Expediente - Editar villano").open
			]
		]
		
	}
	
	override windowTitle(){
		"Expedientes"
	}
	
	}
	
	class VilExpAppp extends Application{
	
	override protected createMainWindow() {
		//var appModel  = new CarmenSanDiegoAppModel
		new ExpedienteEditableWindow(this, new ExpedienteAppModelNuevo(new CarmenSanDiegoRepo))
		
	}
	
	def static main(String[] args) {
		new VilExpAppp().start
	}
	
}

