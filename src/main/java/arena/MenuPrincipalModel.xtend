package arena

import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors

import arena.VerPaises
import arena.WidgetApplication
import arena.Opcion

@Accessors
class MenuPrincipalModel {

	List<Opcion> opciones = newArrayList
	
	new(WidgetApplication app) {
		opciones.add(new Opcion("Mapamundi", [ | new VerPaisesWindow(app, new VerPaises).open ]))

	}	
}
