package modulesAndPopups.commons.controllers.events
{
    import flash.events.Event;

    import modulesAndPopups.commons.models.vos.ModuleLoaderVO;

    public class ModulesLoaderEvent extends Event
    {
        public static const LOAD_MODULE_IN_POPUP:String = "loadModuleInPopup";

        public static const LOAD_SIMPLE_MODULE:String = "loadSimpleModule";

        public static const LOAD_DIAGRAM_POPUP:String = "loadDiagramPopup";

        public static const UNLOAD_SIMPLE_MODULE:String = "unloadSimpleModule";

        //public static const SIMPLE_MODULE_UNLOADED:String = "simpleModuleUnloaded";

        private var _moduleLoaderVO:ModuleLoaderVO;

        public function ModulesLoaderEvent(type:String, moduleLoaderVO:ModuleLoaderVO = null, bubbles:Boolean = false, cancelable:Boolean = false)
        {
            _moduleLoaderVO = moduleLoaderVO;
            super(type, bubbles, cancelable);
        }

        public function get moduleLoaderVO():ModuleLoaderVO
        {
            return _moduleLoaderVO;
			
        }

        override public function clone():Event
        {
            return new ModulesLoaderEvent(type, moduleLoaderVO, bubbles, cancelable);
        }
    }
}
