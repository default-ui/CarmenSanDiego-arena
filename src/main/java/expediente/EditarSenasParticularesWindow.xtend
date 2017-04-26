package expediente

import appModel.EditarCaracteristicaVillanoAppModel
import org.uqbar.arena.bindings.NotNullObservable
import org.uqbar.arena.widgets.Button
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.windows.WindowOwner
import org.uqbar.commons.model.UserException

class EditarSenasParticularesWindow extends EditarCaracteristicaVillanoWindow{
	
	new(WindowOwner owner, EditarCaracteristicaVillanoAppModel model) {
		super(owner, model, "pathImagenSenas", "Seña", "villanoTemp.senasParticulares", "senaSeleccionada")
	}
	
	override createFormPanel(Panel mainPanel){
	/// se crean las partes principales del panel	
		createMainPanelCaracVillano(mainPanel)
	/// Boton eliminar
		new Button(listPanel) => [
			var caracSelec = new NotNullObservable("senaSeleccionada")
			bindEnabled(caracSelec)
			caption = "Eliminar"
			onClick(|this.modelObject.eliminarSena)
			width = 250
		]
	/// Boton agregar
		new Button(textBoxPanel) => [
			caption = "Agregar"
			width = 100
			onClick[|
				if (this.modelObject.inputValue=="" || this.modelObject.inputValue==null) {
					//new ErrorDialog(this, modelObject).open
					throw new UserException('Señas particulares vacia')
				}
				modelObject.agregarSena
			]
		]		
	}	
}
