package modulesAndPopups.commons.views.components
{

    public interface IModuleView
    {
        function onMessageReceived(value:String):void;

        function set viewID(value:String):void;
        function get viewID():String;
    }
}
