package modulesAndPopups.commons.controllers.events
{
    import flash.events.Event;

    import modulesAndPopups.commons.models.vos.MessagesVO;

    public class ModularConnectorEvent extends Event
    {
        public static const SHELL_TO_MODULES_MESSAGE:String = "shellToModulesMessage";

        public static const A_TO_B_MESSAGE:String = "aToBMessage";
        public static const B_TO_A_MESSAGE:String = "bToAMessage";

        public static const VIEW_TO_MEDIATOR_MESSAGE:String = "viewToMediatorMessage";

        private var _messagesVO:MessagesVO;

        public function ModularConnectorEvent(type:String, messagesVO:MessagesVO = null, bubbles:Boolean = true, cancelable:Boolean = false)
        {
            _messagesVO = messagesVO;
            super(type, bubbles, cancelable);
        }

        public function get messagesVO():MessagesVO
        {
            return _messagesVO;
        }

        override public function clone():Event
        {
            return new ModularConnectorEvent(type, messagesVO, bubbles, cancelable);
        }
    }
}
