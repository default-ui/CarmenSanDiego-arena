package expediente

import appModel.EditarVillanoAppModel
import appModel.ExpedienteAppModelNuevo
import carmenSanDiego.Villano
import org.uqbar.arena.layout.ColumnLayout
import org.uqbar.arena.widgets.Button
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.windows.WindowOwner

class ExpedienteEditableWindow extends ExpedienteWindow{
	
	new(WindowOwner parent, ExpedienteAppModelNuevo model) {
		super(parent, model)	
	}
	
	override createFormPanel(Panel mainPanel){
		
		mainPanel.layout = new ColumnLayout(1)
		mainPanel.width  = 1500
		
		createMainPanelVillanos(mainPanel)
		new Button(editableLeftPanel) => [
			caption = "Nuevo"
			onClick[|
				this.modelObject.villanoTemp = modelObject.crearNuevoVillano
				val editarVillanoAppModel=new EditarVillanoAppModel(modelObject.repo, new Villano(""))
				new EditarVillanoWindow(this, editarVillanoAppModel, "Expediente - Nuevo villano").open
			]
		]
		
		// Editar villano button
		new Button(editableLeftPanel) => [
			caption = "Editar"
			onClick[|
				val editarVillanoAppModel=new EditarVillanoAppModel(modelObject.repo, modelObject.villanoTemp)
				new EditarVillanoWindow(this, editarVillanoAppModel, "Expediente - Editar villano").open
			]
		]
	}
	
	override windowTitle(){
		"Expedientes"
	}
}

