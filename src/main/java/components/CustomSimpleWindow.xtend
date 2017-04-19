package components

import org.uqbar.arena.layout.HorizontalLayout
import org.uqbar.arena.layout.VerticalLayout
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.windows.Window
import org.uqbar.arena.windows.WindowOwner
import org.uqbar.ui.view.ErrorViewer

/**
 * Ventana que no implementa {@link ErrorViewer}
 */
abstract class CustomSimpleWindow<T> extends Window<T> {
	
	new(WindowOwner parent, T model) {
		super(parent, model)
	}
	
	// ********************************************************
	// ** Contents
	// ********************************************************

	override createContents(Panel mainPanel) {
		this.configureLayout(mainPanel);
		this.createMainTemplate(mainPanel);
	}

	// ********************************************************
	// ** Abstract methods
	// ********************************************************

	def void addActions(Panel actionsPanel);

	def void createFormPanel(Panel mainPanel);

	// ********************************************************
	// ** Window layout template
	// ********************************************************

	def protected void createMainTemplate(Panel mainPanel) {
		createFormPanel(mainPanel);
		createActionsPanel(mainPanel);
	}

	def protected void configureLayout(Panel mainPanel) {
		mainPanel.setLayout(new VerticalLayout());
	}

	def protected void createActionsPanel(Panel mainPanel) {
		var actionsPanel = new Panel(mainPanel);
		actionsPanel.setLayout(new HorizontalLayout());
		addActions(actionsPanel);
	}

}
