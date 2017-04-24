package arena

import appModel.CarmenSanDiegoAppModel
import org.uqbar.arena.layout.VerticalLayout
import org.uqbar.arena.widgets.Button
import org.uqbar.arena.widgets.Label
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.windows.SimpleWindow
import org.uqbar.arena.windows.WindowOwner

class InicioDeJuegoWindow extends SimpleWindow<CarmenSanDiegoAppModel>{
	
	// deberia ser un dialog??
	// que feo que es el error viewer panel, no se puede sacar???
	
	
	new(WindowOwner parent, CarmenSanDiegoAppModel model) {
		super(parent, model)
		// esto seguro no se hace asi, pero como se hace entonces?
		//title = "Robo de: " + modelObject.juego.caso.objeto
	}
	
	override protected addActions(Panel actionsPanel) {
		new Button(actionsPanel) => [
			caption = "Aceptar el caso"
			setAsDefault 
			onClick [ | 
				new ResolviendoCasoWindow(this, this.modelObject).open
			]
			
		]
	}
	
	override protected createFormPanel(Panel mainPanel) {
		val editorPanel = new Panel(mainPanel)
		editorPanel.layout = new VerticalLayout
		new Label(editorPanel).text = "Detective, tenemos un caso para usted!"
		new Label(editorPanel) =>[
			text= modelObject.juego.caso.reporte
			width = 400
			height = 100
		]
	}	
}

