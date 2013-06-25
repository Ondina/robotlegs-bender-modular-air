package modulesAndPopups.commons.views.mediators
{
    import modulesAndPopups.commons.views.components.ModulesLoaderView;
    import modulesAndPopups.commons.controllers.events.ModulesLoaderEvent;

    import robotlegs.bender.bundles.mvcs.Mediator;

    public class ModulesLoaderMediator extends Mediator
    {
        [Inject]
        public var view:ModulesLoaderView;

        override public function initialize():void
        {
            addContextListener(ModulesLoaderEvent.LOAD_SIMPLE_MODULE, onLoadingModule, ModulesLoaderEvent);
            addContextListener(ModulesLoaderEvent.UNLOAD_SIMPLE_MODULE, onUnloadingModule, ModulesLoaderEvent);
            //addViewListener(SomeShellEvent.SIMPLE_MODULE_UNLOADED, dispatch, SomeShellEvent);
        }

        private function onUnloadingModule(event:ModulesLoaderEvent):void
        {
            if (view.id == event.moduleLoaderVO.moduleLoaderID)
                view.onUnloadingModule(event.moduleLoaderVO);
        }

        private function onLoadingModule(event:ModulesLoaderEvent):void
        {
            view.onLoadingModule(event.moduleLoaderVO);
        }
    }
}
