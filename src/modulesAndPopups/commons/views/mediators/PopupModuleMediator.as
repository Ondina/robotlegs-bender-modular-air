package modulesAndPopups.commons.views.mediators
{
    import modulesAndPopups.commons.models.vos.ModuleLoaderVO;
    import modulesAndPopups.commons.views.components.PopupModuleView;
    import modulesAndPopups.shell.controllers.events.SomeShellEvent;

    import robotlegs.bender.bundles.mvcs.Mediator;
    import robotlegs.bender.extensions.viewManager.api.IViewManager;

    public class PopupModuleMediator extends Mediator
    {
        [Inject]
        public var view:PopupModuleView;

        [Inject]
        public var viewManager:IViewManager;

        override public function initialize():void
        {
            addViewListener(SomeShellEvent.UNLOAD_SIMPLE_MODULE, dispatch, SomeShellEvent);

            var moduleLoaderVO:ModuleLoaderVO = new ModuleLoaderVO();
            moduleLoaderVO.moduleURL = "modulesAndPopups/modules/moduleB/views/components/ModuleCView.swf";
            moduleLoaderVO.moduleLoaderID = view.viewID;

            dispatch(new SomeShellEvent(SomeShellEvent.LOAD_SIMPLE_MODULE, moduleLoaderVO));
        }

        override public function destroy():void
        {
            viewManager.removeContainer(view);
            super.destroy();
        }
    }
}
