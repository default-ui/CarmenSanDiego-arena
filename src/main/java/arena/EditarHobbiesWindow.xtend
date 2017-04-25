package arena

import appModel.CarmenSanDiegoAppModel
import org.uqbar.arena.windows.WindowOwner
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.widgets.Label
import static extension org.uqbar.arena.xtend.ArenaXtendExtensions.*
import org.uqbar.arena.widgets.Button
import org.uqbar.arena.widgets.TextBox
import org.uqbar.arena.layout.HorizontalLayout
import Exceptions.DatoNoIngresado
import org.uqbar.arena.bindings.NotNullObservable
import org.uqbar.arena.graphics.Image
import components.VillanoCaracteristicasList
import org.uqbar.arena.windows.Dialog

class EditarHobbiesWindow extends EditarCaracteristicaVillanoWindow{
	
	new(WindowOwner owner, CarmenSanDiegoAppModel model, String pathTitle, String listLabel, String listSource) {
		super(owner, model, pathTitle, listLabel, listSource)
	}
	
	override createFormPanel(Panel mainPanel) {
	/// se crean las partes principales del panel	
		createMainPanelCaracVillano(mainPanel)
	/// Boton eliminar
		new Button(listPanel) => [
			var senaSelec = new NotNullObservable("villanoCaracSeleccionada")
			caption = "Eliminar"
			onClick(|this.modelObject.eliminarHobbie)
			bindEnabled(senaSelec)
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
				this.modelObject.agregarHobbie
					]
			]	
	}
	
	
}

	