package modulesAndPopups.modules.moduleA.configs
{
    import modulesAndPopups.modules.moduleA.views.components.ModuleAView;
    import modulesAndPopups.modules.moduleA.views.mediators.ModuleAMediator;

    import robotlegs.bender.extensions.mediatorMap.api.IMediatorMap;
    import robotlegs.bender.framework.api.IConfig;

    public class MediatorsConfig implements IConfig
    {
        [Inject]
        public var mediatorMap:IMediatorMap;

        public function configure():void
        {
            mediatorMap.map(ModuleAView).toMediator(ModuleAMediator);
        }
    }
}
