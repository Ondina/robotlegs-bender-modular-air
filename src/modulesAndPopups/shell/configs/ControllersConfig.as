package modulesAndPopups.shell.configs
{
	
	import robotlegs.bender.extensions.eventCommandMap.api.IEventCommandMap;
	import robotlegs.bender.framework.api.IConfig;

	public class ControllersConfig  implements IConfig
	{
		[Inject]
		public var commandMap:IEventCommandMap;
		
		public function ControllersConfig()
		{
		}
		public function configure():void
		{			
			//commandMap.map(ShellNavigatorEvent.TRIGGER_GUARDED_COMMAND, ShellNavigatorEvent).toCommand(GuardedCommand).withGuards(SomeCommandGuard);			
		}
	}
}