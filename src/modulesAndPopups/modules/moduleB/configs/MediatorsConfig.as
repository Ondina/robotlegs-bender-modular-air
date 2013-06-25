package modulesAndPopups.modules.moduleB.configs
{
    import modulesAndPopups.commons.views.components.IModuleView;
    import modulesAndPopups.modules.moduleB.views.mediators.ModuleBMediator;

    import robotlegs.bender.extensions.mediatorMap.api.IMediatorMap;
    import robotlegs.bender.framework.api.IConfig;

    public class MediatorsConfig implements IConfig
    {
        [Inject]
        public var mediatorMap:IMediatorMap;

        public function configure():void
        {
            mediatorMap.map(IModuleView).toMediator(ModuleBMediator);
        }
    }
}
