package expediente


import carmenSanDiego.Villano
import components.CustomSimpleWindow
import components.LabeledLabel
import components.Titulo
import components.VillanoCaracteristicasList
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.arena.bindings.PropertyAdapter
import org.uqbar.arena.layout.ColumnLayout
import org.uqbar.arena.widgets.Label
import org.uqbar.arena.widgets.List
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.windows.WindowOwner

import static extension org.uqbar.arena.xtend.ArenaXtendExtensions.*
import appModel.ExpedienteAppModelNuevo
import org.uqbar.arena.Application
import carmenSanDiego.CarmenSanDiegoRepo

class ExpedienteWindow extends CustomSimpleWindow<ExpedienteAppModelNuevo> {
	
	@Accessors
	Panel editableLeftPanel
	
	new(WindowOwner parent, ExpedienteAppModelNuevo model) {
		super(parent, model)
		title = windowTitle
		
	}
	
	override addActions(Panel actionsPanel) {
		// no se usa
	}
	
	override createFormPanel(Panel mainPanel) {
		//mainPanel.layout = new ColumnLayout(1)
		//mainPanel.width  = 1600
		createMainPanelVillanos(mainPanel)
	}
			
	def createMainPanelVillanos(Panel mainPanel){
		
		mainPanel.layout = new ColumnLayout(2)
		mainPanel.width  = 600
		
		editableLeftPanel = new Panel(mainPanel)
		var rightPanel = new Panel(mainPanel)
	/// Left panel
	//// Titulo
		new Titulo(editableLeftPanel, "Villano")
	//// Lista
		villanoList(editableLeftPanel, "repo.expediente.villanos", "nombre", "villanoTemp")
	/// Right panel
	//// Nombre
		new LabeledLabel(rightPanel) => [
			text = "Nombre:"
			bindValueToProperty("villanoTemp.nombre")
			label.fontSize = 10
			]
	//// Sexo
		new LabeledLabel(rightPanel) => [
			text = "Sexo:"
			bindValueToProperty("villanoTemp.sexo")
			label.fontSize = 10
			]
	//// Senas particulares
		new Label(rightPanel).text = "Señas pasrticulares:"
		new VillanoCaracteristicasList(rightPanel, "villanoTemp.senasParticulares", "senaSeleccionada")
	//// Hobbbies
		new Label(rightPanel).text = "Hobbies:"
		new VillanoCaracteristicasList(rightPanel, "villanoTemp.hobbies", "hobbieSeleccionado")
	}

		def villanoList(Panel panel, String item, String propertyAdapter, String listValue){
			new List<Villano>(panel) => [
			(items <=> item).adapter = new PropertyAdapter(Villano, propertyAdapter)
			value <=> listValue
			height = 300
		]
	}
	
	def caracteristicasList(Panel panel, String item){
			new List<Villano>(panel) => [
			items <=> item
			height = 100
			width = 100
		]
	}

	def windowTitle(){
		//"Resolviendo: Robo de " + modelObject.objeto + " - Expedientes"
		"Resolviendo: Robo de  - Expedientes"
	}
	
	
}

class VilExpApp extends Application{
	
	override protected createMainWindow() {
		//var appModel  = new CarmenSanDiegoAppModel
		new ExpedienteWindow(this, new ExpedienteAppModelNuevo(new CarmenSanDiegoRepo))
		
	}
	
	def static main(String[] args) {
		new VilExpApp().start
	}
	

	
	}

