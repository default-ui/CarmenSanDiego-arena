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
import ar.edu.seguidorCarrera.view.components.Titulo
import org.uqbar.arena.widgets.List
import org.uqbar.arena.windows.Dialog
import appModel.CarmenSanDiegoAppModel
import org.uqbar.arena.graphics.Image
import org.uqbar.arena.widgets.TextBox
import components.LabeledSelector
import org.uqbar.arena.bindings.PropertyAdapter
import carmenSanDiego.Lugar

class EditarLugaresWindow extends Dialog<CarmenSanDiegoAppModel>{

	
	new(WindowOwner parent, CarmenSanDiegoAppModel model) {
		super(parent, model)
	}
	
	override protected addActions(Panel actionsPanel) {
		
		
		new Button(actionsPanel) => [
			caption = "Aceptar"
			setAsDefault 
			onClick [ | this.close ]
			]
	}


override protected createFormPanel(Panel mainPanel) {
		
		new Label(mainPanel) => [
			bindImageToProperty("pathImagenLugares", [ imagePath |
				new Image(imagePath)
			])
			
		]
		
		val editorPanel = new Panel(mainPanel)
		editorPanel.layout = new VerticalLayout
		val Panel panelDeLugares1 = new Panel(mainPanel)
		
		new List<Pais>(panelDeLugares1) => [
				(items <=> "temp.lugares").adapter = new PropertyAdapter(Lugar, "nombre")
				height = 60
				width = 400
				value <=> "lugarAEliminar"
				
			]
				
		new Button(mainPanel) => [
			caption = "Eliminar"
			setAsDefault 
			onClick [ | this.modelObject.eliminarLugar() ]
			]
			
		val Panel panelDeLugares2 = new Panel(mainPanel)	
		new List<Pais>(panelDeLugares2) => [
				(items <=> "lugares").adapter = new PropertyAdapter(Lugar, "nombre")
				height = 60
				width = 400
				value <=> "lugar"
				
			]
		
		new Button(mainPanel) => [
			caption = "Agregar"
			onClick [ |
			this.modelObject.agregarLugar()
			]
		]	
}
}