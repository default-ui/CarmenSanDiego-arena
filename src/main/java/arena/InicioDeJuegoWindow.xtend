package arena

import appModel.CarmenSanDiegoAppModel
import components.CustomSimpleWindow
import org.uqbar.arena.layout.VerticalLayout
import org.uqbar.arena.widgets.Button
import org.uqbar.arena.widgets.Label
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.windows.WindowOwner
import java.awt.Color
import org.uqbar.arena.graphics.Image

class InicioDeJuegoWindow extends CustomSimpleWindow<CarmenSanDiegoAppModel>{
	
	
	new(WindowOwner parent, CarmenSanDiegoAppModel model) {
		super(parent, model)
		// esto seguro no se hace asi, pero como se hace entonces?
		//title = "Robo de: " + modelObject.juego.caso.objeto
	}
	
	override addActions(Panel actionsPanel) {
		new Button(actionsPanel) => [
			background = Color.RED
			caption = "Aceptar el caso"
			setAsDefault 
			onClick [ | 
				this.close
				
				new ResolviendoCasoWindow(this, this.modelObject).open
				
			]
			
		]
	}
	
	override createFormPanel(Panel mainPanel) {
		new Label(mainPanel) => [
			
			bindImageToProperty("pathImagenInicio", [ imagePath |
				new Image(imagePath)
			])
			
		]
		val editorPanel = new Panel(mainPanel)
		editorPanel.layout = new VerticalLayout
		new Label(editorPanel).text = "Detective, tenemos un caso para usted:"
		
		// cada una de las lineas del reporte
		for (lineaReporte : modelObject.juego.caso.reporte) {
			new Label(editorPanel) =>[
				text = lineaReporte
			]			
		}
	}	
}

