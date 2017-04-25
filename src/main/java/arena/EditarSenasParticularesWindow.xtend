package arena

import appModel.CarmenSanDiegoAppModel
import org.uqbar.arena.windows.WindowOwner
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.widgets.Button

import Exceptions.DatoNoIngresado
import org.uqbar.arena.bindings.NotNullObservable
import appModel.ExpedienteAppModel

class EditarSenasParticularesWindow extends EditarCaracteristicaVillanoWindow{
	
	new(WindowOwner owner, ExpedienteAppModel model, String pathTitle, String listLabel, String listSource) {
		super(owner, model, pathTitle, listLabel, listSource)
	}
	
	override createFormPanel(Panel mainPanel){
	/// se crean las partes principales del panel	
		createMainPanelCaracVillano(mainPanel)
	/// Boton eliminar
		new Button(listPanel) => [
			var senaSelec = new NotNullObservable("villanoCaracSeleccionada")
			bindEnabled(senaSelec)
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
					new DatoNoIngresado().mostrarError
					throw new Exception()
				}
				modelObject.agregarSena
					]
			]	
		
	}
	
	
	
}
