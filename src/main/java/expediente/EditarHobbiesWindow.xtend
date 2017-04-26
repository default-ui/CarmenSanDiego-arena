package expediente

import appModel.ExpedienteAppModel
import org.uqbar.arena.bindings.NotNullObservable
import org.uqbar.arena.widgets.Button
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.windows.WindowOwner
import org.uqbar.commons.model.UserException

class EditarHobbiesWindow extends EditarCaracteristicaVillanoWindow{
	
	new(WindowOwner owner, ExpedienteAppModel model) {
		super(owner, model, "pathImagenHobbies", "Hobbie", "villanoTemp.hobbies", "hobbieSeleccionado")
	}
	
	override createFormPanel(Panel mainPanel) {
	/// se crean las partes principales del panel	
		createMainPanelCaracVillano(mainPanel)
	/// Boton eliminar
		new Button(listPanel) => [
			var caracSelec = new NotNullObservable("hobbieSeleccionado")
			caption = "Eliminar"
			onClick(|this.modelObject.eliminarHobbie)
			bindEnabled(caracSelec)
			width = 250
		]
	/// Boton agregar
		new Button(textBoxPanel) => [
			caption = "Agregar"
			width = 100
			onClick[|
				if (this.modelObject.inputValue=="" || this.modelObject.inputValue==null) {
					//new ErrorDialog(this, modelObject, 'Sin Datos').open
					new UserException('Señas particulares vacia')
				} else {
					this.modelObject.agregarHobbie					
				}
				
			]
		]	
	}	
}
	