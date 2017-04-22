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
		mainPanel.width  = 100
		editableLeftPanel = new Panel(mainPanel)
		//var editableLeftPanel = new Panel(mainPanel)
		var rightPanel = new Panel(mainPanel)
		rightPanel.width = 100
		editableLeftPanel.width = 100
	///////// Left panel
	////// titulo
		new Titulo(editableLeftPanel, "Villano")
	//////// lista
		new List<Villano>(editableLeftPanel) => [
			(items <=> "juego.expediente.villanos").adapter = new PropertyAdapter(Villano, "nombre")
			value <=> "villanoTemp"
			//height = 300
		]
	////// right panel
	////// nombreLabel
			labeledLabel(rightPanel, "Nombre: ", "villanoTemp.nombre")
	////// sexo label
			labeledLabel(rightPanel, "Sexo: ", "villanoTemp.sexo")
	
		
		
	}
	
	def labeledLabel(Panel panel, String textL1, String valueL2){
		var panelL = new Panel(panel)
		panelL.layout = new HorizontalLayout
		new Label(panelL).text = textL1
		new Label(panelL) => [
			value <=> valueL2
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