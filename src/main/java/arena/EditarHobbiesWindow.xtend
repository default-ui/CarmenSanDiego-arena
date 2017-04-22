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
import Exceptions.DatoNoIngresado
import org.uqbar.arena.bindings.NotNullObservable
import org.uqbar.arena.graphics.Image
import Exceptions.NoSeleccionadoException
import components.VillanoCaracteristicasList
import components.CustomSimpleWindow
import org.uqbar.arena.windows.Dialog

class EditarHobbiesWindow extends Dialog<CarmenSanDiegoAppModel>{
	
	new(WindowOwner parent, CarmenSanDiegoAppModel model) {
		super(parent, model)
	}
	
	override addActions(Panel actionsPanel) {
		new Button(actionsPanel) => [
			caption = "Aceptar"
			setAsDefault 
			onClick [ | this.close ]
			]
	}
	
	override createFormPanel(Panel mainPanel) {
		////////// TITULO
			new Label(mainPanel) => [
			bindImageToProperty("pathImagenHobbies", [ imagePath |
				new Image(imagePath)
			])
			
		]
			new Label(mainPanel).text = "Hobbie"
		////////// LISTA
			new VillanoCaracteristicasList(mainPanel, "villanoTemp.hobbies")
			
		//////// BOTON ELIMINAR
			
			new Button(mainPanel) => [
			var senaSelec = new NotNullObservable("villanoCaracSeleccionada")
			caption = "Eliminar"
			onClick(|this.modelObject.eliminarHobbie)
			bindEnabled(senaSelec)
			]
//			onClick[|
// 				if(this.modelObject.villanoCaracSeleccionada==null){
// 				new NoSeleccionadoException().mostrarError
// 					throw new Exception();
// 				}
// 				this.modelObject.eliminarHobbie]
//
//			]
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
				this.modelObject.agregarHobbie
			]
			]		
	}
	
}

 /////////////////////////////
 // ESTO VUELA ES SOLO PARA PRUEBAS
 
 
class EditarHobApp extends Application{
	
	override protected createMainWindow() {
		var appModel  = new CarmenSanDiegoAppModel
		var vil = appModel.expediente.villanos.get(0)
		appModel.villanoTemp = vil 
		new EditarHobbiesWindow(this, appModel)
		
	}
	
	def static main(String[] args) {
		new EditarHobApp().start
	}
	
	}
	