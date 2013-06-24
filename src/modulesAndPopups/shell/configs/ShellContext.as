package modulesAndPopups.shell.configs
{
    import flash.display.DisplayObjectContainer;
    
    import robotlegs.bender.bundles.mvcs.MVCSBundle;
    import robotlegs.bender.extensions.contextView.ContextView;
    import robotlegs.bender.framework.api.IContext;
    import robotlegs.bender.framework.impl.Context;

    public class ShellContext
    {
        private var context:IContext;
		//============================================================================
		//
		// docs: https://github.com/robotlegs/robotlegs-framework/blob/master/src/robotlegs/bender/framework/readme-context.md
		//
		// The "contextView" should always be provided as the final configuration as it may trigger context initialization.
		//
		//============================================================================
        public function ShellContext(view:DisplayObjectContainer)
        {
            trace("ShellConfig.ShellConfig(contextView)");
            context = new Context()
                .install(MVCSBundle)
                .configure(MediatorsConfig, ModuleConnectorConfig, new ContextView(view));				
        }
    }
}
