package arena

import org.uqbar.arena.windows.SimpleWindow
import org.uqbar.arena.windows.WindowOwner
import org.uqbar.arena.widgets.Panel
import carmenSanDiego.Caso
import org.uqbar.arena.layout.VerticalLayout
import org.uqbar.arena.widgets.Label
import static extension org.uqbar.arena.xtend.ArenaXtendExtensions.*
import org.uqbar.arena.widgets.Button
import org.uqbar.arena.Application
import carmenSanDiego.Villano
import carmenSanDiego.Sexo
import java.util.ArrayList
import carmenSanDiego.Pais

class InicioDeJuegoWindow extends SimpleWindow<Caso>{
	
	// deberia ser un dialog??
	// que feo que es el error viewer panel, no se puede sacar???
	
	
	new(WindowOwner parent, Caso model) {
		super(parent, model)
		title = "Robo de: " + model.objeto
	}
	
	override protected addActions(Panel actionsPanel) {
		new Button(actionsPanel) => [
			caption = "Aceptar el caso"
			setAsDefault 
			//onClick [ | "resolverMisterio" ]
			
			]
	}
	
	override protected createFormPanel(Panel mainPanel) {
		val editorPanel = new Panel(mainPanel)
		editorPanel.layout = new VerticalLayout
		new Label(editorPanel).text = "Detective, tenemos un caso para usted!"
		new Label(editorPanel) =>[
			value <=> "reporte"
			width = 400
			height = 150
		]
	}	
}

/***********
 * PRUEBA***
 ***********/
 
class InicioDeJuegoApp extends Application{
	
	override protected createMainWindow() {
		var villano = new Villano("El Gato", Sexo.Masculino)	
	
		new InicioDeJuegoWindow(this, new Caso(villano, "Zircon", new ArrayList<Pais>, new Pais("Argentina")))
		
	}
	
	def static main(String[] args) {
		new InicioDeJuegoApp().start
	}
	
}