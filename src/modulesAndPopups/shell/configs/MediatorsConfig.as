package modulesAndPopups.shell.configs
{
    import modulesAndPopups.commons.views.components.ModulesLoaderView;
    import modulesAndPopups.commons.views.components.PopupModuleView;
    import modulesAndPopups.commons.views.mediators.ModulesLoaderMediator;
    import modulesAndPopups.commons.views.mediators.PopupModuleMediator;
    import modulesAndPopups.shell.views.components.ShellLoaderView;
    import modulesAndPopups.shell.views.mediators.ShellModulesMediator;
    import modulesAndPopups.shell.views.mediators.ShellPopupMediator;

    import robotlegs.bender.extensions.mediatorMap.api.IMediatorMap;
    import robotlegs.bender.framework.api.IConfig;

    public class MediatorsConfig implements IConfig
    {
        [Inject]
        public var mediatorMap:IMediatorMap;

        public function configure():void
        {
            //just wanted to see how it works having multiple mediators for a view:
            mediatorMap.map(ShellLoaderView).toMediator(ShellPopupMediator);
            mediatorMap.map(ShellLoaderView).toMediator(ShellModulesMediator);

            mediatorMap.map(ModulesLoaderView).toMediator(ModulesLoaderMediator);
            mediatorMap.map(PopupModuleView).toMediator(PopupModuleMediator);
        }
    }
}
