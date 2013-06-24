package modulesAndPopups.modules.moduleA.views.mediators
{
    import modulesAndPopups.modules.moduleA.views.components.ModuleAView;
    import modulesAndPopups.commons.controllers.events.ModularConnectorEvent;

    import robotlegs.bender.bundles.mvcs.Mediator;


    public class ModuleAMediator extends Mediator
    {
        [Inject]
        public var view:ModuleAView;


        public function ModuleAMediator()
        {
            super();
        }

        override public function initialize():void
        {
            addViewListener(ModularConnectorEvent.VIEW_TO_MEDIATOR_MESSAGE, onMessageSent, ModularConnectorEvent);

            addContextListener(ModularConnectorEvent.B_TO_A_MESSAGE, onMessageReceived, ModularConnectorEvent);
            addContextListener(ModularConnectorEvent.SHELL_TO_MODULES_MESSAGE, onMessageReceived, ModularConnectorEvent);
        }

        private function onMessageSent(event:ModularConnectorEvent):void
        {
            dispatch(new ModularConnectorEvent(ModularConnectorEvent.A_TO_B_MESSAGE, event.messagesVO));
        }

        private function onMessageReceived(event:ModularConnectorEvent):void
        {
            view.onMessageReceived(event.messagesVO.message);
        }
    }
}
