package arena

import appModel.CarmenSanDiegoAppModel
import carmenSanDiego.Pais
import components.LabeledLabel
import components.Titulo
import org.uqbar.arena.bindings.PropertyAdapter
import org.uqbar.arena.graphics.Image
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
import expediente.ExpedienteWindow
import carmenSanDiego.Lugar
import appModel.LugarAppModel
import appModel.ResolviendoCasoAppModel
import appModel.OrdenDeArrestoAppModel

class ResolviendoCasoWindow extends SimpleWindow<ResolviendoCasoAppModel>{
	
	new(WindowOwner parent, ResolviendoCasoAppModel model) {
		super(parent, model)
		title = "Resolviendo: Robo de " + model.repo.juego.caso.objeto
		
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
				modelObject.repo.juego.getRecorrido()
				(items <=> "juego.recorrido").adapter = new PropertyAdapter(Pais, "nombre")
			]

		new Titulo(mainPanel, "Destinos Fallidos")
		new List<Pais>(mainPanel) => [
				width=40
				height =100 
				modelObject.repo.juego.getFallidos()
				(items <=> "juego.fallidos").adapter = new PropertyAdapter(Pais, "nombre")
			]

	}
	
	def private armarAccionesPanel(Panel containerPanel) {
		val accionesPanel = new GroupPanel(containerPanel)
		accionesPanel.layout = new VerticalLayout
		accionesPanel.setTitle('Acciones')
		
		new Button(accionesPanel) => [
			caption = "Orden De Arresto"
			onClick [|
				new EmitirOrdenDeArrestoWindow(this, new OrdenDeArrestoAppModel(repo)).open
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
		modelObject.repo.lugaresPistas = modelObject.repo.juego.paisActual.lugares
		
		val lugaresPanel = new GroupPanel(containerPanel)
		lugaresPanel.layout = new VerticalLayout
		lugaresPanel.setTitle('Lugares')
		
		
		new Button(lugaresPanel) => [
				caption = modelObject.repo.lugaresPistas.get(0).nombre
				onClick [ | 
					new LugarWindow(this, crearLugarAppModel(modelObject.repo.lugaresPistas.get(0))).open
				]
		]
		new Button(lugaresPanel) => [
				caption = modelObject.repo.lugaresPistas.get(1).nombre
				onClick [ | 
					new LugarWindow(this, crearLugarAppModel(modelObject.repo.lugaresPistas.get(1))).open
				]
		]
		new Button(lugaresPanel) => [
				caption = modelObject.repo.lugaresPistas.get(2).nombre
				onClick [ | 
					new LugarWindow(this, crearLugarAppModel(modelObject.repo.lugaresPistas.get(2))).open
				]
		]
		
	}
	
	def private crearLugarAppModel(Lugar lugarAbierto) {
		new LugarAppModel(modelObject.repo, lugarAbierto)
	}

}