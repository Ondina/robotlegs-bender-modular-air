package modulesAndPopups.shell.configs
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
            trace("ModuleConnectorConfig.configure() SHELLL");

            //============================================================================
            // SHELL TO MODULES CHANNEL
            //============================================================================
            moduleConnector.onDefaultChannel()
                .relayEvent(ModularConnectorEvent.SHELL_TO_MODULES_MESSAGE);

            //============================================================================
            // SHELL LISTENS ON CHANNEL A-and-B for A_TO_B_MESSAGE
            //============================================================================
            moduleConnector.onChannel('A-and-B')
                .receiveEvent(ModularConnectorEvent.A_TO_B_MESSAGE);

            //============================================================================
            // SHELL LISTENS ON CHANNEL A-and-B for B_TO_A_MESSAGE
            //============================================================================
            moduleConnector.onChannel('A-and-B')
                .receiveEvent(ModularConnectorEvent.B_TO_A_MESSAGE);
        }
    }
}
