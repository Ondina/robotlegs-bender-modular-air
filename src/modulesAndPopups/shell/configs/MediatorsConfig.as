package modulesAndPopups.shell.configs
{
    import modulesAndPopups.commons.views.components.ModulesLoaderView;
    import modulesAndPopups.commons.views.components.PopupModuleView;
    import modulesAndPopups.commons.views.mediators.ModulesLoaderMediator;
    import modulesAndPopups.commons.views.mediators.PopupModuleMediator;
    import modulesAndPopups.shell.views.components.ModulesCenterView;
    import modulesAndPopups.shell.views.components.ShellMessagesView;
    import modulesAndPopups.shell.views.mediators.ModuleCenterMediator;
    import modulesAndPopups.shell.views.mediators.ShellMessagesMediator;

    import robotlegs.bender.extensions.mediatorMap.api.IMediatorMap;
    import robotlegs.bender.framework.api.IConfig;

    public class MediatorsConfig implements IConfig
    {
        [Inject]
        public var mediatorMap:IMediatorMap;

        public function configure():void
        {
            mediatorMap.map(ModulesCenterView).toMediator(ModuleCenterMediator);
            mediatorMap.map(ShellMessagesView).toMediator(ShellMessagesMediator);

            mediatorMap.map(ModulesLoaderView).toMediator(ModulesLoaderMediator);
            mediatorMap.map(PopupModuleView).toMediator(PopupModuleMediator);
        }
    }
}
