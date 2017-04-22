package components

import org.uqbar.arena.widgets.Container
import org.uqbar.arena.widgets.Label
import org.eclipse.xtend.lib.annotations.Accessors

class LabeledLabel extends AbstractLabeledWidget {
	
	@Accessors
	Label label
	
	new(Container container) {
		super(container)
	}
	
	override createWidget(AbstractLabeledWidget widget) {
		label = new Label(this)
		label.fontSize = 14
		this
	}
	
	override bindValueToProperty(String property) {
		label.bindValueToProperty(property)
		this
	}
	
}
