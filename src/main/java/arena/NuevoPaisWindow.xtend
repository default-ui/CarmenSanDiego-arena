package arena
import org.uqbar.arena.windows.Dialog
import org.uqbar.arena.widgets.Panel
import appModel.CrearPaisAppModel
import org.uqbar.arena.windows.WindowOwner
import carmenSanDiego.Pais

class NuevoPaisWindow extends Dialog<CrearPaisAppModel> {
	
	new(WindowOwner owner, CrearPaisAppModel model) {
		super(owner, model)
	}
	
	override protected createFormPanel(Panel mainPanel) {
		throw new UnsupportedOperationException("TODO: auto-generated method stub")
	}
	
	
}