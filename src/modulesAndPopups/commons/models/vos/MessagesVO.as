package modulesAndPopups.commons.models.vos
{

    public class MessagesVO
    {
        private var _viewID:String;
        private var _message:String;

        public function MessagesVO()
        {
        }

        public function get viewID():String
        {
            return _viewID;
        }

        public function set viewID(value:String):void
        {
            _viewID = value;
        }

        public function get message():String
        {
            return _message;
        }

        public function set message(value:String):void
        {
            _message = value;
        }
    }
}
