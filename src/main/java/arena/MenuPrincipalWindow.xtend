package arena

import org.uqbar.arena.widgets.Button
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.windows.Window
import org.uqbar.arena.windows.WindowOwner

class MenuPrincipalWindow extends Window<MenuPrincipalModel> {
	
	new(WindowOwner owner, MenuPrincipalModel model) {
		super(owner, model)
	}
	
	override createContents(Panel mainPanel) {
		this.modelObject.opciones.forEach [ opcion |
			new Button(mainPanel) => [ 
				caption = opcion.descripcion
				onClick(opcion.action)
			]
		]	
	}
	
}
