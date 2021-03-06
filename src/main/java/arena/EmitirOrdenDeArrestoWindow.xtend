package arena

import appModel.OrdenDeArrestoAppModel
import carmenSanDiego.Villano
import components.CustomSimpleWindow
import components.LabeledLabel
import components.LabeledSelector
import org.uqbar.arena.bindings.PropertyAdapter
import org.uqbar.arena.graphics.Image
import org.uqbar.arena.widgets.Button
import org.uqbar.arena.widgets.Label
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.windows.WindowOwner

class EmitirOrdenDeArrestoWindow extends CustomSimpleWindow<OrdenDeArrestoAppModel>{
	
	new(WindowOwner parent, OrdenDeArrestoAppModel model) {
		super(parent, model)
		title = "Nueva Orden de Arresto"
	}
	
	override addActions(Panel actionsPanel) {
		new Button(actionsPanel) => [
			caption = "Emitir Orden De Arresto"
			setAsDefault
			onClick [
				modelObject.emitirOrdenDeArresto
				modelObject.pedirTodasLasPistas
				this.close
			]
		]
	}
	
	override createFormPanel(Panel mainPanel) {
		new Label(mainPanel) => [
			bindImageToProperty("pathImagenOrden", [ imagePath |
				new Image(imagePath)
			])
			
		]

		new LabeledLabel(mainPanel) => [
			text = 'Orden emitida para: '
			bindValueToProperty('repo.juego.ordenDeArrestoString')
		]
		
		new LabeledSelector(mainPanel) => [
			bindValueToProperty('repo.villanoDeNuevaOrdenDeArresto')
			
			val binding = bindItemsToProperty('repo.expediente.villanos')
			binding.adapter = new PropertyAdapter(typeof(Villano), "nombre")

		]
		
	}
	
}
