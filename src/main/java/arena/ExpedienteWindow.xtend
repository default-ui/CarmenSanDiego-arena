package arena

import components.CustomSimpleWindow
import org.uqbar.arena.windows.WindowOwner
import org.uqbar.arena.widgets.Panel
import appModel.CarmenSanDiegoAppModel
import org.uqbar.arena.layout.ColumnLayout
import components.Titulo
import org.uqbar.arena.widgets.List
import carmenSanDiego.Villano
import static extension org.uqbar.arena.xtend.ArenaXtendExtensions.*
import org.uqbar.arena.bindings.PropertyAdapter
import components.LabeledLabel
import org.uqbar.arena.widgets.Label
import org.eclipse.xtend.lib.annotations.Accessors
import components.VillanoCaracteristicasList
import org.uqbar.arena.graphics.Image
import org.uqbar.arena.windows.SimpleWindow

class ExpedienteWindow extends CustomSimpleWindow<CarmenSanDiegoAppModel> {
	
	@Accessors
	Panel editableLeftPanel
	
	new(WindowOwner parent, CarmenSanDiegoAppModel model) {
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
		villanoList(editableLeftPanel, "juego.expediente.villanos", "nombre", "villanoTemp")
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
		"Resolviendo: Robo de " + modelObject.juego.obtenerObjeto + " - Expedientes"
		
	}
	
	
}
