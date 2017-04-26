package arena

import components.CustomSimpleWindow
import components.Titulo
import org.uqbar.arena.layout.VerticalLayout
import org.uqbar.arena.widgets.Button
import org.uqbar.arena.widgets.Label
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.windows.WindowOwner
import appModel.LugarAppModel
import appModel.FinDeJuegoAppModel

class LugarWindow extends CustomSimpleWindow<LugarAppModel> {
	
	
	new(WindowOwner parent, LugarAppModel model) {
		super(parent, model)
	}
	
	override addActions(Panel actionsPanel) {

		new Button(actionsPanel) => [
			caption = "Continuar"
			setAsDefault 
			onClick [
				
				this.close
				
				if(modelObject.lugarAbierto.seEncuentraVillano){
					
					// caso victoria
					if(modelObject.lugarAbierto.detenido){
						new FinDeJuegoWindow(this, new FinDeJuegoAppModel(modelObject.repo), modelObject.victoria, modelObject.buttonVictoria, "pathImagenWon").open
					}
					
					// caso derrota por villano equivocado
					if(modelObject.villanoEquivocado){
						new FinDeJuegoWindow(this, new FinDeJuegoAppModel(modelObject.repo), modelObject.derrotaPorVillanoIncorrecto, modelObject.buttonDerrota, "pathImagenLost").open						
					}
					
					// caso sin orden de arresto
					if(modelObject.sinOrdenDeArresto){
						new FinDeJuegoWindow(this, new FinDeJuegoAppModel(modelObject.repo), modelObject.derrotaPorNoOrdenDeArresto, modelObject.buttonDerrota, "pathImagenLost").open
					}
				
				}						
			]
		]
	}
	
	override createFormPanel(Panel mainPanel) {

		mainPanel.layout = new VerticalLayout		
		new Titulo(mainPanel, "Estas visitando: " + modelObject.lugarAbierto.nombre)

		new Label(mainPanel) => [
			text = modelObject.pistaActual
		]
	}

}