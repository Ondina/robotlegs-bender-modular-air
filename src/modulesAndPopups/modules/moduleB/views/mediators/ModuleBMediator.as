package modulesAndPopups.modules.moduleB.views.mediators
{
    import modulesAndPopups.commons.controllers.events.ModularConnectorEvent;
    import modulesAndPopups.commons.views.components.IModuleView;

    import robotlegs.bender.bundles.mvcs.Mediator;

    public class ModuleBMediator extends Mediator
    {
        [Inject]
        public var view:IModuleView;

        override public function initialize():void
        {
            addViewListener(ModularConnectorEvent.VIEW_TO_MEDIATOR_MESSAGE, onMessageSent, ModularConnectorEvent);

            addContextListener(ModularConnectorEvent.B_TO_A_MESSAGE, onMessageReceived, ModularConnectorEvent);
            addContextListener(ModularConnectorEvent.A_TO_B_MESSAGE, onMessageReceived, ModularConnectorEvent);

            addContextListener(ModularConnectorEvent.SHELL_TO_MODULES_MESSAGE, onMessageReceived, ModularConnectorEvent);
        }

        private function onMessageSent(event:ModularConnectorEvent):void
        {
            dispatch(new ModularConnectorEvent(ModularConnectorEvent.B_TO_A_MESSAGE, event.messagesVO));
        }

        private function onMessageReceived(event:ModularConnectorEvent):void
        {
            if (view.viewID != event.messagesVO.viewID)
                view.onMessageReceived(event.messagesVO.message);
        }
    }
}
