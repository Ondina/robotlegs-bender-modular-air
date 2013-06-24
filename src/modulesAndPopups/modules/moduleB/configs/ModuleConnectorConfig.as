package modulesAndPopups.modules.moduleB.configs
{
    import modulesAndPopups.commons.controllers.events.ModularConnectorEvent;

    import robotlegs.bender.extensions.modularity.api.IModuleConnector;
    import robotlegs.bender.framework.api.IConfig;

    public class ModuleConnectorConfig implements IConfig
    {
        [Inject]
        public var moduleConnector:IModuleConnector;

        public function configure():void
        {
            trace("ModuleConnectorConfig.configure() ModuleB");
			//============================================================================
			// MODULE B LISTENS onDefaultChannel for Shell's event
			//============================================================================
            moduleConnector.onDefaultChannel()
                .receiveEvent(ModularConnectorEvent.SHELL_TO_MODULES_MESSAGE);
			
			//============================================================================
			// MODULE B dispatches on 'A-and-B' channel  
			//============================================================================
            moduleConnector.onChannel('A-and-B')
                .relayEvent(ModularConnectorEvent.B_TO_A_MESSAGE);
			
			//============================================================================
			// MODULE B LISTENS on 'A-and-B' channel for ModuleA's event
			//============================================================================
            moduleConnector.onChannel('A-and-B')
                .receiveEvent(ModularConnectorEvent.A_TO_B_MESSAGE);
        }
    }
}
