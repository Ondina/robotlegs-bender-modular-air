package modulesAndPopups.modules.moduleA.configs
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
            trace("ModuleConnectorConfig.configure() ModuleA");
            //============================================================================
            // MODULE A LISTENS onDefaultChannel for Shell's event
            //============================================================================
            moduleConnector.onDefaultChannel()
                .receiveEvent(ModularConnectorEvent.SHELL_TO_MODULES_MESSAGE);
            //============================================================================
            // MODULE A dispatches on 'A-and-B' channel
            //============================================================================
            moduleConnector.onChannel('A-and-B')
                .relayEvent(ModularConnectorEvent.A_TO_B_MESSAGE);
            //============================================================================
            // MODULE A LISTENS on 'A-and-B' channel for ModuleB's event
            //============================================================================
            moduleConnector.onChannel('A-and-B')
                .receiveEvent(ModularConnectorEvent.B_TO_A_MESSAGE);
        }
    }
}
