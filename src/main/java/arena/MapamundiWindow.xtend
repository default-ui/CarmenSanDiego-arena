package arena

import carmenSanDiego.Lugar
import carmenSanDiego.Pais
import components.Titulo
import java.awt.Color
import org.uqbar.arena.bindings.PropertyAdapter
import org.uqbar.arena.layout.ColumnLayout
import org.uqbar.arena.layout.VerticalLayout
import org.uqbar.arena.widgets.Button
import org.uqbar.arena.widgets.Label
import org.uqbar.arena.widgets.List
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.windows.SimpleWindow
import org.uqbar.arena.windows.WindowOwner

import static extension org.uqbar.arena.xtend.ArenaXtendExtensions.*
import org.uqbar.arena.graphics.Image
import appModel.CarmenSanDiegoAppModel
import org.uqbar.commons.model.UserException

class MapamundiWindow extends SimpleWindow<CarmenSanDiegoAppModel> {

	new(WindowOwner parent, CarmenSanDiegoAppModel model) {
		super(parent, model)
	}

	override protected addActions(Panel actionsPanel) {
		//no queremos usar este template default
	}

	override protected createFormPanel(Panel mainPanel) {
		//no queremos usar este template default
	} 

	override createMainTemplate(Panel mainPanel) {
		this.title = "Mapamundi"
		mainPanel.layout = new VerticalLayout
		
		new Label(mainPanel) => [
			
			bindImageToProperty("pathImagenMapamundi", [ imagePath |
				new Image(imagePath)
			])
			
		]
		//new Titulo(mainPanel, "Mapamundi", 20)

		//Agregamos el contenido
		val Panel contentPanel = new Panel(mainPanel)
		contentPanel.layout = new ColumnLayout(2)
		this.crearListadoDePaises(contentPanel)
		this.crearEdicionDePaisSeleccionado(contentPanel)
	}

	def crearListadoDePaises(Panel owner) {
		val Panel panelDeListadoDePaises = new Panel(owner)

		new Titulo(panelDeListadoDePaises, "Paises")
		new List<Pais>(panelDeListadoDePaises) => [
				(items <=> "mapa.paises").adapter = new PropertyAdapter(Pais, "nombre")
				height = 290
				width = 150
				value <=> "paisSeleccionado"
				
			]
			
		new Button(panelDeListadoDePaises) =>[
			caption = "Eliminar"
			onClick [ | 
				if (this.modelObject.paisSeleccionado==null) {
					throw new UserException("Debe seleccionar un país a eliminar");
				}
				modelObject.mapa.eliminarPais(modelObject.paisSeleccionado.nombre)
			]
		] 
		new Button(panelDeListadoDePaises) =>[
			caption = "Editar"
			onClick [ |
				if (this.modelObject.paisSeleccionado==null) {
					throw new UserException("Debe seleccionar un país a editar");
				}
				this.modelObject.temp=this.modelObject.paisSeleccionado
				this.modelObject.nuevoPaisNombre=this.modelObject.temp.nombre
				new NuevoPaisWindow(this, this.modelObject).open
			]
		] 
		new Button(panelDeListadoDePaises) =>[
			caption = "Nuevo"
			onClick [ | 
				this.modelObject.temp= new Pais("temp")
				this.modelObject.nuevoPaisNombre=""
				new NuevoPaisWindow(this, this.modelObject).open
			]
		] 
	}

	def crearEdicionDePaisSeleccionado(Panel owner) {
		val Panel paisCompletoPanel = new Panel(owner)
		paisCompletoPanel.layout = new VerticalLayout
		
		
		new Label(paisCompletoPanel)=>[
			foreground = Color.WHITE
			background = Color.BLACK
			value <=> "paisSeleccionado.nombre"
			fontSize = 17
		]
		
		crearListadoDeCaracteristicasDePaisSeleccionado(paisCompletoPanel)
	}
	
	
	def crearListadoDeCaracteristicasDePaisSeleccionado(Panel owner) {
		val panelDeConexiones = new Panel(owner)
		val Panel panelDeCaracteristicas = new Panel(owner)
		val panelDeLugares = new Panel(owner)

		
		new Titulo(panelDeCaracteristicas, "Caracteristicas")
		new List<String>(panelDeCaracteristicas) => [
				items <=> "paisSeleccionado.caracteristicas"
				height = 60
				width = 400
				value <=> "paisSeleccionado.caracteristicas"
			]	
			
		new Titulo(panelDeConexiones, "Conexiones")
		new List<Pais>(panelDeConexiones) => [
				(items <=> "paisSeleccionado.conexiones").adapter = new PropertyAdapter(Pais, "nombre")
				height = 50
				width = 400
				//value <=> "paisSeleccionado.caracteristicas"
			]
		
		new Titulo(panelDeLugares, "Lugares de interes")
		new List<Pais>(panelDeLugares) => [
				(items <=> "paisSeleccionado.lugares").adapter = new PropertyAdapter(Lugar, "nombre")
				height = 50
				width = 400
				//value <=> "paisSeleccionado.caracteristicas"
			]	
		}
		
		
}