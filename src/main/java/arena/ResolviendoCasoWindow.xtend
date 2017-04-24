package arena

import appModel.CarmenSanDiegoAppModel
import carmenSanDiego.Pais
import components.CustomSimpleWindow
import components.Titulo
import org.uqbar.arena.Application
import org.uqbar.arena.bindings.PropertyAdapter
import org.uqbar.arena.layout.HorizontalLayout
import org.uqbar.arena.layout.VerticalLayout
import org.uqbar.arena.widgets.Button
import org.uqbar.arena.widgets.GroupPanel
import org.uqbar.arena.widgets.Label
import org.uqbar.arena.widgets.List
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.windows.WindowOwner

import static extension org.uqbar.arena.xtend.ArenaXtendExtensions.*
import components.LabeledLabel
import org.uqbar.arena.windows.SimpleWindow

class ResolviendoCasoWindow extends SimpleWindow<CarmenSanDiegoAppModel>{
	
	new(WindowOwner parent, CarmenSanDiegoAppModel model) {
		super(parent, model)
		title = "Resolviendo: Robo de " + model.juego.caso.objeto
	}
	
	override addActions(Panel actionsPanel) {
	}
	
	override createFormPanel(Panel mainPanel) {
		new Label(mainPanel) => [
			text = 'Estás en: '
			bindValueToProperty('juego.paisActual.nombre')
		]

		val upperPanel = new Panel(mainPanel)
		upperPanel.layout = new HorizontalLayout
		
		armarAccionesPanel(upperPanel)
		armarLugaresPanel(upperPanel)

		new Titulo(mainPanel, "Recorrido Criminal")
		new List<Pais>(mainPanel) => [
				width=40
				modelObject.juego.getRecorrido()
				(items <=> "juego.recorrido").adapter = new PropertyAdapter(Pais, "nombre")
//				value <=> "paisSeleccionado"
			]

		new Titulo(mainPanel, "Destinos Fallidos")
		new List<Pais>(mainPanel) => [
				width=40
				modelObject.juego.getFallidos()
				(items <=> "juego.fallidos").adapter = new PropertyAdapter(Pais, "nombre")
//				value <=> "paisSeleccionado"
			]

	}
	
	def private armarAccionesPanel(Panel containerPanel) {
		val accionesPanel = new GroupPanel(containerPanel)
		accionesPanel.layout = new VerticalLayout
		accionesPanel.setTitle('Acciones')
		
		new Button(accionesPanel) => [
			caption = "Orden De Arresto"
			onClick [|
				new EmitirOrdenDeArrestoWindow(this, this.modelObject).open
				]
		]
		
		new Label(accionesPanel) => [
			text = 'Orden emitida para: '
		]
		
		new Label(accionesPanel) => [
			bindValueToProperty('villanoDeNuevaOrdenDeArresto.nombre')
		]
		
		new Button(accionesPanel) => [
			caption = "Viajar"
			onClick [|
				new ViajarWindow(this, this.modelObject).open
				]
		]
		

		new Button(accionesPanel) => [
			caption = "Expedientes"
			onClick [|
				new ExpedienteWindow(this, this.modelObject).open
				]
		]
		
	}
	
	/**
	 * Genera el listado de botones para ver los lugares
	 */
	def private armarLugaresPanel(Panel containerPanel) {
		val lugaresPanel = new GroupPanel(containerPanel)
		lugaresPanel.layout = new VerticalLayout
		lugaresPanel.setTitle('Lugares')
		
		for(lugar : modelObject.juego.paisActual.lugares) {
			
			new Button(lugaresPanel) => [
				caption = lugar.nombre
				onClick [ | 
					modelObject.setLugarAbierto(lugar)
					new LugarWindow(this, this.modelObject).open
				]
			]
			
		}
		
	}	
}

/***********
 * PRUEBA***
 ***********/
 
class ResolviendoCasoApp extends Application{
	
	override protected createMainWindow() {
		new ResolviendoCasoWindow(this, new CarmenSanDiegoAppModel)		
	}
	
	def static main(String[] args) {
		new ResolviendoCasoApp().start
	}
	
}