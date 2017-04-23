package arena

import appModel.CarmenSanDiegoAppModel
import carmenSanDiego.Pais
import components.CustomSimpleWindow
import components.Titulo
import org.uqbar.arena.Application
import org.uqbar.arena.bindings.PropertyAdapter
import org.uqbar.arena.widgets.Button
import org.uqbar.arena.widgets.List
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.windows.WindowOwner

import static extension org.uqbar.arena.xtend.ArenaXtendExtensions.*
import org.uqbar.arena.windows.Dialog
import components.LabeledLabel
import org.uqbar.arena.widgets.Label
import org.uqbar.arena.graphics.Image
import org.uqbar.arena.layout.VerticalLayout
import Exceptions.NombreDePaisNoIngresado

class ViajarWindow extends Dialog<CarmenSanDiegoAppModel>{
		
	new(WindowOwner parent, CarmenSanDiegoAppModel model) {
		super(parent, model)
	}
	
	override protected addActions(Panel actionsPanel) {
		
		
		new Button(actionsPanel) => [
			caption = "Viajar"
			setAsDefault 
			onClick [ | 
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