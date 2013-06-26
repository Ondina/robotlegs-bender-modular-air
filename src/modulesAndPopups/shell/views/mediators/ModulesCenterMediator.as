package modulesAndPopups.shell.views.mediators
{
    import flash.display.DisplayObject;

    import modulesAndPopups.commons.controllers.events.ModulesLoaderEvent;
    import modulesAndPopups.commons.utils.generateUID;
    import modulesAndPopups.commons.views.components.DiagramsView;
    import modulesAndPopups.commons.views.components.ModulesLoaderView;
    import modulesAndPopups.commons.views.components.PopupView;
    import modulesAndPopups.shell.views.components.ModulesCenterView;

    import mx.core.FlexGlobals;
    import mx.managers.PopUpManager;

    import robotlegs.bender.bundles.mvcs.Mediator;
    import robotlegs.bender.extensions.viewManager.api.IViewManager;

    public class ModulesCenterMediator extends Mediator
    {
        [Inject]
        public var view:ModulesCenterView;

        [Inject]
        public var viewManager:IViewManager;

        override public function initialize():void
        {
            addViewListener(ModulesLoaderEvent.LOAD_SIMPLE_MODULE, dispatch, ModulesLoaderEvent);
            addViewListener(ModulesLoaderEvent.UNLOAD_SIMPLE_MODULE, dispatch, ModulesLoaderEvent);

            addViewListener(ModulesLoaderEvent.LOAD_DIAGRAM_IN_POPUP, onLoadDiagramInPopup, ModulesLoaderEvent);
            addViewListener(ModulesLoaderEvent.LOAD_MODULE_IN_POPUP, onLoadModuleInPopup, ModulesLoaderEvent);
        }

        //============================================================================
        // LOAD A MODULE IN A POPUP WINDOW
        //============================================================================
        private function onLoadModuleInPopup(event:ModulesLoaderEvent):void
        {
            var viewID:String = "ModuleLoader" + "_" + generateUID();

            var titleWindowInstance:PopupView = new PopupView();
            titleWindowInstance.x = 10;
            titleWindowInstance.y = 40;
            titleWindowInstance.title = "Module in Popup - " + viewID;

            //============================================================================
            // popup's child
            //============================================================================
            var moduleLoaderView:ModulesLoaderView = new ModulesLoaderView();
            moduleLoaderView.id = viewID;
            event.moduleLoaderVO.moduleLoaderID = viewID;

            //============================================================================
            // Add the titleWindowInstance to the viewManager BEFORE
            // adding children to it and BEFORE popping it up
            //============================================================================
            viewManager.addContainer(titleWindowInstance);

            titleWindowInstance.addElement(moduleLoaderView);
            moduleLoaderView.onLoadingModule(event.moduleLoaderVO);

            PopUpManager.addPopUp(titleWindowInstance, FlexGlobals.topLevelApplication as DisplayObject);
        }

        //============================================================================
        // DIAGRAMS IN A POPUP - duplicate code == bad!!
        //============================================================================
        private function onLoadDiagramInPopup(event:ModulesLoaderEvent):void
        {
            var titleWindowInstance:PopupView = new PopupView();
            titleWindowInstance.x = 10;
            titleWindowInstance.y = 40;
            titleWindowInstance.title = "Diagrams";

            //============================================================================
            // popup's child
            //============================================================================
            var diagramsView:DiagramsView = new DiagramsView();

            //============================================================================
            // Add the titleWindowInstance to the viewManager BEFORE
            // adding children to it and BEFORE popping it up
            //============================================================================
            viewManager.addContainer(titleWindowInstance);
            titleWindowInstance.addElement(diagramsView);
            PopUpManager.addPopUp(titleWindowInstance, FlexGlobals.topLevelApplication as DisplayObject);
        }
    }
}
