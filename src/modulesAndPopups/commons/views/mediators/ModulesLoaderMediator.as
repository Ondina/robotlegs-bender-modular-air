package modulesAndPopups.commons.views.mediators
{
    import modulesAndPopups.commons.views.components.ModulesLoaderView;
    import modulesAndPopups.shell.controllers.events.SomeShellEvent;

    import robotlegs.bender.bundles.mvcs.Mediator;

    public class ModulesLoaderMediator extends Mediator
    {
        [Inject]
        public var view:ModulesLoaderView;

        override public function initialize():void
        {
            addViewListener(SomeShellEvent.SIMPLE_MODULE_UNLOADED, dispatch, SomeShellEvent);

            addContextListener(SomeShellEvent.LOAD_SIMPLE_MODULE, onLoadingModule, SomeShellEvent);

            addContextListener(SomeShellEvent.UNLOAD_SIMPLE_MODULE, onUnloadingModule, SomeShellEvent);
        }

        private function onUnloadingModule(event:SomeShellEvent):void
        {
            if (view.id == event.moduleLoaderVO.moduleLoaderID)
                view.onUnloadingModule(event.moduleLoaderVO);
        }

        private function onLoadingModule(event:SomeShellEvent):void
        {
            view.onLoadingModule(event.moduleLoaderVO);
        }
    }
}
