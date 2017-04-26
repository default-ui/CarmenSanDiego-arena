package csdExceptions

import java.awt.Color
import javax.swing.ImageIcon
import javax.swing.JFrame
import javax.swing.JOptionPane
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.utils.Observable

@Observable
@Accessors
class DemasiadosLugaresException {
	JFrame panel = new JFrame()
	ImageIcon icon = new ImageIcon("src/main/resources/iconsd.png")
	
	def mostrarError(){
		panel.setBackground = Color.WHITE
		JOptionPane.showMessageDialog(panel,
        "No puedes agregar más lugares!",
        "Hey!!",
        JOptionPane.ERROR_MESSAGE,
        icon)
		}
	}