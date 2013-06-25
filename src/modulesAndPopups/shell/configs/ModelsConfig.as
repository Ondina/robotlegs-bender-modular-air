package modulesAndPopups.shell.configs
{
    import robotlegs.bender.framework.api.IConfig;
    import robotlegs.bender.framework.api.IInjector;

    public class ModelsConfig implements IConfig
    {
        [Inject]
        public var injector:IInjector;

        public function ModelsConfig()
        {
        }

        public function configure():void
        {
            //injector.map(SomeModel).asSingleton();
        }
    }
}
