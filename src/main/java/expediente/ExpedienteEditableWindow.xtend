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
import appModel.EditarVillanoAppModel

class ExpedienteEditableWindow extends ExpedienteWindow{
	
	CarmenSanDiegoRepo repo
	
	new(WindowOwner parent, ExpedienteAppModelNuevo model, CarmenSanDiegoRepo juegoRepo) {
		super(parent, model)
		repo = juegoRepo
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
				new EditarVillanoWindow(this, 
					new EditarVillanoAppModel(repo, new Villano("")), "Expediente - Nuevo villano", repo
				).open
			]
		]
		// Editar villano button
		new Button(editableLeftPanel) => [
			caption = "Editar"
			onClick[|
				new EditarVillanoWindow(this, new EditarVillanoAppModel(repo, modelObject.villanoTemp), "Expediente - Editar villano", repo).open
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
		var  repo = new CarmenSanDiegoRepo
		new ExpedienteEditableWindow(this, new ExpedienteAppModelNuevo(repo), repo)
		
	}
	
	def static main(String[] args) {
		new VilExpAppp().start
	}
	
}

