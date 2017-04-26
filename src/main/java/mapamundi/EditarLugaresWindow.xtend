package mapamundi

import csdExceptions.DemasiadosLugaresException
import csdExceptions.LugarExistenteException
import csdExceptions.NoSeleccionadoException
import appModel.MapamundiAppModel
import carmenSanDiego.Lugar
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

class EditarLugaresWindow extends Dialog<MapamundiAppModel>{

	
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
			onClick [ | 
				if (this.modelObject.lugar==null) {
					new NoSeleccionadoException().mostrarError
					throw new Exception();
				}
				this.modelObject.eliminarLugar()
			]
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
				if(this.modelObject.temp.lugares.size()>=3){
					new DemasiadosLugaresException().mostrarError
					throw new Exception();
				}
				if(this.modelObject.lugar==null){
					new NoSeleccionadoException().mostrarError
					throw new Exception();
				}
				if (this.modelObject.temp.lugarExiste(this.modelObject.lugar.nombre)){
					new LugarExistenteException().mostrarError
					throw new Exception()
				}
				this.modelObject.agregarLugar()
			]
		]	
}
}
