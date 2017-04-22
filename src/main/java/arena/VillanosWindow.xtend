package arena

import components.CustomSimpleWindow
import org.uqbar.arena.windows.WindowOwner
import org.uqbar.arena.widgets.Panel
import appModel.CarmenSanDiegoAppModel
import org.uqbar.arena.layout.ColumnLayout
import org.uqbar.arena.layout.VerticalLayout
import org.uqbar.arena.Application
import components.Titulo
import org.uqbar.arena.widgets.List
import carmenSanDiego.Villano
import static extension org.uqbar.arena.xtend.ArenaXtendExtensions.*
import org.apache.log4j.config.PropertyGetter.PropertyCallback
import org.uqbar.arena.bindings.PropertyAdapter
import components.LabeledLabel
import org.uqbar.arena.widgets.Label
import org.uqbar.arena.layout.HorizontalLayout
import org.uqbar.arena.widgets.tables.Table

class VillanosWindow extends CustomSimpleWindow<CarmenSanDiegoAppModel> {
	
	Panel editableLeftPanel
	
	new(WindowOwner parent, CarmenSanDiegoAppModel model) {
		super(parent, model)
		title = windowTitle
		
	}
	
	override addActions(Panel actionsPanel) {
		//throw new UnsupportedOperationException("TODO: auto-generated method stub")
	
	}
	
	override createFormPanel(Panel mainPanel) {
		mainPanel.layout = new ColumnLayout(2)
		mainPanel.width  = 400
		editableLeftPanel = new Panel(mainPanel)
		var rightPanel = new Panel(mainPanel)
///////// Left panel
	////// titulo
		new Titulo(editableLeftPanel, "Villano")
	//////// lista
		villanoList(editableLeftPanel, "juego.expediente.villanos", "nombre", "villanoTemp")
	////// right panel
	////// nombreLabel
		new LabeledLabel(rightPanel) => [
			text = "Nombre:"
			bindValueToProperty("villanoTemp.nombre")
			label.fontSize = 10
			]
	////// sexo label
		new LabeledLabel(rightPanel) => [
			text = "Sexo:"
			bindValueToProperty("villanoTemp.sexo")
			label.fontSize = 10
			]
	/////////senas particulares
		new Label(rightPanel).text = "Señas pasrticulares:"
		caracteristicasList(rightPanel, "villanoTemp.senasParticulares" )
	////////// hobbbies
		new Label(rightPanel).text = "Hobbies:"
		caracteristicasList(rightPanel, "villanoTemp.hobbies" )
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
	
//	override showOn(Object builder) {
//		throw new UnsupportedOperationException("TODO: auto-generated method stub")
//	}
	
}

class VilApp extends Application{
	
	override protected createMainWindow() {
		var appModel  = new CarmenSanDiegoAppModel
		//var vil = appModel.expediente.villanos.get(0)
		//appModel.villanoTemp = vil 
		new VillanosWindow(this, appModel)
		
	}
	
	def static main(String[] args) {
		new VilApp().start
	}
	

	
	}