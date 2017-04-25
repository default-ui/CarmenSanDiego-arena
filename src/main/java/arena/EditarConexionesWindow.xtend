package arena

import Exceptions.ConexionExistenteException
import Exceptions.NoSeleccionadoException
import appModel.CarmenSanDiegoAppModel
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
import org.uqbar.arena.bindings.NotNullObservable

class EditarConexionesWindow extends Dialog<CarmenSanDiegoAppModel>{
	
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
			onClick [ |
			if(this.modelObject.conexion==null){
					new NoSeleccionadoException().mostrarError
					throw new Exception();
				}
			if (this.modelObject.temp.conexiones.contains(this.modelObject.conexion)){
				new ConexionExistenteException().mostrarError
				throw new Exception();
			}
			this.modelObject.agregarConexion()
			]
		]	
	}
}