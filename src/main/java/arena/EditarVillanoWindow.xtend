package arena

import components.CustomSimpleWindow
import appModel.CarmenSanDiegoAppModel
import org.uqbar.arena.windows.WindowOwner
import org.uqbar.arena.widgets.Panel
import components.LabeledTextBox
import components.LabeledSelector
import org.uqbar.arena.layout.HorizontalLayout
import org.uqbar.arena.widgets.Label
import org.uqbar.arena.widgets.Button
import components.VillanoCaracteristicasList
import appModel.ExpedienteAppModel
import org.uqbar.arena.graphics.Image
import org.uqbar.arena.layout.VerticalLayout

class EditarVillanoWindow extends CustomSimpleWindow<ExpedienteAppModel>{
	
	new(WindowOwner parent, ExpedienteAppModel model, String windowTitle) {
		//TODO: El titulo deberia estar hardcodeado en un appModel
		super(parent, model)
		title = windowTitle
	}
	
	override addActions(Panel actionsPanel) {
		new Button(actionsPanel) => [
			caption = "Aceptar"
			onClick[|
				if(modelObject.esNuevoVillano)
					this.modelObject.agregarVillano
				this.close
			]
		]
	}
	
	override createFormPanel(Panel mainPanel) {
		new Label(mainPanel) => [
			
			bindImageToProperty("pathImagenVillano", [ imagePath |
				new Image(imagePath)
			])
			
		]
	/// Label nombre
		new LabeledTextBox(mainPanel) => [
			text = "Nombre:"
			bindValueToProperty("villanoTemp.nombre")
		]
	/// Label Sexo
		new LabeledSelector(mainPanel) => [
			text = "Sexo:"
			bindItemsToProperty("gender")
			bindValueToProperty("villanoTemp.sexo")
		]
	/// Senas 

		
		new Label(mainPanel).text = "Señas Particulares"
		new VillanoCaracteristicasList(mainPanel,"villanoTemp.senasParticulares" )
		
		new Button(mainPanel) => [
			caption = "Editar señas particulares"
			onClick[| new EditarSenasParticularesWindow(this, modelObject, "pathImagenSenas", "Seña", "villanoTemp.senasParticulares").open]
		] 
		
	/// Hobbies 
	
		
		new Label(mainPanel).text = "Hobbie"
		new VillanoCaracteristicasList(mainPanel,"villanoTemp.hobbies" )
		
		new Button(mainPanel) => [
			caption = "Editar hobbies"
			onClick[| new EditarHobbiesWindow(this, modelObject, "pathImagenHobbies", "Hobbie", "villanoTemp.hobbies").open]
		] 
	}

}