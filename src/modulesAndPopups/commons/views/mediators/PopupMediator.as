package modulesAndPopups.commons.views.mediators
{
    import modulesAndPopups.commons.views.components.PopupView;

    import robotlegs.bender.bundles.mvcs.Mediator;
    import robotlegs.bender.extensions.viewManager.api.IViewManager;

    public class PopupMediator extends Mediator
    {
        [Inject]
        public var view:PopupView;

        [Inject]
        public var viewManager:IViewManager;

        override public function initialize():void
        {
        }

        override public function destroy():void
        {
            //============================================================================
            // remove popup from viewManager
            //============================================================================
            viewManager.removeContainer(view);
            super.destroy();
        }
    }
}
