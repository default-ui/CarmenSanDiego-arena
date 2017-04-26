package csdExceptions

import java.awt.Color
import javax.swing.ImageIcon
import javax.swing.JFrame
import javax.swing.JOptionPane
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.utils.Observable
import org.uqbar.arena.windows.Dialog
import appModel.MapamundiAppModel
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.widgets.Label

@Observable
@Accessors
class NombreDePaisNoIngresado extends Dialog<MapamundiAppModel> {
//	JFrame panel = new JFrame()
//	ImageIcon icon = new ImageIcon("src/main/resources/iconsd.png")
//	
//	def mostrarError(){
//		panel.setBackground = Color.WHITE
//		JOptionPane.showMessageDialog(panel,
//        "No le vas a poner nombre al país???",
//        "Hey!!",
//        JOptionPane.ERROR_MESSAGE,
//        icon)
//		}
		
		override protected createFormPanel(Panel mainPanel) {
//			throw new UnsupportedOperationException("TODO: auto-generated method stub")
			new Label(mainPanel).text = "No has ingresado ningún dato!"
		}
		
	}