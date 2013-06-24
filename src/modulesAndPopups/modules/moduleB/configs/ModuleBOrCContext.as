package modulesAndPopups.modules.moduleB.configs
{
    import flash.display.DisplayObjectContainer;

    import robotlegs.bender.bundles.mvcs.MVCSBundle;
    import robotlegs.bender.extensions.contextView.ContextView;
    import robotlegs.bender.framework.api.IContext;
    import robotlegs.bender.framework.impl.Context;

    public class ModuleBOrCContext
    {
        private var context:IContext;

        public function ModuleBOrCContext(rootDisplayObject:DisplayObjectContainer)
        {
            trace("ModuleBContext");
            context = new Context()
                .install(MVCSBundle)
                .configure(MediatorsConfig, ModuleConnectorConfig)
                .configure(new ContextView(rootDisplayObject));
        }
    }
}
