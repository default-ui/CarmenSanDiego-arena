package components

import org.uqbar.arena.windows.WindowOwner
import org.uqbar.arena.widgets.Panel
import org.uqbar.commons.utils.Observable
import appModel.StringListAppModel
import java.util.List

//import org.uqbar.arena.widgets.List

class StringListWindow extends CustomSimpleWindow<StringListAppModel> {
	

	new(WindowOwner parent, Observable listOwner, String property, List<String> strings){
		super(parent, new StringListAppModel(listOwner, property, strings))
	}
	
	override addActions(Panel actionsPanel) {
		throw new UnsupportedOperationException("TODO: auto-generated method stub")
	}
	
	override createFormPanel(Panel mainPanel) {
		val list = new org.uqbar.arena.widgets.List<Observable>(mainPanel) => [
			bindItemsToProperty("property")
			bindValueToProperty("selectedProperty")
		]
	}
	
//	def showOn(Object builder) {
//		throw new UnsupportedOperationException("TODO: auto-generated method stub")
//	}
	
}