package arena


import org.uqbar.arena.windows.WindowOwner
import org.uqbar.arena.widgets.Panel
import appModel.CarmenSanDiegoAppModel
import org.uqbar.arena.aop.windows.TransactionalDialog
import java.util.List
import org.uqbar.arena.widgets.Label
import org.uqbar.arena.graphics.Image
import components.VillanoCaracteristicasList
import org.uqbar.arena.widgets.Button
import org.uqbar.arena.layout.HorizontalLayout
import org.uqbar.arena.widgets.TextBox
import static extension org.uqbar.arena.xtend.ArenaXtendExtensions.*
import org.eclipse.xtend.lib.annotations.Accessors

/*
 * Clase abstracta creada para refactorizar la ventana de edicion de caracteristicas (hobbies, senas particulares) en los villanos
 */

abstract class EditarCaracteristicaVillanoWindow extends TransactionalDialog<CarmenSanDiegoAppModel>{
	
	List<String> params
	@Accessors
	Panel listPanel
	@Accessors
	Panel textBoxPanel
	
	new(WindowOwner owner, CarmenSanDiegoAppModel model, String pathTitle, String listLabel, String listSource) {
		super(owner, model)
		params = #[pathTitle, listLabel, listSource]
	}
	
	
	override createFormPanel(Panel mainPanel);
		
	/*
	 * Crea los widgets en comun de la vista
	 */
	def createMainPanelCaracVillano(Panel mainPanel){
		/// Titulo (imagen)
			new Label(mainPanel) => [
			bindImageToProperty(params.get(0), [ imagePath |
				new Image(imagePath)
												])
			]
		/// List panel
			listPanel = new Panel(mainPanel)
			new Label(listPanel).text = params.get(1)
		//// list
			new VillanoCaracteristicasList(listPanel, params.get(2))
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