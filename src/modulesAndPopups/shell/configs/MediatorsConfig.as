package modulesAndPopups.shell.configs
{
    import modulesAndPopups.commons.views.components.ModulesLoaderView;
    import modulesAndPopups.commons.views.components.PopupView;
    import modulesAndPopups.commons.views.mediators.ModulesLoaderMediator;
    import modulesAndPopups.commons.views.mediators.PopupMediator;
    import modulesAndPopups.shell.views.components.ModulesCenterView;
    import modulesAndPopups.shell.views.components.ShellMessagesView;
    import modulesAndPopups.shell.views.mediators.ModulesCenterMediator;
    import modulesAndPopups.shell.views.mediators.ShellMessagesMediator;

    import robotlegs.bender.extensions.mediatorMap.api.IMediatorMap;
    import robotlegs.bender.framework.api.IConfig;

    public class MediatorsConfig implements IConfig
    {
        [Inject]
        public var mediatorMap:IMediatorMap;

        public function configure():void
        {
            mediatorMap.map(ModulesCenterView).toMediator(ModulesCenterMediator);
            mediatorMap.map(ShellMessagesView).toMediator(ShellMessagesMediator);

            mediatorMap.map(ModulesLoaderView).toMediator(ModulesLoaderMediator);
            mediatorMap.map(PopupView).toMediator(PopupMediator);
        }
    }
}
