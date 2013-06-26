robotlegs-bender-modular-air
============================

An AIR 3.7 application demonstrating the use of multiple Contexts with the Robotlegs AS3 micro-architecture - version 2

WIP 
<h3>Modules, multiple Contexts and the ModularConnector (WIP)</h3>
<p>In this demo the <strong>Shell</strong> loads 2 (Flex) Modules, <strong>Module_A</strong> and <strong>Module_B</strong>, and a popup window (Flex TitleWindow), which also loads a module, <strong>Module_C</strong>. </p>
<p>The Contexts communicate with each other through 2 ‘channels’, a named channel '<strong>A-and-B</strong>', and a <strong>default channel</strong>.</p>
<p>The steps for enabling the multi contextual communication: 
</p>
<p>First of all, you need a contextView, a <a href="https://github.com/robotlegs/robotlegs-framework/blob/master/src/robotlegs/bender/framework/readme-context.md">Context</a> and the <a href=" https://github.com/robotlegs/robotlegs-framework/tree/master/src/robotlegs/bender/extensions/modularity ">ModularityExtension</a> (included in the <a href="https://github.com/robotlegs/robotlegs-framework/tree/master/src/robotlegs/bender/bundles/mvcs">MVCSBundle</a>). </p>
<h4>contextView </h4>
<p>Let’s look at Module A’s root Display Object Container <a href="https://github.com/Ondina/robotlegs-bender-modular-air/blob/master/src/modulesAndPopups/modules/moduleA/views/components/ModuleAView.mxml">ModuleAView</a>, which will be used as the "contextView" for this Context.
</p>
<pre><code>
private var _robotlegsContext:ModuleAContext;
private function creationCompleteHandler(event:FlexEvent):void
{
        _robotlegsContext = new ModuleAContext(this);
}
</code></pre>
<h4>ModuleAContext </h4>
<pre><code>
public function ModuleAContext(view:DisplayObjectContainer)
{
    context = new Context() //1
        .install(MVCSBundle) //2
        .configure(MediatorsConfig, ModuleConnectorConfig) //3
        .configure(new ContextView(view)); //4
}
</code></pre>
<ol>
  <li>creates a Context</li>
  
  <li>installs the ModularityExtension (included in the MVCSBundle already)</li>
  
  <li>configures the communication channels (ModuleConnectorConfig)</li>
</ol>
<h4>ModuleConnectorConfig</h4>
<pre><code>
moduleConnector.onDefaultChannel()
        .receiveEvent(ModularConnectorEvent.SHELL_TO_MODULES_MESSAGE);
moduleConnector.onChannel('A-and-B')
       .relayEvent(ModularConnectorEvent.A_TO_B_MESSAGE);
moduleConnector.onChannel('A-and-B')
        .receiveEvent(ModularConnectorEvent.B_TO_A_MESSAGE);
</code></pre>
<div class="image">
<img src="https://raw.github.com/Ondina/robotlegs-bender-modular-air/master/assets/ModuleAAndBConnector.png"/></div>
<ol start="4">
  <li>  provides a contextView (ModuleAView)</li>
  <li>dispatch events to other Contexts
  <pre><code>
    dispatch(new ModularConnectorEvent(ModularConnectorEvent.A_TO_B_MESSAGE, event.messagesVO));
    </code></pre></li>
  <li>listen to events from other Contexts
  <pre><code>
    addContextListener(ModularConnectorEvent.B_TO_A_MESSAGE, onMessageReceived, ModularConnectorEvent);</code></pre></li>
</ol>
<h4>Mediators </h4>
<div class="image">
  <img src="https://raw.github.com/Ondina/robotlegs-bender-modular-air/master/assets/ModuleAandBCommunication.png"/>
</div>
<h4>Shell, Module A and B Connector Configs</h4>
<div class="image">
  <img src="https://raw.github.com/Ondina/robotlegs-bender-modular-air/master/assets/ModuleConectorConfig.png"/>
</div>
<p>&nbsp;</p>
<div class="image">
<img src="https://raw.github.com/Ondina/robotlegs-bender-modular-air/master/assets/ModulesAndShellEvents.png"/>
</div>
<p>&nbsp;</p>
<p>To be continued...</p>
