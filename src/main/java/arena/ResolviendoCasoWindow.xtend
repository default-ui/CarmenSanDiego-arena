package arena

import appModel.CarmenSanDiegoAppModel
import carmenSanDiego.Pais
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
import org.uqbar.arena.windows.SimpleWindow
import org.uqbar.arena.windows.WindowOwner

import static extension org.uqbar.arena.xtend.ArenaXtendExtensions.*
import org.uqbar.arena.graphics.Image
import components.LabeledLabel

class ResolviendoCasoWindow extends SimpleWindow<CarmenSanDiegoAppModel>{
	
	new(WindowOwner parent, CarmenSanDiegoAppModel model) {
		super(parent, model)
		title = "Resolviendo: Robo de " + model.juego.caso.objeto
		
	}
	
	override addActions(Panel actionsPanel) {
	}
	
	override createFormPanel(Panel mainPanel) {
		
		new Label(mainPanel) => [
			bindImageToProperty("pathImagenResolviendo", [ imagePath |
				new Image(imagePath)
			])
			
		]
		new LabeledLabel(mainPanel) => [
			text = "Estás en: "
			bindValueToProperty('juego.paisActual.nombre')
			
		]

		val upperPanel = new Panel(mainPanel)
		upperPanel.layout = new HorizontalLayout
		
		armarAccionesPanel(upperPanel)
		armarLugaresPanel(upperPanel)

		new Titulo(mainPanel, "Recorrido Criminal")
		new List<Pais>(mainPanel) => [
				width=40
				height =100 
				modelObject.juego.getRecorrido()
				(items <=> "juego.recorrido").adapter = new PropertyAdapter(Pais, "nombre")
//				value <=> "paisSeleccionado"
			]

		new Titulo(mainPanel, "Destinos Fallidos")
		new List<Pais>(mainPanel) => [
				width=40
				height =100 
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
				new ExpedienteWindow(this, this.modelObject.expedienteAppModel).open
				]
		]
		
	}
	
	/**
	 * Genera el listado de botones para ver los lugares
	 */
	def private armarLugaresPanel(Panel containerPanel) {
		//se setean los lugares accesibles en ese pais
		modelObject.lugaresPistas = modelObject.juego.paisActual.lugares
		
		val lugaresPanel = new GroupPanel(containerPanel)
		lugaresPanel.layout = new VerticalLayout
		lugaresPanel.setTitle('Lugares')
		
		
		new Button(lugaresPanel) => [
				caption = modelObject.lugaresPistas.get(0).nombre
				onClick [ | 
					modelObject.setLugarAbierto(modelObject.lugaresPistas.get(0))
					new LugarWindow(this, this.modelObject).open
				]
		]
		new Button(lugaresPanel) => [
				caption = modelObject.lugaresPistas.get(1).nombre
				onClick [ | 
					modelObject.setLugarAbierto(modelObject.lugaresPistas.get(1))
					new LugarWindow(this, this.modelObject).open
				]
		]
		new Button(lugaresPanel) => [
				caption = modelObject.lugaresPistas.get(2).nombre
				onClick [ | 
					modelObject.setLugarAbierto(modelObject.lugaresPistas.get(2))
					new LugarWindow(this, this.modelObject).open
				]
		]
		
		
	}	

}