package modulesAndPopups.shell.views.mediators
{
    import flash.display.DisplayObject;

    import modulesAndPopups.commons.utils.generateUID;
    import modulesAndPopups.commons.views.components.DiagramsView;
    import modulesAndPopups.commons.views.components.ModulesLoaderView;
    import modulesAndPopups.commons.views.components.PopupModuleView;
    import modulesAndPopups.shell.controllers.events.SomeShellEvent;
    import modulesAndPopups.shell.views.components.ShellLoaderView;

    import mx.core.FlexGlobals;
    import mx.managers.PopUpManager;

    import robotlegs.bender.bundles.mvcs.Mediator;
    import robotlegs.bender.extensions.viewManager.api.IViewManager;

    public class ShellPopupMediator extends Mediator
    {
        [Inject]
        public var view:ShellLoaderView;

        [Inject]
        public var viewManager:IViewManager;

        override public function initialize():void
        {
            addViewListener(SomeShellEvent.LOAD_DIAGRAM_POPUP, onLoadDiagramInPopup, SomeShellEvent);

            addViewListener(SomeShellEvent.LOAD_MODULE_IN_POPUP, onLoadModuleInPopup, SomeShellEvent);

            addViewListener(SomeShellEvent.LOAD_SIMPLE_MODULE, dispatch, SomeShellEvent);
            addViewListener(SomeShellEvent.UNLOAD_SIMPLE_MODULE, dispatch, SomeShellEvent);
        }

        //============================================================================
        // LOAD A MODULE IN A POPUP WINDOW
        //============================================================================
        private function onLoadModuleInPopup(event:SomeShellEvent):void
        {
            var viewID:String = "ModuleLoader" + "_" + generateUID();

            var titleWindowInstance:PopupModuleView = new PopupModuleView();
            titleWindowInstance.width = 270;
            titleWindowInstance.height = 250;
            titleWindowInstance.x = 10;
            titleWindowInstance.y = 40;
            titleWindowInstance.viewID = viewID;
            titleWindowInstance.title = "Module in Popup " + viewID;

            //============================================================================
            // popup's child
            //============================================================================
            var moduleLoaderView:ModulesLoaderView = new ModulesLoaderView();
            moduleLoaderView.x = 10;
            moduleLoaderView.y = 10;
            moduleLoaderView.id = viewID;

            //============================================================================
            // Add the titleWindowInstance to the viewManager BEFORE
            // adding children to it and BEFORE popping it up
            //============================================================================
            viewManager.addContainer(titleWindowInstance);
            titleWindowInstance.addElement(moduleLoaderView);
            PopUpManager.addPopUp(titleWindowInstance, FlexGlobals.topLevelApplication as DisplayObject);
        }

        //============================================================================
        // DIAGRAMS IN A POPUP - duplicate code == bad!!
        //============================================================================
        private function onLoadDiagramInPopup(event:SomeShellEvent):void
        {
            var viewID:String = "Diagram" + "_" + generateUID();

            var titleWindowInstance:PopupModuleView = new PopupModuleView();
            titleWindowInstance.width = 900;
            titleWindowInstance.height = 500;
            titleWindowInstance.x = 10;
            titleWindowInstance.y = 40;
            titleWindowInstance.viewID = viewID;
            titleWindowInstance.title = "Diagrams";

            //============================================================================
            // popup's child
            //============================================================================
            var diagramsView:DiagramsView = new DiagramsView();
            diagramsView.x = 2;
            diagramsView.y = 2;
            diagramsView.id = viewID;

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
