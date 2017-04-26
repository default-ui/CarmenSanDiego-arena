package arena

import csdExceptions.NombreDePaisNoIngresado
import appModel.CarmenSanDiegoAppModel
import carmenSanDiego.Pais
import org.uqbar.arena.bindings.PropertyAdapter
import org.uqbar.arena.layout.VerticalLayout
import org.uqbar.arena.widgets.Button
import org.uqbar.arena.widgets.List
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.windows.Dialog
import org.uqbar.arena.windows.WindowOwner

import static extension org.uqbar.arena.xtend.ArenaXtendExtensions.*
import org.uqbar.arena.widgets.Label
import org.uqbar.arena.graphics.Image

class ViajarWindow extends Dialog<CarmenSanDiegoAppModel>{
		
	new(WindowOwner parent, CarmenSanDiegoAppModel model) {
		super(parent, model)
	}
	
	override protected addActions(Panel actionsPanel) {
		
		
		new Button(actionsPanel) => [
			caption = "Viajar"
			setAsDefault 
			onClick [ | 
				modelObject.lugaresPistas=modelObject.juego.paisDestino.lugares
				modelObject.juego.viajar(modelObject.juego.paisDestino)
				this.close
			]
			
			]
		
		new Button(actionsPanel) => [
			caption = "Volver al país anterior"
			setAsDefault 
			onClick [ | 
				if (modelObject.juego.caso.paisDelRobo.nombre==modelObject.juego.paisActual){
					new NombreDePaisNoIngresado().mostrarError
					throw new Exception();
				}
				modelObject.juego.viajar(modelObject.juego.paisAnterior)
				this.close
			]
			
			]
	}


override protected createFormPanel(Panel mainPanel) {
		new Label(mainPanel) => [
				bindImageToProperty("pathImagenViajar", [ imagePath |
					new Image(imagePath)
				])
				
		]
		
		val editorPanel = new Panel(mainPanel)
		editorPanel.layout = new VerticalLayout
		val Panel panelDeConexiones = new Panel(mainPanel)
		
		new List<Pais>(panelDeConexiones) => [
				(items <=> "juego.paisActual.conexiones").adapter = new PropertyAdapter(Pais, "nombre")
				height = 60
				width = 400
				value <=> "juego.paisDestino"
				
			]
				
		
	}
}