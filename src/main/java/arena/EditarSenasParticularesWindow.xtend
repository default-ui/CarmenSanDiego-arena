package arena

import appModel.CarmenSanDiegoAppModel
import org.uqbar.arena.windows.WindowOwner
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.widgets.Label
import static extension org.uqbar.arena.xtend.ArenaXtendExtensions.*
import org.uqbar.arena.widgets.Button
import org.uqbar.arena.widgets.TextBox
import org.uqbar.arena.layout.HorizontalLayout
import Exceptions.DatoNoIngresado
import org.uqbar.arena.bindings.NotNullObservable
import org.uqbar.arena.graphics.Image
import components.VillanoCaracteristicasList
import org.uqbar.arena.windows.Dialog

class EditarSenasParticularesWindow extends Dialog<CarmenSanDiegoAppModel>{
	
	new(WindowOwner parent, CarmenSanDiegoAppModel model) {
		super(parent, model)
	}
	
	override  addActions(Panel actionsPanel) {
		new Button(actionsPanel) => [
			caption = "Aceptar"
			setAsDefault 
			onClick [ | this.close ]
			]
	}
	
	override  createFormPanel(Panel mainPanel) {
		////////// TITULO
			new Label(mainPanel) => [
			bindImageToProperty("pathImagenSenas", [ imagePath |
				new Image(imagePath)
			])
			
		]
			new Label(mainPanel).text = "Seña"
		////////// LISTA
			new VillanoCaracteristicasList(mainPanel, "villanoTemp.senasParticulares")
		//////// BOTON ELIMINAR
			new Button(mainPanel) => [
			var senaSelec = new NotNullObservable("villanoCaracSeleccionada")
			bindEnabled(senaSelec)
			caption = "Eliminar"
			onClick(|this.modelObject.eliminarSena)

			]
		///////PANEL HORIZONTAL
			var textBoxPanel = new Panel(mainPanel).layout =  new HorizontalLayout
		/////// TEXTBOX
			new TextBox(textBoxPanel) => [
				value <=> "inputValue"
				width = 100
			]
		///// BOTON AGREGAR
			new Button(textBoxPanel) => [

			caption = "Agregar"
			width = 100
			onClick[|
				if (this.modelObject.inputValue=="" || this.modelObject.inputValue==null) {
					new DatoNoIngresado().mostrarError
					throw new Exception()
				}
				modelObject.agregarSena
					]
			]		
	}
	
}
