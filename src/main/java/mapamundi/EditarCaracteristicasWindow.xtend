package mapamundi

import csdExceptions.DatoNoIngresado
import appModel.MapamundiAppModel
import org.uqbar.arena.bindings.NotNullObservable
import org.uqbar.arena.graphics.Image
import org.uqbar.arena.layout.VerticalLayout
import org.uqbar.arena.widgets.Button
import org.uqbar.arena.widgets.Label
import org.uqbar.arena.widgets.List
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.widgets.TextBox
import org.uqbar.arena.windows.Dialog
import org.uqbar.arena.windows.WindowOwner

import static extension org.uqbar.arena.xtend.ArenaXtendExtensions.*

class EditarCaracteristicasWindow extends Dialog<MapamundiAppModel>{
	
	new(WindowOwner parent, MapamundiAppModel model) {
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
			
			bindImageToProperty("pathImagenCaracteristicas", [ imagePath |
				new Image(imagePath)
			])
			
		]
		val editorPanel = new Panel(mainPanel)
		editorPanel.layout = new VerticalLayout
		val Panel panelDeCaracteristicas = new Panel(mainPanel)
		new List<String>(panelDeCaracteristicas) => [
				items <=> "temp.caracteristicas"
				height = 60
				width = 400
				value <=> "caracteristicaAEliminar"
			]
			
		new Button(mainPanel) => [
			caption = "Eliminar"
			var caracSelec = new NotNullObservable("caracteristicaAEliminar")
			bindEnabled(caracSelec)
			onClick [ | 
				this.modelObject.eliminarCaracteristica()
				
			]
			]
			
		new Label(mainPanel).text = ""
		new TextBox(mainPanel) => [
			value <=> "caracteristica"
			width = 200
		]
		
		new Button(mainPanel) => [
			caption = "Agregar"
			onClick [ |
			if (this.modelObject.caracteristica=="" || this.modelObject.caracteristica == null) {
					new DatoNoIngresado(this, modelObject).open
				}
			this.modelObject.agregarCaracteristica()
			]
		]	
	}
}
