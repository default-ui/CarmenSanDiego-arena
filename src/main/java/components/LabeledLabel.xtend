package components

import org.uqbar.arena.widgets.Container
import org.uqbar.arena.widgets.Label

class LabeledLabel extends AbstractLabeledWidget {
	
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
