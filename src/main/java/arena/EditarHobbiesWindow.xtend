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
import org.uqbar.arena.bindings.NotNullObservable

class EditarHobbiesWindow extends SimpleWindow<CarmenSanDiegoAppModel>{
	
	new(WindowOwner parent, CarmenSanDiegoAppModel model) {
		super(parent, model)
	}
	
	override protected addActions(Panel actionsPanel) {
		// No se usa
	}
	
	override protected createFormPanel(Panel mainPanel) {
		////////// TITULO
			var title = "Editar hobbies"
			new Label(mainPanel).text = "Hobbie"
		////////// LISTA
			val list = new org.uqbar.arena.widgets.List<String>(mainPanel) => [
			items <=> "villanoTemp.hobbies"
			
			value <=> "villanoCaracSeleccionada"
			]
		//////// BOTON ELIMINAR
			
			new Button(mainPanel) => [
			var senaSelec = new NotNullObservable("villanoCaracSeleccionada")
			caption = "Eliminar"
			onClick(|this.modelObject.eliminarHobbie)
			bindEnabled(senaSelec)
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
			onClick(|this.modelObject.agregarHobbie)
			]
		///////// BOTON ACEPTAR
			new Button(mainPanel) => [
				caption = "Aceptar"
				onClick(| this.close)
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
	