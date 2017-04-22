package arena

import appModel.CarmenSanDiegoAppModel
import carmenSanDiego.OrdenDeArresto
import carmenSanDiego.Villano
import components.CustomSimpleWindow
import components.LabeledLabel
import components.LabeledSelector
import org.uqbar.arena.Application
import org.uqbar.arena.bindings.PropertyAdapter
import org.uqbar.arena.widgets.Button
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.windows.WindowOwner
import org.uqbar.arena.widgets.Selector
import static extension org.uqbar.arena.xtend.ArenaXtendExtensions.*

class EmitirOrdenDeArrestoWindow extends CustomSimpleWindow<CarmenSanDiegoAppModel>{
	
	new(WindowOwner parent, CarmenSanDiegoAppModel model) {
		super(parent, model)
		title = "Nueva Orden de Arresto"
	}
	
	override addActions(Panel actionsPanel) {
		new Button(actionsPanel) => [
			caption = "Emitir Orden De Arresto"
			setAsDefault
			onClick [
				var nuevaOrdenDeArresto = new OrdenDeArresto(modelObject.villanoDeNuevaOrdenDeArresto)
				modelObject.juego.ordenDeArresto = nuevaOrdenDeArresto
			]
		]
	}
	
	override createFormPanel(Panel mainPanel) {

		new LabeledLabel(mainPanel) => [
			text = 'Orden emitida para: '
			bindValueToProperty('juego.ordenDeArrestoString')
		]
		
		new LabeledSelector(mainPanel) => [
			bindValueToProperty('villanoDeNuevaOrdenDeArresto')
			
			val binding = bindItemsToProperty('expediente.villanos')
			binding.adapter = new PropertyAdapter(typeof(Villano), "nombre")

		]
		
	}
	
}

/***********
 * PRUEBA***
 ***********/
 
class EmitirOrdenDeArrestoApp extends Application{
	
	override protected createMainWindow() {
		new EmitirOrdenDeArrestoWindow(this, new CarmenSanDiegoAppModel)		
	}
	
	def static main(String[] args) {
		new EmitirOrdenDeArrestoApp().start
	}
	
}