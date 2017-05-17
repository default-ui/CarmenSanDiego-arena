package arena

import carmenSanDiego.Sexo
import carmenSanDiego.Villano
import org.uqbar.arena.Application
import org.uqbar.arena.layout.HorizontalLayout
import org.uqbar.arena.widgets.Button
import org.uqbar.arena.widgets.List
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.widgets.TextBox
import org.uqbar.arena.windows.SimpleWindow
import org.uqbar.arena.windows.WindowOwner

class EditarHobbieWindow extends SimpleWindow<Villano>{
	
	new(WindowOwner parent, Villano model) {
		super(parent, model)
	}
	
	override def createMainTemplate(Panel mainPanel) {
		super.createMainTemplate(mainPanel)
		title = "Editar villano"
	}
	
	
	
	override protected addActions(Panel actionsPanel) {
	//	throw new UnsupportedOperationException("TODO: auto-generated method stub")
	}
	
	override protected createFormPanel(Panel mainPanel) {
		
		val editorPanel = new Panel(mainPanel)
		//editorPanel.layout = new VerticalLayout
//		val table = new Table(editorPanel, typeof(Villano)) => [
//    		items <=> "hobbies"
//    		//value <=> "hobby"
//		]
//		new Column<Villano>(table).setTitle("Hobbies").bindContentsToProperty("hobbies")
		val list = new List<Villano>(editorPanel) => [
			bindItemsToProperty("hobbies")
			//bindValueToProperty("hobby")
		]
		/////////////////
		new Button(editorPanel) => [
			caption = "Eliminar"
			// agregar appModel
			//onClick([|this.modelObject.eliminarHobbie("hobby")])
		]
		
		var panel2 = new Panel(editorPanel)
		panel2.layout = new HorizontalLayout
		var nuevoHobby = new TextBox(panel2)
		
		new Button(panel2) => [
			caption = "Agregar"
			//onClick([|this.modelObject.agregarHobby])
		]
		new Button(editorPanel) => [
			caption = "Aceptar"
		]
	}
	
	def eliminarHobbie() {
		throw new UnsupportedOperationException("TODO: auto-generated method stub")
	}
	

	
	
	
}

class EditarHobbieApp extends Application{
	
	override protected createMainWindow() {
		var villano = new Villano(0, "El Gato", Sexo.Masculino)
		villano.agregarHobbie("Tomar matecocido")
		
	
		new EditarHobbieWindow(this, villano)
		
	}
	
	def static main(String[] args) {
		new EditarHobbieApp().start
	}
	
}