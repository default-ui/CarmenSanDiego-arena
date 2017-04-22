package arena

import appModel.CarmenSanDiegoAppModel
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
import Exceptions.NoSeleccionadoException
import Exceptions.DatoNoIngresado

class EditarCaracteristicasWindow extends Dialog<CarmenSanDiegoAppModel>{
	
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
			setAsDefault 
			onClick [ | 
				if(this.modelObject.caracteristica==null || this.modelObject.caracteristica=="" ){
					new NoSeleccionadoException().mostrarError
					throw new Exception();
				}
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
			if (this.modelObject.nuevoPaisNombre=="") {
					new DatoNoIngresado().mostrarError
					throw new Exception();
				}
			this.modelObject.agregarCaracteristica()
			]
		]	
}
}