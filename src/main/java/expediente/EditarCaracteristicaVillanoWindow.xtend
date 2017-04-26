package expediente

import appModel.ExpedienteAppModel
import components.VillanoCaracteristicasList
import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.arena.aop.windows.TransactionalDialog
import org.uqbar.arena.graphics.Image
import org.uqbar.arena.layout.HorizontalLayout
import org.uqbar.arena.widgets.Button
import org.uqbar.arena.widgets.Label
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.widgets.TextBox
import org.uqbar.arena.windows.WindowOwner

import static extension org.uqbar.arena.xtend.ArenaXtendExtensions.*

/*
 * Clase abstracta creada para refactorizar la ventana de edicion de caracteristicas (hobbies, senas particulares) en los villanos
 */

abstract class EditarCaracteristicaVillanoWindow extends TransactionalDialog<ExpedienteAppModel>{
	
	List<String> params
	@Accessors
	Panel listPanel
	@Accessors
	Panel textBoxPanel
	
	new(WindowOwner owner, ExpedienteAppModel model, String pathTitle, String listLabel, String listSource, String listValue) {
		super(owner, model)
		params = #[pathTitle, listLabel, listSource, listValue]
	}
	
	
	override createFormPanel(Panel mainPanel);
		
	/*
	 * Crea los widgets en comun de la vista
	 */
	
	def createMainPanelCaracVillano(Panel mainPanel){
		
		/// Titulo (imagen)
			new Label(mainPanel) => [
			// obtengo parametro del path de la imagen
			bindImageToProperty(params.get(0), [ imagePath |
				new Image(imagePath)
												])
			]
		/// List panel
			listPanel = new Panel(mainPanel)
			// obtengo parametro de titulo de lista
			new Label(listPanel).text = params.get(1)
		//// list
			// obtengo parametro para la lista en particular y su valor seleccionado
			new VillanoCaracteristicasList(listPanel, params.get(2), params.get(3))
		/// text box panel
			textBoxPanel = new Panel(mainPanel)
			textBoxPanel.layout = new HorizontalLayout
		//// text box
			new TextBox(textBoxPanel) => [
				value <=> "inputValue"
				width = 100
			]
	}
	
	override  addActions(Panel actionsPanel) {
		new Button(actionsPanel) => [
			caption = "Aceptar"
			setAsDefault 
			onClick [ | this.close ]
			]
	}
}
