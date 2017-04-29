package expediente

import appModel.EditarCaracteristicaVillanoAppModel
import appModel.EditarVillanoAppModel
import components.CustomSimpleWindow
import components.LabeledSelector
import components.LabeledTextBox
import components.VillanoCaracteristicasList
import org.uqbar.arena.graphics.Image
import org.uqbar.arena.widgets.Button
import org.uqbar.arena.widgets.Label
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.windows.WindowOwner

class EditarVillanoWindow extends CustomSimpleWindow<EditarVillanoAppModel>{
		
		new(WindowOwner parent, EditarVillanoAppModel model, String windowTitle) {
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

	//// List label
		new Label(mainPanel).text = "Señas"
	//// Senas list
		new VillanoCaracteristicasList(mainPanel,"villanoTemp.senasParticulares", "senaSeleccionada")
			///// Button
		new Button(mainPanel) => [
			caption = "Editar señas particulares"
			onClick[| 
				val editCaracVillano= new EditarCaracteristicaVillanoAppModel(modelObject.repo, modelObject.villanoTemp)
				new EditarSenasParticularesWindow(this, editCaracVillano).open
			]
		] 

	//// List label
		new Label(mainPanel).text = "Hobbie"
	//// Hobbie list
		new VillanoCaracteristicasList(mainPanel,"villanoTemp.hobbies", "hobbieSeleccionado" )
	//// Button
		new Button(mainPanel) => [
			caption = "Editar hobbies"
			onClick[| val editHobVillano= new EditarCaracteristicaVillanoAppModel(modelObject.repo, modelObject.villanoTemp)
				new EditarHobbiesWindow(this, editHobVillano).open]
			]
	}
}	
