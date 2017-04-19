package arena

import carmenSanDiego.Caso
import carmenSanDiego.Pais
import carmenSanDiego.Sexo
import carmenSanDiego.Villano
import components.CustomSimpleWindow
import components.Titulo
import java.util.ArrayList
import org.uqbar.arena.Application
import org.uqbar.arena.bindings.PropertyAdapter
import org.uqbar.arena.layout.HorizontalLayout
import org.uqbar.arena.layout.VerticalLayout
import org.uqbar.arena.widgets.Button
import org.uqbar.arena.widgets.GroupPanel
import org.uqbar.arena.widgets.Label
import org.uqbar.arena.widgets.List
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.windows.WindowOwner

import static extension org.uqbar.arena.xtend.ArenaXtendExtensions.*

class ResolviendoCasoWindow extends CustomSimpleWindow<Caso>{
	
	new(WindowOwner parent, Caso model) {
		super(parent, model)
		title = "Resolviendo: Robo de " + model.objeto
	}
	
	override addActions(Panel actionsPanel) {
	}
	
	override createFormPanel(Panel mainPanel) {
		
		new Label(mainPanel).text = "Estás en: LALALA"
		

		val upperPanel = new Panel(mainPanel)
		upperPanel.layout = new HorizontalLayout
		
		armarAccionesPanel(upperPanel)
		armarLugaresPanel(upperPanel)

		new Label(mainPanel).text = "Recorrido Criminal:"
		
		new Label(mainPanel).text = "LALALA < LA < LALALA"

		new Titulo(mainPanel, "Destinos Fallidos")
		new List<Pais>(mainPanel) => [
				(items <=> "planDeEscape").adapter = new PropertyAdapter(Pais, "nombre")
//				value <=> "paisSeleccionado"
			]

	}
	
	def private armarAccionesPanel(Panel containerPanel) {
		
		val accionesPanel = new GroupPanel(containerPanel)
		accionesPanel.layout = new VerticalLayout
		accionesPanel.setTitle('Acciones')
		
		new Button(accionesPanel) => [
			caption = "Orden De Arresto"
		]
		new Label(accionesPanel) => [
			text = "Orden emitida para: lalala"
		]

		new Button(accionesPanel) => [
			caption = "Viajar"
		]

		new Button(accionesPanel) => [
			caption = "Expedientes"
		]
		
	}
	
	def private armarLugaresPanel(Panel containerPanel) {
		
		val lugaresPanel = new GroupPanel(containerPanel)
		lugaresPanel.layout = new VerticalLayout
		lugaresPanel.setTitle('Lugares')
		
		new Button(lugaresPanel) => [
			caption = "Biblioteca"
			setAsDefault 
		]

		new Button(lugaresPanel) => [
			caption = "Club"
		]

		new Button(lugaresPanel) => [
			caption = "Embajada"
		]
		
	}	
}

/***********
 * PRUEBA***
 ***********/
 
class ResolviendoCasoApp extends Application{
	
	override protected createMainWindow() {
		var villano = new Villano("El Gato", Sexo.Masculino)	
	
		new ResolviendoCasoWindow(this, new Caso(villano, "Zircon", new ArrayList<Pais>, new Pais("Argentina")))
		
	}
	
	def static main(String[] args) {
		new ResolviendoCasoApp().start
	}
	
}