package mapamundi

import appModel.MapamundiAppModel
import carmenSanDiego.Pais
import org.uqbar.arena.bindings.NotNullObservable
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
import appModel.ConexionesAppModel
import org.uqbar.commons.model.UserException

class EditarConexionesWindow extends Dialog<ConexionesAppModel>{
	
	new(WindowOwner parent, ConexionesAppModel model) {
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
			bindImageToProperty("pathImagenConexiones", [ imagePath |
				new Image(imagePath)
			])
			
		]
		
		val editorPanel = new Panel(mainPanel)
		editorPanel.layout = new VerticalLayout
		val Panel panelDeConexiones1 = new Panel(mainPanel)
		
		new List<Pais>(panelDeConexiones1) => [
				(items <=> "temp.conexiones").adapter = new PropertyAdapter(Pais, "nombre")
				height = 60
				width = 400
				value <=> "conexionAEliminar"
				
			]
				
		new Button(mainPanel) => [
			caption = "Eliminar"
			var conexionAElim = new NotNullObservable("conexionAEliminar")
			bindEnabled(conexionAElim)
			setAsDefault 
			onClick [ | 
				this.modelObject.eliminarConexion()

			]
			]
			
		val Panel panelDeConexiones2 = new Panel(mainPanel)	
		new List<Pais>(panelDeConexiones2) => [
				(items <=> "mapa.paises").adapter = new PropertyAdapter(Pais, "nombre")
				height = 60
				width = 400
				value <=> "conexion"
				
				
			]
		
		new Button(mainPanel) => [
			caption = "Agregar"
			onClick [
				
				if(this.modelObject.conexion==null){
					//new ErrorDialog(this, modelObject).open
					throw new UserException('Conexión vacia')
				}
				
				if (this.modelObject.temp.conexiones.contains(this.modelObject.conexion)){
					//new ErrorDialog(this, modelObject).open
					throw new UserException('Conexión ya existente')
				}
				
				this.modelObject.agregarConexion()
			
			]
		]	
	}
}
