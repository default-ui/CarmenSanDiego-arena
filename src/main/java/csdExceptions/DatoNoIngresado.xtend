package csdExceptions

import appModel.MapamundiAppModel
import javax.swing.ImageIcon
import javax.swing.JFrame
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.arena.widgets.Label
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.windows.Dialog
import org.uqbar.commons.utils.Observable

@Observable
@Accessors
class DatoNoIngresado extends Dialog<MapamundiAppModel>{
	JFrame panel = new JFrame()
	ImageIcon icon = new ImageIcon("src/main/resources/iconsd.png")
	
		override addActions(Panel actionsPanel) {
		}
		
		override createFormPanel(Panel mainPanel) {
			new Label(mainPanel).text = "No has ingresado ningún dato!"
		}
		
	}