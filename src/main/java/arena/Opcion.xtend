package arena

import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.utils.Observable
import org.uqbar.lacar.ui.model.Action

@Accessors
@Observable
class Opcion {
	
	String descripcion
	Action action
	
	new(String descripcion, Action action) {
		this.descripcion = descripcion
		this.action = action
	}
	
}
