package arena

import components.CustomSimpleWindow
import appModel.CarmenSanDiegoAppModel
import org.uqbar.arena.windows.WindowOwner
import org.uqbar.arena.widgets.Panel
import components.LabeledTextBox
import org.uqbar.arena.Application
import components.LabeledSelector
import org.uqbar.arena.layout.HorizontalLayout
import org.uqbar.arena.widgets.Label
import org.uqbar.arena.widgets.Button
import components.VillanoCaracteristicasList
import org.uqbar.arena.windows.SimpleWindow

class EditarVillanoWindow extends CustomSimpleWindow<CarmenSanDiegoAppModel>{
	
	new(WindowOwner parent, CarmenSanDiegoAppModel model, String windowTitle) {
		//TODO: El titulo deberia estar hardcodeado en un appModel
		super(parent, model)
		title = windowTitle
	}
	
	override addActions(Panel actionsPanel) {
		//throw new UnsupportedOperationException("TODO: auto-generated method stub")
	}
	
	override createFormPanel(Panel mainPanel) {
	//// Label nombre
		new LabeledTextBox(mainPanel) => [
			text = "Nombre:"
			bindValueToProperty("villanoTemp.nombre")
		]
	//// Label Sexo
	///TODO: no sabia como traerme un enum desde el dominio a traves del appModel. No se si es la mejor solucion
		new LabeledSelector(mainPanel) => [
			text = "Sexo:"
			bindItemsToProperty("gender")
			bindValueToProperty("villanoTemp.sexo")
		]
	/////Senas particulares
		labelButtonAndList("Señas particulares:", "Editar señas particulares", new EditarSenasParticularesWindow(this, modelObject), 
						   "Señas", mainPanel, "villanoTemp.senasParticulares")
	//// Hobbies
		labelButtonAndList("Hobbies:", "Editar hobbies", new EditarHobbiesWindow(this, modelObject), "Hobbie", mainPanel, "villanoTemp.hobbies")
		
	}
	
	def labelButtonAndList(String labelText, String buttonCaption, SimpleWindow window, String listTitle, Panel mainP, String listContents){
	//////// Panel	
		var horPanel = new Panel(mainP)
		horPanel.layout = new HorizontalLayout
	///////// Label
		new Label(horPanel).text = labelText
	/////// Button
		new Button(horPanel) => [
			caption = buttonCaption
			onClick[| window.open]
		] 
	////// List label
		new Label(mainP).text = listTitle
	///// list
		new VillanoCaracteristicasList(mainP, listContents)
	}
	
	
 /////////////////////////////
 // ESTO VUELA ES SOLO PARA PRUEBAS
 
}
 
class EditarVilApp extends Application{
	
	override protected createMainWindow() {
		var appModel  = new CarmenSanDiegoAppModel
		var vil = appModel.expediente.villanos.get(0)
		appModel.villanoTemp = vil 
		new EditarVillanoWindow(this, appModel, "Expediente - Editar Villano")
		
	}
	
	def static main(String[] args) {
		new EditarVilApp().start
	}
	}
	
