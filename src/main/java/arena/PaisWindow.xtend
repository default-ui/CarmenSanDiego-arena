package arena

import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.windows.Dialog
import org.uqbar.arena.windows.WindowOwner
import appModel.CrearPaisAppModel
import org.uqbar.arena.layout.VerticalLayout
import org.uqbar.arena.widgets.Label
import org.uqbar.arena.widgets.TextBox
import org.uqbar.arena.widgets.Button
import static extension org.uqbar.arena.xtend.ArenaXtendExtensions.*
import appModel.CarmenSanDiegoAppModel
import org.uqbar.arena.bindings.NotNullObservable
import carmenSanDiego.Pais
import org.uqbar.arena.graphics.Image
import components.Titulo
import org.uqbar.arena.widgets.List
import org.uqbar.arena.bindings.PropertyAdapter
import carmenSanDiego.Lugar

class NuevoPaisWindow extends Dialog<CarmenSanDiegoAppModel> {

	new(WindowOwner owner, CarmenSanDiegoAppModel model) {
		super(owner, model)
	}
	
	override protected createFormPanel(Panel mainPanel) {
		title = "Nuevo Pais"
		mainPanel.layout = new VerticalLayout 
		
		new Label(mainPanel) => [
			
			bindImageToProperty("pathImagenNuevoPais", [ imagePath |
				new Image(imagePath)
			])
			
		]
		new Titulo(mainPanel, "Nombre")
		new TextBox(mainPanel) => [
			value <=> "nuevoPaisNombre"
			width = 200
		]
		
		val Panel panelDeCaracteristicas = new Panel(mainPanel)
		new Titulo(panelDeCaracteristicas, "Caracteristicas")
		new List<String>(panelDeCaracteristicas) => [
				items <=> "temp.caracteristicas"
				height = 60
				width = 400
				//value <=> "mapa.getPaisFromName(tempPais).caracteristicas"
				
			]
		new Button(mainPanel)=>[
			caption = "Editar Caracteristicas"
			onClick [ |
				new EditarCaracteristicasWindow(this, this.modelObject).open
			]
			
		val Panel panelDeConexiones = new Panel(mainPanel)
		new Titulo(panelDeConexiones, "Conexiones")
		new List<Pais>(panelDeConexiones) => [
				(items <=> "temp.conexiones").adapter = new PropertyAdapter(Pais, "nombre")
				height = 50
				width = 400
				//value <=> "paisSeleccionado.caracteristicas"
			]
			
			]
		new Button(mainPanel)=>[
			caption = "Editar Conexiones"
			onClick [ |
				new EditarConexionesWindow(this, this.modelObject).open
			]
			
		val Panel panelDeLugares = new Panel(mainPanel)
		new Titulo(panelDeLugares, "Lugares de interes")
		new List<Pais>(panelDeLugares) => [
				(items <=> "temp.lugares").adapter = new PropertyAdapter(Lugar, "nombre")
				height = 50
				width = 400
				//value <=> "paisSeleccionado.caracteristicas"
			]	
			
		new Button(mainPanel)=>[
			caption = "Editar Lugares"
			onClick [ |
				new EditarLugaresWindow(this, this.modelObject).open
			]
			
			]
		]	
		
		
		
		new Button(mainPanel)=>[
			caption = "Aceptar"
			onClick [ |
				this.modelObject.mapa.eliminarPais(this.modelObject.temp.nombre)
				this.modelObject.agregarPais()
				this.modelObject.paisSeleccionado=this.modelObject.temp
				this.close
			]
		]
		
	}
	
	
}