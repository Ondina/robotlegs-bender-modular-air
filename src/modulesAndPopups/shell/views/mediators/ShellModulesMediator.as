package modulesAndPopups.shell.views.mediators
{
    import modulesAndPopups.commons.controllers.events.ModularConnectorEvent;
    import modulesAndPopups.shell.views.components.ShellLoaderView;

    import robotlegs.bender.bundles.mvcs.Mediator;

    public class ShellModulesMediator extends Mediator
    {
        [Inject]
        public var view:ShellLoaderView; 

        override public function initialize():void
        {
            addViewListener(ModularConnectorEvent.VIEW_TO_MEDIATOR_MESSAGE, onMessageSent, ModularConnectorEvent);

            addContextListener(ModularConnectorEvent.A_TO_B_MESSAGE, onMessageReceived, ModularConnectorEvent);
            addContextListener(ModularConnectorEvent.B_TO_A_MESSAGE, onMessageReceived, ModularConnectorEvent);
        }

        private function onMessageSent(event:ModularConnectorEvent):void
        {
            dispatch(new ModularConnectorEvent(ModularConnectorEvent.SHELL_TO_MODULES_MESSAGE, event.messagesVO));
        }

        private function onMessageReceived(event:ModularConnectorEvent):void
        {
            view.onMessageReceived(event.messagesVO.message);
        }
    }
}
