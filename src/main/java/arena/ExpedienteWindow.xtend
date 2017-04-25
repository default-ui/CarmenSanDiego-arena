package arena

import appModel.CarmenSanDiegoAppModel
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
import appModel.ExpedienteAppModel

class ExpedienteWindow extends CustomSimpleWindow<ExpedienteAppModel> {
	
	@Accessors
	Panel editableLeftPanel
	
	new(WindowOwner parent, ExpedienteAppModel model) {
		super(parent, model)
		title = windowTitle
		
	}
	
	override addActions(Panel actionsPanel) {
		// no se usa
	}
	
	override createFormPanel(Panel mainPanel) {
		mainPanel.layout = new ColumnLayout(2)
		mainPanel.width  = 600
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
		villanoList(editableLeftPanel, "expediente.villanos", "nombre", "villanoTemp")
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
		new VillanoCaracteristicasList(rightPanel, "villanoTemp.senasParticulares")
	//// Hobbbies
		new Label(rightPanel).text = "Hobbies:"
		new VillanoCaracteristicasList(rightPanel, "villanoTemp.hobbies")
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
		//// TODO factorizarlo en el appmodel porque estoy segura que s eusa en otro lado
		//"Resolviendo: Robo de " + modelObject.objeto + " - Expedientes"
		"Resolviendo"
	}
	
	
}
