package expediente

import appModel.ExpedienteAppModel
import carmenSanDiego.Villano
import org.uqbar.arena.layout.ColumnLayout
import org.uqbar.arena.widgets.Button
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.windows.WindowOwner

class ExpedienteEditableWindow extends ExpedienteWindow{
	
	new(WindowOwner parent, ExpedienteAppModel model) {
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
