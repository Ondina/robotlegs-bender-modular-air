package modulesAndPopups.commons.controllers.events
{
    import flash.events.Event;

    import modulesAndPopups.commons.models.vos.ModulesLoaderVO;

    public class ModulesLoaderEvent extends Event
    {
        public static const LOAD_MODULE_IN_POPUP:String = "loadModuleInPopup";

        public static const LOAD_SIMPLE_MODULE:String = "loadSimpleModule";

        public static const LOAD_DIAGRAM_IN_POPUP:String = "loadDiagramInPopup";

        public static const UNLOAD_SIMPLE_MODULE:String = "unloadSimpleModule";

        private var _moduleLoaderVO:ModulesLoaderVO;

        public function ModulesLoaderEvent(type:String, moduleLoaderVO:ModulesLoaderVO = null, bubbles:Boolean = false, cancelable:Boolean = false)
        {
            _moduleLoaderVO = moduleLoaderVO;
            super(type, bubbles, cancelable);
        }

        public function get moduleLoaderVO():ModulesLoaderVO
        {
            return _moduleLoaderVO;

        }

        override public function clone():Event
        {
            return new ModulesLoaderEvent(type, moduleLoaderVO, bubbles, cancelable);
        }
    }
}
