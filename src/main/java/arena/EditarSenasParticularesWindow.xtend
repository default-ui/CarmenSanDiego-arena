package arena

import org.uqbar.arena.windows.SimpleWindow
import appModel.CarmenSanDiegoAppModel
import org.uqbar.arena.windows.WindowOwner
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.Application
import org.uqbar.arena.widgets.Label
import static extension org.uqbar.arena.xtend.ArenaXtendExtensions.*
import org.uqbar.arena.widgets.Button
import org.uqbar.arena.widgets.TextBox
import org.uqbar.arena.layout.HorizontalLayout
import Exceptions.NoSeleccionadoException
import Exceptions.DatoNoIngresado

class EditarSenasParticularesWindow extends SimpleWindow<CarmenSanDiegoAppModel>{
	
	new(WindowOwner parent, CarmenSanDiegoAppModel model) {
		super(parent, model)
	}
	
	override protected addActions(Panel actionsPanel) {
		// No se usa
	}
	
	override protected createFormPanel(Panel mainPanel) {
		////////// TITULO
			var title = "Editar señas particulares"
			new Label(mainPanel).text = "Seña"
		////////// LISTA
			val list = new org.uqbar.arena.widgets.List<String>(mainPanel) => [
			items <=> "villanoTemp.senasParticulares"
			value <=> "villanoCaracSeleccionada"
			]
		//////// BOTON ELIMINAR
			new Button(mainPanel) => [
			caption = "Eliminar"
			onClick [ | 
				if(this.modelObject.villanoCaracSeleccionada==null){
					new NoSeleccionadoException().mostrarError
					throw new Exception();
				}
			this.modelObject.eliminarSena
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
		///////// BOTON ACEPTAR
			new Button(mainPanel) => [
				caption = "Aceptar"
				//onClick(|)
			]	
		]		
	}
	
}

 /////////////////////////////
 // ESTO VUELA ES SOLO PARA PRUEBAS
 
 
class EditarSenaApp extends Application{
	
	override protected createMainWindow() {
		var appModel  = new CarmenSanDiegoAppModel
		var vil = appModel.expediente.villanos.get(0)
		appModel.villanoTemp = vil 
		new EditarSenasParticularesWindow(this, appModel)
		
	}
	
	def static main(String[] args) {
		new EditarSenaApp().start
	}
	}