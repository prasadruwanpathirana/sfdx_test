<aura:application >
	<h1>Hello Lightning App!</h1>
    <c:helloWorld />
     <aura:attribute name="whom" type="String" default="world"/>
    Hello {!v.whom}!
</aura:application>