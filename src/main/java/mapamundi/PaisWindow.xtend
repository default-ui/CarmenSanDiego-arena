package mapamundi

import appModel.CaracteristicasAppModel
import appModel.ConexionesAppModel
import appModel.EditarLugaresAppModel
import appModel.PaisAppModel
import carmenSanDiego.Lugar
import carmenSanDiego.Pais
import components.Titulo
import org.uqbar.arena.bindings.PropertyAdapter
import org.uqbar.arena.graphics.Image
import org.uqbar.arena.layout.VerticalLayout
import org.uqbar.arena.widgets.Button
import org.uqbar.arena.widgets.Label
import org.uqbar.arena.widgets.List
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.widgets.TextBox
import org.uqbar.arena.windows.Dialog
import org.uqbar.arena.windows.WindowOwner
import org.uqbar.commons.model.UserException

import static extension org.uqbar.arena.xtend.ArenaXtendExtensions.*

class PaisWindow extends Dialog<PaisAppModel> {

	
	new(WindowOwner owner, PaisAppModel model) {
		super(owner, model)
	}
	
	override protected createFormPanel(Panel mainPanel) {
		mainPanel.layout = new VerticalLayout 
		
		new Label(mainPanel) => [
			
			bindImageToProperty("pathImagenNuevoPais", [ imagePath |
				new Image(imagePath)
			])
			
		]
		new Titulo(mainPanel, "Nombre")
		new TextBox(mainPanel) => [
			value <=> "repo.nuevoPaisNombre"
			width = 200
		]
		
		val Panel panelDeCaracteristicas = new Panel(mainPanel)
		new Titulo(panelDeCaracteristicas, "Caracteristicas")
		new List<String>(panelDeCaracteristicas) => [
				items <=> "repo.paisTemp.caracteristicas"
				height = 60
				width = 400	
			]
			
		new Button(mainPanel)=>[
			caption = "Editar Caracteristicas"
			onClick [ |
				val caracteristicasAppModel=new CaracteristicasAppModel(modelObject.repo)
				new EditarCaracteristicasWindow(this, caracteristicasAppModel).open
			]
			
		val Panel panelDeConexiones = new Panel(mainPanel)
		new Titulo(panelDeConexiones, "Conexiones")
		new List<Pais>(panelDeConexiones) => [
				(items <=> "repo.paisTemp.conexiones").adapter = new PropertyAdapter(Pais, "nombre")
				height = 50
				width = 400
			]
			
			]
		new Button(mainPanel)=>[
			caption = "Editar Conexiones"
			onClick [ |
				val conexionesAppModel = new ConexionesAppModel(modelObject.repo)
				new EditarConexionesWindow(this, conexionesAppModel).open
			]
			
		val Panel panelDeLugares = new Panel(mainPanel)
		new Titulo(panelDeLugares, "Lugares de interes")
		new List<Pais>(panelDeLugares) => [
				(items <=> "repo.paisTemp.lugares").adapter = new PropertyAdapter(Lugar, "nombre")
				height = 50
				width = 400
			]	
			
		new Button(mainPanel)=>[
			caption = "Editar Lugares"
			onClick [ |
				val editarLugaresAppModel = new EditarLugaresAppModel(modelObject.repo)
				new EditarLugaresWindow(this, editarLugaresAppModel).open
			]
			
			]
		]	
		
		
		
		new Button(mainPanel)=>[
			caption = "Aceptar"

			onClick [
				if (modelObject.repo.nuevoPaisNombre.empty) {
					//new ErrorDialog(this, modelObject).open

					throw new UserException('Nombre de pais vacio')

				} else {
					modelObject.repo.mapa.eliminarPais(this.modelObject.repo.paisTemp.nombre)
					this.modelObject.agregarPais()
					this.modelObject.paisSeleccionado=this.modelObject.repo.paisTemp
					this.close
				}
					
			]
		]
		
	}
	
	
}
