package arena

import appModel.ViajarAppModel
import carmenSanDiego.Pais
import org.uqbar.arena.bindings.PropertyAdapter
import org.uqbar.arena.graphics.Image
import org.uqbar.arena.layout.VerticalLayout
import org.uqbar.arena.widgets.Button
import org.uqbar.arena.widgets.Label
import org.uqbar.arena.widgets.List
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.windows.Dialog
import org.uqbar.arena.windows.WindowOwner

import static extension org.uqbar.arena.xtend.ArenaXtendExtensions.*

class ViajarWindow extends Dialog<ViajarAppModel>{
		
	new(WindowOwner parent, ViajarAppModel model) {
		super(parent, model)
	}
	
	override protected addActions(Panel actionsPanel) {
		
		
		new Button(actionsPanel) => [
			caption = "Viajar"
			setAsDefault 
			onClick [ | 
				modelObject.repo.lugaresPistas=modelObject.repo.juego.paisDestino.lugares
				modelObject.repo.juego.viajar(modelObject.repo.juego.paisDestino)
				modelObject.pedirTodasLasPistas
				this.close
			]
			
		]
		
		new Button(actionsPanel) => [
			caption = "Volver al país anterior"
			bindEnabledToProperty("puedeVolver")
			onClick [
				modelObject.repo.juego.viajar(modelObject.repo.juego.paisAnterior)
				modelObject.pedirTodasLasPistas
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
				(items <=> "repo.juego.paisActual.conexiones").adapter = new PropertyAdapter(Pais, "nombre")
				height = 60
				width = 400
				value <=> "repo.juego.paisDestino"
				
			]
				
		
	}
}