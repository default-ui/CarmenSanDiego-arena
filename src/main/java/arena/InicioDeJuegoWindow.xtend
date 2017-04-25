package arena

import appModel.CarmenSanDiegoAppModel
import components.CustomSimpleWindow
import org.uqbar.arena.layout.VerticalLayout
import org.uqbar.arena.widgets.Button
import org.uqbar.arena.widgets.Label
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.windows.WindowOwner

class InicioDeJuegoWindow extends CustomSimpleWindow<CarmenSanDiegoAppModel>{
	
	
	new(WindowOwner parent, CarmenSanDiegoAppModel model) {
		super(parent, model)
		title = modelObject.tituloInicioDeJuego
	}
	
	override addActions(Panel actionsPanel) {
		new Button(actionsPanel) => [
			caption = "Aceptar el caso"
			setAsDefault 
			onClick [ | 
				this.close
				modelObject.expedienteAppModel.objeto = modelObject.juego.caso.objeto
				new ResolviendoCasoWindow(this, this.modelObject).open
				
			]
			
		]
	}
	
	override createFormPanel(Panel mainPanel) {
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

